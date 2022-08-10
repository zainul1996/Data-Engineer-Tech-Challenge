# Data Engineer Tech Challenge

## Introduction

This repository contains the 6 sections of the Data Engineer Tech Challenge.

P.S I am having exams and couldn't spend too much time on this challenge. I did my best with the time I have.

## Section 1: Data Pipelines

Developed a python script with 2 subparsers, setup and process.

    Commands                            Description
    python3 section1.py --help          Show help message
    python3 section1.py setup           Create cron job that would run process every day at 12:00am and overwrites existing output.csv.
    python3 section1.py process         Run the process portion that would carry out the the data processing.
        Available arguments:
        --overwrite(default: y)                 y - Overwrite the output file if it already exists.
                                                n - Do not overwrite the output file if it already exists.

        --output_file(default: output.csv)      Path to the output file.

Logs with timestamps will be stored in logs.txt and will be persisted for the purpose of debugging/history.

## Section 2: Databases

Contains 6 tables in the database (check ERD_diagram.png for visual representation of the database):

- Customer id(primary key), name, mobileNo
- Salesperson - id(primary key), name
- Transaction - id(primary key), salesPersonId(foreign key), customerId(foreign key), datetimeCreated
- Cars - id(primary key), serialNo, price, weight, transactionId(foreign key), carModelId(foreign key)
- CarModel - id(primary key), modelName, manufacturerId
- Manufacturer - id(primary key),name

3 Select Statements Created:

- Select top 3 manufacturers with the highest number of cars sold in the current month. (selectTopThreeManufacturers.sql)
- Select salespeople and their total sales in descending order. (selectTopSalesperson.sql)
- Select customers and their total spent amount in descending order. (selectTopSpendingCustomers.sql)

1 Insert Statement Created:

- Inserts mock data for testing Select statements. (insertMockData.sql)

Instructions to setup

    Setup Postgres DB and create tables
    docker build -t my-postgres-db ./
    docker run -d --name my-postgresdb-container -p 5432:5432 my-postgres-db

    Setup pgadmin4
    docker pull dpage/pgadmin4
    docker run --name my-pgadmin -p 82:80 -e 'PGADMIN_DEFAULT_EMAIL=pgadmin@gmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=postgresmaster' -d
    dpage/pgadmin4

    Visit localhost:82 on your browser and login with:
    username: pgadmin@gmail.com
    password: postgresmaster

    Right click "Server" > Click "Register" > "Server"
    Under the General Tab:
    Name: postgres_db

    Under the connection tab:
    Hostname/Address: {Enter the IP of the Container running postgres}
    Port: 5432
    Username: postgres
    Password: postgres

    To find out the IP of the Container running postgres, use the below command:
    docker inspect my-postgresdb-container -f "{{json .NetworkSettings.Networks}}"

## Section 3: System Design

Designed an architecture diagram for the given problem using AWS tools as I'm currently studying for the AWS Certified Cloud Practitioner exam. Used a combination of AWS Lambda, AWS dynamoDB, and AWS S3 to implement the architecture. The system will be able to log down the required information in dynamoDB as its being stored in S3.

## Section 4: Charts and APIs

Developed a simple web application to visualise Covid-19 data of Singapore in a single chart using chartJS. An image of the vizualisation is also included.

## Section 5: Machine Learning

I have developed a Decision Tree Classifier with an accuracy of 30% on the test set. Tried various method of encoding the data and dropped the person column to increase the accuracy. Unable to find the best parameters for the model.

## Section 6: What is Data Engineering?

I have chosen to focus on question 2 which is "Explain the value of using any Data Engineering concepts or technology needed to the solve data silos". Everything is included in the DataEngineering.pdf
