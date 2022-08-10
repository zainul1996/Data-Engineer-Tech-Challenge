import argparse
import csv
import logging
import os
import time

from crontab import CronTab


def setup_cron():
    logging.info("Setting up cron job...")
    cron = CronTab(user=True)
    working_directory = os.getcwd()
    script_directory = os.path.join(
        working_directory, "section1.py process --overwrite y"
    )

    job = cron.new(command=f"python3 {script_directory}")
    job.minute.on(0)
    job.hour.on(12)
    cron.write()
    logging.info("Cron job setup completed")


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
    with open(f"{args.output_file}", "a") as output:
        writer = csv.writer(output, delimiter=",")
        if output.tell() == 0:
            writer.writerow(["first_name", "last_name", "price", "above_100"])
        writer.writerow([first_name, last_name, price, above_100])


def main_process():
    start_time = time.time()
    removed = 0
    total = 0

    # if output file exists, ask user if they want to overwrite it
    if os.path.exists(f"{args.output_file}"):
        if args.overwrite == "y":
            logging.info("Removing output.csv")
            os.remove(f"{args.output_file}")
        elif args.overwrite == "n":
            logging.info("File already exists")
            logging.info("Exiting...")
            exit()
        else:
            logging.info("Invalid overwrite option")
            logging.info("Exiting...")
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

        logging.info(f"{removed + total} total rows")
        logging.info(f"{removed} rows removed")
        logging.info(f"{total} rows written to output.csv")

    logging.info(f"Processing completed in {time.time() - start_time} seconds")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="mode", required=True)
    m1_parser = subparsers.add_parser(
        "setup",
        help="Setup cron job to run everyday at 12am to process dataset1.csv and dataset2.csv",
    )
    m2_parser = subparsers.add_parser(
        "process",
        help="process dataset1.csv and dataset2.csv",
    )
    m2_parser.add_argument(
        "--output_file", type=str, required=False, default="output.csv"
    )
    m2_parser.add_argument("--overwrite", type=str, required=False, default="n")

    logger = logging.getLogger()
    logger.setLevel(logging.INFO)
    file_handler = logging.FileHandler("logs.txt")
    LOG_FORMAT = "%(asctime)s | %(levelname)s: %(message)s"
    formatter = logging.Formatter(LOG_FORMAT)
    file_handler.setFormatter(formatter)
    logger.addHandler(file_handler)

    current_datetime = time.strftime("%Y-%m-%d %H:%M:%S")
    args = parser.parse_args()
    if args.mode == "setup":
        logging.info(f"Setting up cron job...")
        setup_cron()
    elif args.mode == "process":
        logging.info(f"Processing data...")
        main_process()
    else:
        logging.info(f"Invalid mode provided")
        exit()
