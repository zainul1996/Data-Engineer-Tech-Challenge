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
