#!/bin/bash

read SERVICE

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

SERVICE_NAME=PSQL($PSQL "SELECT name,service_id FROM services")
echo -e "\nAvailable services $SERVICE_NAME"