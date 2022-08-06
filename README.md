# Data Engineer Tech Challenge

## Introduction

This repository contains the 6 sections of the Data Engineer Tech Challenge.

## Section 1: Data Pipelines

Developed a simple script with 2 arguments, --setup and --preprocess.

    Commands to run:
    python3 section1.py --setup
    python3 section1.py --preprocess

Running the script with --setup will create the cron job that would trigger every day at 12:00am to run the preprocess script.

Running the script with --preprocess will run the preprocess portion that would carry out the the data processing.

Output will be stored as output.csv in the section1 directory.

## Section 3: System Design

Designed an architecture diagram for the given problem using AWS tools as I'm currently studying for the AWS Certified Cloud Practitioner exam. Used a combination of AWS Lambda, AWS dynamoDB, and AWS S3 to implement the architecture. The system will be able to log down the required information in dynamoDB as its being stored in S3.

## Section 4: Charts and APIs

Developed a simple web application to visualise Covid-19 data of Singapore in a single chart using chartJS. An image of the vizualisation is also included.

## Section 6: What is Data Engineering?

I have chosen to focus on question 2 which is "Explain the value of using any Data Engineering concepts or technology needed to the solve data silos". Everything is included in the DataEngineering.pdf
