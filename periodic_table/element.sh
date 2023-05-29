PSQL="psql -U freecodecamp -d periodic_table -t --no-align -c"

# If no args, return "Please provide an element as an argument."
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0
fi

# Get info if arg is atomic_number
if [[ $1 =~ ^[0-9]+$ ]]
then
  QUERY_CONDITION="atomic_number=$1"

# Get info if arg is name
elif [[ $1 =~ ^[A-Z][a-z][a-z]+$ ]]
then
  QUERY_CONDITION="name='$1'"

# Get info if arg is symbol
elif [[ $1 =~ ^[A-Z][a-z]?$ ]]
then
  QUERY_CONDITION="symbol='$1'"
else
  echo "I could not find that element in the database."
  exit 0
fi

Q_RES=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE $QUERY_CONDITION")

if [[ -z $Q_RES ]]
then
  echo "I could not find that element in the database."
  exit 0
fi
ARR=(${Q_RES//|/ })
ATOMIC_NUMBER=${ARR[0]}
EL_SYMBOL=${ARR[1]}
EL_NAME=${ARR[2]}
EL_MASS=${ARR[3]}
MELTING_POINT=${ARR[4]}
BOILING_POINT=${ARR[5]}
EL_TYPE=${ARR[6]}

echo "The element with atomic number $ATOMIC_NUMBER is $EL_NAME ($EL_SYMBOL). It's a $EL_TYPE, with a mass of $EL_MASS amu. $EL_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
