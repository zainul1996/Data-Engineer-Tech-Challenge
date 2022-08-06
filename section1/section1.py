import argparse
import csv
import os
import time

from crontab import CronTab

parser = argparse.ArgumentParser()
parser.add_argument(
    "--setup",
    help="Setup cron job to preprocess data every day at 12:00 AM",
    action="store_true",
)
parser.add_argument(
    "--preprocess",
    help="Preprocess the data and write to output.csv",
    action="store_true",
)
args = parser.parse_args()


def setup_cron():
    print("Setting up cron job...")
    cron = CronTab(user=True)
    working_directory = os.getcwd()
    script_directory = os.path.join(working_directory, "section1.py --preprocess")

    job = cron.new(command=f"python3 {script_directory}")
    job.minute.on(0)
    job.hour.on(12)
    cron.write()


def process(name, price):
    # Split the name field into first_name, and last_name
    # name can be in the format of "first_name last_name" or "prefix first_name last_name"
    name_parts = name.split(" ")
    if len(name_parts) == 2:
        first_name = name_parts[0]
        last_name = name_parts[1]
    else:
        first_name = name_parts[1]
        last_name = name_parts[2]

    # if price is above 100, set above_100 to true
    above_100 = False
    if float(price) > 100:
        above_100 = True

    # write first_name, last_name, price, above_100 to output.csv including a header row
    with open("output.csv", "a") as output:
        writer = csv.writer(output, delimiter=",")
        if output.tell() == 0:
            writer.writerow(["first_name", "last_name", "price", "above_100"])
        writer.writerow([first_name, last_name, price, above_100])


def preprocess():
    start_time = time.time()
    print("Preprocessing started...")
    removed = 0
    total = 0
    # if output file exists, ask user if they want to overwrite it
    if os.path.exists("output.csv"):
        overwrite = input("Output file already exists. Overwrite? (y/n) ")
        if overwrite == "y":
            os.remove("output.csv")
        else:
            print("Exiting...")
            exit()

    # merge dataset1.csv and dataset2.csv
    with open("dataset1.csv", "r") as dataset1, open("dataset2.csv", "r") as dataset2:
        # read dataset1.csv skipping the header row
        reader1 = csv.reader(dataset1, delimiter=",")
        next(reader1)
        reader2 = csv.reader(dataset2, delimiter=",")
        next(reader2)

        for row in reader1:
            name = row[0]
            try:
                # Remove any zeros prepended to the price field
                price = float(row[1].lstrip("0"))
            except ValueError:
                removed += 1
                continue

            # trim whitespace from each element in the row
            # check if row has 2 elements, non empty name and valid price
            if len(row) >= 2 and name.strip() != "" and price:
                total += 1
                process(name, price)
            else:
                removed += 1
                continue

        for row in reader2:
            name = row[0]
            try:
                # Remove any zeros prepended to the price field
                price = float(row[1].lstrip("0"))
            except ValueError:
                removed += 1
                continue

            # trim whitespace from each element in the row
            # check if row has 2 elements, non empty name and valid price
            if len(row) >= 2 and name.strip() != "" and price:
                total += 1
                process(name, price)
            else:
                removed += 1
                continue

        print(f"{removed + total} total rows")
        print(f"{removed} rows removed")
        print(f"{total} rows written to output.csv")
    print(f"Preprocessing completed in {time.time() - start_time} seconds")


if args.setup:
    setup_cron()
elif args.preprocess:
    preprocess()
else:
    print("No arguments provided")
    print("Please use --setup or --preprocess")
    print("Exiting...")
    exit()
