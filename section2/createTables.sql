CREATE TABLE IF NOT EXISTS public."Manufacturer"
(
    id serial NOT NULL,
    name varchar(255) NOT NULL,
    CONSTRAINT "Manufacturer_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."CarModel"
(
    id serial NOT NULL,
    name varchar(255) NOT NULL,
    "manufacturerId" integer NOT NULL,
    CONSTRAINT "CarModel_pkey" PRIMARY KEY (id),
    CONSTRAINT "CarModel_manufacturerId_fkey" FOREIGN KEY ("manufacturerId")
        REFERENCES public."Manufacturer" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE IF NOT EXISTS public."Salesperson"
(
    id serial NOT NULL,
    name varchar(255) NOT NULL,
    CONSTRAINT "Salesperson_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."Customer"
(
    id serial NOT NULL,
    name varchar(255) NOT NULL,
    "mobileNo" integer NOT NULL,
    CONSTRAINT "Customer_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."Transaction"
(
    id serial NOT NULL,
    "salespersonId" integer NOT NULL,
    "customerId" integer NOT NULL,
    "datetimeCreated" timestamp with time zone NOT NULL,
    CONSTRAINT "Transaction_pkey" PRIMARY KEY (id),
    CONSTRAINT "Transaction_customerId_fkey" FOREIGN KEY ("customerId")
        REFERENCES public."Customer" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Transaction_salespersonId_fkey" FOREIGN KEY ("salespersonId")
        REFERENCES public."Salesperson" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE IF NOT EXISTS public."Cars"
(
    id serial NOT NULL,
    "serialNo" varchar(255) NOT NULL,
    "carModelId" integer NOT NULL,
    price money NOT NULL,
    weight double precision NOT NULL,
    "transactionId" integer,
    CONSTRAINT "Cars_pkey" PRIMARY KEY (id),
    CONSTRAINT "Cars_serialNo_key" UNIQUE ("serialNo"),
    CONSTRAINT "Cars_carModelId_fkey" FOREIGN KEY ("carModelId")
        REFERENCES public."CarModel" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Cars_transactionId_fkey" FOREIGN KEY ("transactionId")
        REFERENCES public."Transaction" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);