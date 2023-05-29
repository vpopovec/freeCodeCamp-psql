#!/bin/bash
PSQL="psql -U freecodecamp -d number_guess -t --no-align -c"

RAND_NUM=$((1 + $RANDOM % 1000))

# Prompt "Enter your username:"
while true; do
  echo "Enter your username:"
  read USERNAME
  # Check username is < 22 chars
  if (( ${#USERNAME} <= 22  )); then break; fi

  echo -e "Username is too long, use up to 22 characters."
done

# Check if username is registered...
PLAYER_ID=$($PSQL "SELECT player_id FROM player WHERE name='$USERNAME'")
if [[ -z $PLAYER_ID ]]
then
  # Welcome and register user 
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  ADD_USER_RES=$($PSQL "INSERT INTO player(name) VALUES('$USERNAME')")
  PLAYER_ID=$($PSQL "SELECT player_id FROM player WHERE name='$USERNAME'")
else
  # Welcome user and give overview
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM game WHERE player_id=$PLAYER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(tries) FROM game WHERE player_id=$PLAYER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "Guess the secret number between 1 and 1000:"
ATTEMPTS=1
while read GUESSED_NUMBER; do
  # Check user input valid
  if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  elif [[ $GUESSED_NUMBER -lt 1 || $GUESSED_NUMBER -gt 1000 ]]; then
    echo "Number is not withing range of 1 and 1000, guess again:"
    continue
  fi

  # Increment counter
  ((ATTEMPTS++))

  # Verify guessed number
  if [[ $GUESSED_NUMBER -eq $RAND_NUM ]]; then
    ADD_GAME_RES=$($PSQL "INSERT INTO game(player_id, tries) VALUES($PLAYER_ID, $ATTEMPTS)")
    echo "You guessed it in $ATTEMPTS tries. The secret number was $RAND_NUM. Nice job!"
    exit 0
  elif [[ $GUESSED_NUMBER -lt $RAND_NUM ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESSED_NUMBER -gt $RAND_NUM ]]; then
    echo "It's lower than that, guess again:"
  fi
done
