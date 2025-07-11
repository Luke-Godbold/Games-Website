CREATE TABLE user (
    u_id  INTEGER PRIMARY KEY AUTOINCREMENT, 
    u_name VARCHAR(30) NOT NULL,
    email TEXT NOT NULL,
    passw TEXT NOT NULL
);
CREATE TABLE operators (
    op_id  INTEGER PRIMARY KEY AUTOINCREMENT, 
    op_name TEXT NOT NULL,
    m_units TEXT NOT NULL,
    playstyles TEXT NOT NULL   
);
-- INSERT INTO operators
--     (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2)
-- VALUES 
--     (Sledge, SAS, soft-breacher),
--     (Thatcher, SAS, anti-gadget),
--     (Smoke, SAS, area-denial),
--     (Mute, SAS, intel-denial),
--     (Ash, FBI, fragger),
--     (Thermite, FBI, hard-breacher),
--     (Castle, FBI, setup),
--     (Pulse, FBI, roamer),
--     (Twitch, GIGN, anti-gadget),
--     (Montagne, GIGN, )
CREATE TABLE favourites (
    fv_id  INTEGER PRIMARY KEY AUTOINCREMENT, 
    u_id INTEGER NOT NULL,
    op_id INTEGER NOT NULL,
    FOREIGN KEY (u_id) REFERENCES user(u_id),
    FOREIGN KEY (op_id) REFERENCES user(op_id)
);
CREATE TABLE forums(
    f_id  INTEGER PRIMARY KEY AUTOINCREMENT, 
    u_id INTEGER NOT NULL,
    reply TEXT NOT NULL,
    FOREIGN KEY (u_id) REFERENCES user(u_id)
    
);
CREATE TABLE quiz (
    q_id  INTEGER PRIMARY KEY AUTOINCREMENT, 
    u_id INTEGER NOT NULL,
    answers TEXT NOT NULL,
    FOREIGN KEY (u_id) REFERENCES user(u_id)
    
);
ALTER TABLE operators
  ADD side TEXT NOT NULL;

CREATE TABLE operators (
    op_id INTEGER PRIMARY KEY AUTOINCREMENT,
    org_name TEXT NOT NULL,
    op_name TEXT NOT NULL,
    op_role TEXT NOT NULL,
    primary_gun1 TEXT NOT NULL,
    primary_gun2 TEXT NOT NULL,
    primary_gun3 TEXT NOT NULL,
    secondary_gun1 TEXT NOT NULL,
    secondary_gun2 TEXT NOT NULL,
    gadget1 TEXT NOT NULL,
    gadget2 TEXT NOT NULL
);



INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES 
('APCA','AMARU','ATTACKER','G8A1','SUPERNOVA','ITA12S','SMG-11','None','CLAYMORE','STUN GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('APCA','GOYO','DEFENDER','VECTOR .45 ACP','TCSG12','P229','None','None','IMPACT GRENADE','NITRO CELL');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('JAEGER CORPS','NOKK','ATTACKER','FMG-9','SIX12 SD','5.7 USG','D-50','None','CLAYMORE','BREACH CHARGE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('JAEGER CORPS','WARDEN','DEFENDER','M590A1','MPX','P-10C','SMG-12','None','DEPLOYABLE SHIELD','BARBED WIRE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('SASR','MOZZIE','DEFENDER','COMMANDO 9','P10 RONI','SUPER SHORTY','SDP 9MM','None','BARBED WIRE','NITRO CELL');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('SASR','GRIDLOCK','ATTACKER','F90','M249 SAW','SUPER SHORTY','SDP 9MM','None','SMOKE GRENADE','BREACH CHARGE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('GIGR','NOMAD','ATTACKER','AK-74M','ARX200','.44 MAG SEMI-AUTO','None','None','STUN GRENADE','BREACH CHARGE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('GIGR','KAID','DEFENDER','AUG A3','TCSG12','.44 MAG SEMI-AUTO','None','None','NITRO CELL','IMPACT GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('MPS','CLASH','DEFENDER','CCE SHIELD','P-10C','SPSMG9','None','None','BARBED WIRE','IMPACT GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('MPS','MAVERICK','ATTACKER','AR-15.50','M4','1911 TACOPS','None','None','STUN GRENADE','CLAYMORE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('G.I.S.','MAESTRO','DEFENDER','ALDA 5.56','ACS12','BAILIFF 410','KERATOS .357','None','BARBED WIRE','IMPACT GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('G.I.S.','ALIBI','DEFENDER','MX4 STORM','ACS12','KERATOS .357','BAILIFF 410','None','IMPACT GRENADE','DEPLOYABLE SHIELD');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('GIGN','LION','ATTACKER','V308','417','SG-CQB','P9','LFP586','STUN GRENADE','CLAYMORE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('GIGN','FINKA','ATTACKER','SPEAR .308','6P41','SASG-12','PMM','GSH-18','BREACH CHARGE','FRAG GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('707TH SMB','VIGIL','DEFENDER','K1A','BOSG.12.2','C75 AUTO','SMG-12','None','BULLETPROOF CAMERA','IMPACT GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('707TH SMB','DOKKAEBI','ATTACKER','MK 14 EBR','BOSG.12.2','None','C75 AUTO','SMG-12','SMOKE GRENADE','FRAG GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('G.R.O.M.','ZOFIA','ATTACKER','LMG-E','M765','None','RG15','None','BREACH CHARGE','CLAYMORE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('G.R.O.M.','ELA','DEFENDER','SCORPION EVO 3 A1','F0-12','None','RG16','None','BARBED WIRE','DEPLOYABLE SHIELD');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('S.D.U.','YING','ATTACKER','T-95 LSW','SIX12','None','Q-929','None','BREACH CHARGE','CLAYMORE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('S.D.U.','LESION','DEFENDER','SIX12 SD','T-5 SMG','None','Q-929','None','IMPACT GRENADE','BULLETPROOF CAMERA');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('G.E.O.','MIRA','DEFENDER','VECTOR .45 ACP','ITA12L','None','USP40','ITA12S','BARBED WIRE','NITRO CELL');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('G.E.O.','JACKAL','ATTACKER','C7E','PDW9','ITA12L','USP40','ITA12S','BREACH CHARGE','SMOKE GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('S.A.T.','HIBANA','ATTACKER','TYPE-89','SUPERNOVA','None','P229','BEARING 9','STUN GRENADE','BREACH CHARGE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('S.A.T.','ECHO','DEFENDER','SUPERNOVA','MP5SD','None','P229','BEARING 9','DEPLOYABLE SHIELD','BARBED WIRE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('BOPE','CAVEIRA','DEFENDER','M12','SPAS-15','None','LUISON','None','IMPACT GRENADE','BULLETPROOF CAMERA');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('BOPE','CAPITAO','ATTACKER','PARA-308','M249','None','PRB92','None','CLAYMORE','STUN GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('NAVY SEAL','BLACKBEARD','ATTACKER','MK17 CQB','SR-25','None','D-50','None','BREACH CHARGE','STUN GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('NAVY SEAL','VALKYRIE','DEFENDER','MPX','SPAS-12','None','D-50','None','DEPLOYABLE SHIELD','NITRO CELL');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('JTF2','BUCK','ATTACKER','C8-SFW','CAMRS','None','MK1 9MM','None','STUN GRENADE','FRAG GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('JTF2','FROST','DEFENDER','SUPER 90','9MM C1','None','MK1 9MM','None','BULLETPROOF CAMERA','DEPLOYABLE SHIELD');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('SAS','MUTE','DEFENDER','MP5K','M690A1','None','P226 MK 25','SMG-11','NITRO CELL','BULLETPROOF CAMERA');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('SAS','SLEDGE','ATTACKER','M590A1','L85A2','None','P226 MK 25','SMG-11','FRAG GRENADE','STUN GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('SAS','SMOKE','DEFENDER','FMG-9','M590A1','None','P226 MK 25','SMG-11','BARBED WIRE','DEPLOYABLE SHIELD');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('SAS','THATCHER','ATTACKER','AR33','L85A2','M590A1','P226 MK 25','None','BREACH CHARGE','CLAYMORE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('SWAT','ASH','ATTACKER','G36C','R4-C','None','M45 MEUSOC','5.7 USG','BREACH CHARGE','STUN GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('SWAT','CASTLE','DEFENDER','UMP45','M1014','None','5.7 USG','M45 MEUSOC','BULLETPROOF CAMERA','IMPACT GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('SWAT','PULSE','DEFENDER','M1014','UMP45','None','M45 MEUSOC','5.7 USG','BARBED WIRE','NITRO CELL');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('SWAT','THERMITE','ATTACKER','M1014','556XI','None','M45 MEUSOC','5.7 USG','CLAYMORE','STUN GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('GIGN','MONTAGNE','ATTACKER','LE ROC','None','None','P9','LFP586','STUN GRENADE','SMOKE GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('GIGN','TWITCH','ATTACKER','F2','417','SG-CQB','P9','LFP586','CLAYMORE','BREACH CHARGE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('GIGN','DOC','DEFENDER','SG-CQB','MP5','P90','P9','LFP586','BULLETPROOF CAMERA','BARBED WIRE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('GIGN','ROOK','DEFENDER','P90','MP5','SG-CQB','LFP586','P9','BARBED WIRE','IMPACT GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('GSG9','JAGER','DEFENDER','M870','416-C CARABINE','None','P12','None','BULLETPROOF CAMERA','BARBED WIRE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('GSG10','BANDIT','DEFENDER','MP7','M870','None','P12','None','BARBED WIRE','NITRO CELL');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('GSG11','BLITZ','ATTACKER','G52-TACTICAL SHIELD','None','None','P12','None','SMOKE GRENADE','BREACH CHARGE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('GSG12','IQ','ATTACKER','AUG A2','552 COMMANDO','G8A1','P12','None','BREACH CHARGE','CLAYMORE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('SPETSNAZ','FUZE','ATTACKER','BALLISTIC SHIELD','6P41','AK-12','PMM','GSH-18','BREACH CHARGE','SMOKE GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('SPETSNAZ','GLAZ','ATTACKER','OTS-03','None','None','GSH-18','PMM','SMOKE GRENADE','FRAG GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('SPETSNAZ','TACHANKA','DEFENDER','SASG-12','9X19VSN','None','GSH-18','PMM','BARBED WIRE','DEPLOYABLE SHIELD');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('SPETSNAZ','KAPKAN','DEFENDER','9X19VSN','SASG-12','None','PMM','GSH-18','IMPACT GRENADE','NITRO CELL');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('NIGHTHAVEN','KALI','ATTACKER','CSRX 300','None','None','P226 MK25','C75 AUTO','BREACH CHARGE','CLAYMORE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('NIGHTHAVEN','WAMAI','DEFENDER','AUG A2','MP5K','None','KERATOS .357','P12','BARBED WIRE','DEPLOYABLE SHIELD');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('REU','IANA','ATTACKER','ARX200','G36C','None','MK1 9MM','None','FRAG GRENADE','SMOKE GRENADE');
INSERT INTO operators (org_name, op_name, op_role, primary_gun1, primary_gun2, primary_gun3, secondary_gun1, secondary_gun2, gadget1, gadget2) VALUES
 ('UNAFFILIATED','ORYX','DEFENDER','MP5','SPAS-12','None','BAILIFF 410','USP40','BARBED WIRE','BULLETPROOF CAMERA');