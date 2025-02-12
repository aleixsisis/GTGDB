

INSERT INTO Guesses (review) VALUES
            ('this game is qwesome'),
            ('this game is agesome'),
            ('thdis game is awesome'),
            ('thiss game is pawesome'),
            ('thiss game is awesoue'),
            ('this sgame is awesome'),
            ('this game is awessome'),
            ('this game is awesssome'),
            ('this cgame is awesome'),
            ('this sgame is awesome');



--ALTER TABLE GUESSES
  ADD review;


--INSERT INTO Users (username, password) VALUES
            ('donkey', 'scrypt:32768:8:1$ZIUB1D5lCNl2GZ5w$4de3cadd75e3f03617e0c7423a3aab85a84fd9dea009295ce41d438e52da3cbc0b64def6ecbaaef13255c4918585c15e6c313d8d98d64f37c37d22b3e25bf04e'),
            ('scrible', 'scrypt:32768:8:1$YfnN0EtmRGYdDphU$6803d35904ca054bc23232df87abd76ec9fe75eae8fe21301146f8bcfc1649715a787e218cb2a7463ab1d11b4e0186cf0541144aaf554d022cd9fc9395b2cae8'),
            ('joyce', 'scrypt:32768:8:1$LaSx68XLEuZ1TWJU$0aa3b35c461bcf8343554773d6a3957b7b22af7a902403b5f7e1574d42b4e7630959b483af7a5d22e3bc1659ccd6eb1209917c8537417fddc1e6960bb43a4b04'),
            ('homer', 'scrypt:32768:8:1$FdOgvhXqmAAY5465$192fa886bc701dd88b4b73be9ee356af23c83fc9918fcfa8cb40cbc65ff3c31f0d99ac02fd12f6c2b218ef8a518055b1391ef02a5456daa277711d7ee5c02a05'),
            ('garten', 'scrypt:32768:8:1$19yCXh84aS6I31Z3$9cf8bf32640359830b8bac6a8f8ea46ca4c6f78dbc607769ea887c9415bd7c8754dad12cdc41c9570fa849b3a26a0d55aedaca2f770ac7ea74342f5728686109');




--INSERT INTO Guesses (user_id, date, score, game) VALUES
            ('1', '2025-10-23', '3', 'Alien Isolation'),
            ('1', '2025-09-12', '2', 'Starship Troopers'),
            ('2', '1997-05-25', '6', 'Zenless Zone Zero'),
            ('2', '1998-03-18', '0', 'Zelda Ocarina of Time'),
            ('3', '2007-05-25', '1', 'Warcraft III'),
            ('3', '2013-03-24', '3', 'Dead Space 2'),
            ('4', '2015-05-04', '5', 'HiFi Rush'),
            ('4', '2023-05-02', '3', 'Palword'),
            ('5', '1999-09-13', '3', 'House for DS'),
            ('5', '2001-01-06', '2', 'Counter Strike Global Offensive');






--CREATE TABLE Guesses (id  INTEGER PRIMARY KEY AUTOINCREMENT,
                        user_id INTEGER,
                        date TEXT NOT NULL, 
                        score INTEGER,
                        game TEXT NOT NULL);

--CREATE TABLE Users (id INTEGER PRIMARY KEY AUTOINCREMENT,
                        username TEXT NOT NULL,
                        password TEXT NOT NULL)

                    