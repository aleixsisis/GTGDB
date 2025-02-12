import sqlite3
from werkzeug.security import generate_password_hash, check_password_hash
from flask import Flask, render_template, request, redirect, url_for, app, get_db_connection



def GetDB():

    # Connect to the database and return the connection object
    db = sqlite3.connect(".database/gtg.db")
    db.row_factory = sqlite3.Row

    return db

def GetAllGuesses():

    # Connect, query all guesses and then return the data
    db = GetDB()
    guesses = db.execute("SELECT * FROM Guesses").fetchall()
    guesses = db.execute("""SELECT Guesses.date, Guesses.game, Guesses.score, Guesses.review, Users.username
                            FROM Guesses JOIN Users ON Guesses.user_id = Users.id
                            ORDER BY date DESC""").fetchall()
    db.close()
    return guesses


def CheckLogin(username, password):

    db = GetDB()

    # Ask the database for a single user matching the provided name
    user = db.execute("SELECT * FROM Users WHERE username=? COLLATE NOCASE", (username,)).fetchone()

    # Do they exist?
    if user is not None:
        # OK they exist, is their password correct
        if check_password_hash(user['password'], password):
            # They got it right, return their details 
            return user
        
    # If we get here, the username or password failed.
    return None

def RegisterUser(username, password):

    # Check if they gave us a username and password
    if username is None or password is None:
        return False

    # Attempt to add them to the database
    db = GetDB()
    hash = generate_password_hash(password)
    db.execute("INSERT INTO Users(username, password) VALUES(?, ?)", (username, hash,))
    db.commit()

    return True

def AddGuess(user_id, date, game, score, review):
   
    # Check if any boxes were empty
    if date is None or game is None:
        return False
   
    # Get the DB and add the guess
    db = GetDB()
    db.execute("INSERT INTO Guesses(user_id, date, game, score, review) VALUES (?, ?, ?, ?, ?)",
               (user_id, date, game, score, review))
    db.commit()
    
    
# Update Guess
@app.route('/guesses/update/<int:user_id>', methods=['GET', 'POST'])
def update_guess(user_id):
    db = get_db_connection()
    if request.method == 'POST':
        # Get data from form
        score = request.form['score']
        review = request.form['review']

        # Update the database
        db.execute('UPDATE Guesses SET score = ?, review = ? WHERE user_id = ?',
                   (score, review, user_id))
        db.commit()
        db.close()

        return redirect(url_for('get_guess', user_id=user_id))  # Redirect to view updated guess

    # If it's a GET request, retrieve current data for form
    guess = db.execute('SELECT * FROM Guesses WHERE user_id = ?', (user_id,)).fetchone()
    db.close()

    if guess:
        return render_template('update_guess.html', guess=guess)  # Render the update form
    else:
        return 'No guess found for this user_id', 404
    
    
    

    return True
