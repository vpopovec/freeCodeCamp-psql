#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Delete previously inserted data
echo "$($PSQL "TRUNCATE TABLE games, teams")"

# Function to insert team (if necessary) and get its id
function insertTeamAndGetId() {
  # Check if team is already registered
  TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$1'")"
  if [[ -z $TEAM_ID ]]
  then
    # If not, add team
    TEAM_RESULT="$($PSQL "INSERT INTO teams(name) VALUES('$1')")"
    if [[ $TEAM_RESULT == "INSERT 0 1" ]]
    then
      # Get team_id
      TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$1'")"
    fi
  fi
  echo $TEAM_ID
}

cat games.csv | while IFS=, read -r YEAR ROUND WINNER OPPONENT WIN_GOALS OPP_GOALS
do
  # INSTEAD OF FOR LOOP ADD A FUNCTION, THEN CALL WINNER_ID=GET_TEAM_ID($WINNER) etc.
  if [[ $WINNER == 'winner' ]]; then continue; fi
  echo "WINNER $WINNER OPPONENT $OPPONENT"
  WINNER_ID=$(insertTeamAndGetId "$WINNER")
  OPPONENT_ID=$(insertTeamAndGetId "$OPPONENT")

  # Insert into games
  echo "$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WIN_GOALS, $OPP_GOALS)")"

done
