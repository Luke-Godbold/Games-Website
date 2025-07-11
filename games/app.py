from flask import Flask, render_template, session, request, url_for, redirect
from dotenv import load_dotenv
import os
import sqlite3

load_dotenv("SECRET.env")

app = Flask(__name__)
app.secret_key = os.getenv("SECRET_KEY")

@app.route("/")
@app.route("/home")
def home ():
    return render_template("index.html")
#Test
@app.route("/signin", methods=["POST","GET"])
def signin ():
    conn =sqlite3.connect("database.db")
    cur = conn.cursor()
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")

        one = cur.execute("SELECT u_name,passw,u_id FROM user")
        oneRes = one.fetchall()

        valid = False
        for i in oneRes:
            if username == i[0] and password == i[1]:
                u_id =i[2]
                valid = True
        
        if valid == True:
            session['username'] = username
            session['logged_in'] = True
            session['u_id'] = u_id
            return render_template("index.html")
        else:
            return render_template("signin.html", error = "Username or password is not correct")
    else:
        return render_template("signin.html")

@app.route("/signup", methods=["POST","GET"])
def signup ():
    conn =sqlite3.connect("database.db")
    cur = conn.cursor()
    if request.method == "POST":
        username = request.form.get("user")

        one = cur.execute("SELECT u_name FROM user")
        oneRes = one.fetchall()
        valid = True
        for i in oneRes:
            if username == i[0]:
                valid = False
                return render_template("signup.html", error = "Username already in use")

        email = request.form.get("email")
        password = request.form.get("password")
        c_password = request.form.get("c_password")
        

        if password == c_password and valid == True:
            cur.execute(f"INSERT INTO user (u_name, passw, email) VALUES ('{username}','{password}','{email} ')")
            conn.commit()
            return render_template("signin.html")
        else:
            return render_template("signup.html", error = "Password do not match")
    else:
        return render_template("signup.html")

@app.route("/favourites", methods=["POST","GET"])
@app.route("/favourites/<error>", methods=["POST","GET"])
def favourites (**error):
    conn =sqlite3.connect("database.db")
    cur = conn.cursor()
    if 'logged_in' in session:
        if request.method == "POST":
            op = request.form.get("op").upper()

            
            one = cur.execute("SELECT op_name FROM operators")
            oneRes = one.fetchall()
            names = [item[0] for item in oneRes]
            
            if op in names:
                print(op)

                one = cur.execute("SELECT op_id FROM operators WHERE op_name == ?", (op,))
                op_id = one.fetchall()
                
                u_id = session["u_id"]
                op_id = op_id[0][0]

                one = cur.execute(f"SELECT * FROM favourites WHERE op_id == {op_id} AND u_id == {u_id}")
                oneRes = one.fetchall()
                print(oneRes)

                if len(oneRes) == 0:

                    cur.execute(f"INSERT INTO favourites (u_id, op_id) VALUES ('{u_id}','{op_id}')")
                    conn.commit()

                    return redirect("/favourites")
                else:
                    return redirect("/favourites/You can only favourite an operator once")
            else:
                return redirect("/favourites/Operator not found")
        
        else:
            u_id = session["u_id"]
            one = cur.execute("SELECT op_id FROM favourites WHERE u_id ==?", (u_id,))
            oneRes = one.fetchall()

            ids = [item[0] for item in oneRes]

            name =[]
            for i in ids:
                one = cur.execute("SELECT op_name FROM operators WHERE op_id ==?", (i,))
                oneRes = one.fetchall()
                name.append(oneRes)
            
            names = [item[0][0] for item in name]
            print(names)

            if error:
                return render_template("favourites.html", names = names, error=error)
            else:
                return render_template("favourites.html", names = names)
    else:
        return redirect("/signin")

@app.route("/remove/<op>")
def remove(op):
    conn =sqlite3.connect("database.db")
    cur = conn.cursor()
    u_id = session["u_id"]

    one = cur.execute("SELECT op_id FROM operators WHERE op_name ==?", (op,))
    oneRes = one.fetchall()
    oneRes = oneRes[0][0]

    cur.execute(f"DELETE FROM favourites WHERE u_id == {u_id} AND op_id == {oneRes}")
    conn.commit()
    return redirect("/favourites")

@app.route("/operators")
def operators ():
    conn =sqlite3.connect("database.db")
    cur = conn.cursor()
    one = cur.execute("SELECT op_name FROM operators")
    oneRes = one.fetchall()
    names = [item[0] for item in oneRes]
    print(names)
    return render_template("operators.html", names = names)

@app.route("/quiz")
def quiz ():
    return render_template("quiz.html")

@app.route("/forum", methods=["POST","GET"])
def forum():
    if "logged_in" in session and "u_id" in session:
        conn = sqlite3.connect("database.db")
        cur = conn.cursor()

        if request.method == "POST":
            chat = request.form.get("text1")
            u_id = session['u_id']
            cur.execute(f"INSERT INTO forums (u_id, reply) VALUES ('{u_id}','{chat}')")
            conn.commit()

        one = cur.execute("SELECT reply FROM forums")
        oneRes = one.fetchall()
        history = oneRes
        username = cur.execute("SELECT forums.f_id, user.u_name, forums.reply FROM forums INNER JOIN user ON forums.u_id=user.u_id")
        # msg = cur.execute(f"SELECT u_name from {username}")
        fetch = username.fetchall()
        print(fetch)

        return render_template("Forum.html", history = history, fetch=fetch)
    
    return render_template("Forum.html")

    
@app.route("/signout")
def signout():
    session.pop("username")
    session.pop("logged_in")
    session.pop("u_id")
    return redirect("/signin")

@app.route("/attackers")
def attackers():
    conn =sqlite3.connect("database.db")
    cur = conn.cursor()
    one = cur.execute("SELECT op_name FROM operators WHERE op_role == 'ATTACKER'")
    oneRes = one.fetchall()
    names = [item[0] for item in oneRes]
    urls = ["https://www.ubisoft.com/en-gb/game/rainbow-six/siege/game-info/operators/"+item[0].lower() for item in oneRes]
    one = cur.execute("SELECT * FROM operators WHERE op_role == 'ATTACKER'")
    oneRes = one.fetchall()

    

    return render_template("operators.html",op = "Attackers", names=names, data = oneRes, urls=urls)

@app.route("/defenders")
def defenders():
    conn =sqlite3.connect("database.db")
    cur = conn.cursor()
    one = cur.execute("SELECT op_name FROM operators WHERE op_role == 'DEFENDER'")
    oneRes = one.fetchall()
    names = [item[0] for item in oneRes]
    # urls = ["https://www.ubisoft.com/en-gb/game/rainbow-six/siege/game-info/operators/"+item[0].lower() for item in oneRes]
    print(names)
    

    return render_template("operators.html", names=names, op="Defenders")

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404


if __name__ == "__main__":
    app.run()