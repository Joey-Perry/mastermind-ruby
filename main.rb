# Is there a user interface? No it's on the command line
# What inputs will your program have? Will the user enter data?
# user will enter colors and try to guess the secret code
# What's the desired output?
# accurate feedback in regards to the secret code based on the user input
# Given your inputs, what are the steps necessary to return the desired output?

#computer must create a secret code. 
#secret code is a random assortment of four colors selected out of a possible six (red, yellow, blue, green, white, black)
#human player will enter their guess: four colors separated by a comma
#game will parse the response, compare it to the secret code and
    # if one of the guesses is in the correct spot then game will indicate 'on fire'
    # if one of the guesses is in the wrong spot but still included in the secret code then game will indicate 'warm'
#game continues until 12 turns have passed or the player has correctly guessed the secret code

#needed objects: codemaker (creates secret code), codebreaker (human player), game (manages the flow)
#codemaker : create secret code, determines how close the guesses are to the secret code
#codebreaker : keeps track of tuns
#game : 