#!/bin/bash
PSQL="psql -U freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ ! -z $1 ]]
  then
    # Error message
    echo -e "\n$1"
  else
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi

  # Display a list of services
  echo "$($PSQL "SELECT service_id, name FROM services")" | while read -r SERVICE_LINE
  do
    echo $SERVICE_LINE | sed 's/|/) /'
  done
  
  read SERVICE_ID_SELECTED

  # If service is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    SERVICE="$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")"
    if [[ $SERVICE ]]
    then
      REGISTER_APPOINTMENT $SERVICE_ID_SELECTED $SERVICE
    else
      # If service not exists
      MAIN_MENU "I could not find that service. What would you like today?"
    fi
  fi

}

REGISTER_APPOINTMENT() {
  SERVICE_ID=$1
  SERVICE_NAME=$2

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # Check if customer is registered
  CUSTOMER_NAME="$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")"

  # If not registered, register
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    CUSTOMER_RESULT="$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")"
  fi

  # Get customer id
  CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")"
  
  # Ask for appointment time
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  # Insert appointment to DB
  APPOINTMENT_RESULT="$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")"
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU

