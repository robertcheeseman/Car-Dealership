-- As I started attempting to add data to these tables, it occured to me that our group probably 
-- added too many unnecessary foreign keys.  We're trying to inherit data from one table to 
-- another in multiple instances but without purpose.  For instance, in our original invoice table 
-- creation, we're attempting to get data such as customer_id, salesperson_id, and car_id from 
-- their respective tables.  However, in a normal invoice those pieces of information would just 
-- be added each time a new invoice is created and there's no benefit to directly inheriting the data 
-- from any other table.  There is the benefit of including it on the invoice so that if you 
-- link/join tables you will be able to see additional information, but adding the foreign keys 
-- in this instance doesn't gain us any additional flexibility or resources so it's frivelous if 
-- I'm not mistaken.  Hence, all the code removing FK restraints and altering tables.  

CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  "email" VARCHAR(100),
  "phone_number" VARCHAR(30),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "mechanic" (
  "mechanic_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  "email" VARCHAR(100),
  "phone_number" VARCHAR(30),
  PRIMARY KEY ("mechanic_id")
);

CREATE TABLE "service_ticket" (
  "ticket_id" SERIAL,
  "car_id" INTEGER,
  "customer_id" INTEGER,
  "mechanic_id" INTEGER,
  "repair_type" VARCHAR(100),
  "service_ticket_date" DATE,
  "invoice_number" INTEGER UNIQUE,
  PRIMARY KEY ("ticket_id"),
  UNIQUE ("car_id"),
  CONSTRAINT "FK_service_ticket.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id"),
  CONSTRAINT "FK_service_ticket.mechanic_id"
    FOREIGN KEY ("mechanic_id")
      REFERENCES "mechanic"("mechanic_id")
);

CREATE TABLE "car" (
  "car_id" SERIAL,
  "make" VARCHAR(100),
  "model" VARCHAR(100),
  "year" VARCHAR(4),
  "car_price" VARCHAR(10),
  "new_used" VARCHAR(100),
  PRIMARY KEY ("car_id"),
  CONSTRAINT "FK_car.car_id"
    FOREIGN KEY ("car_id")
      REFERENCES "service_ticket"("car_id")
);

ALTER TABLE car
DROP CONSTRAINT "FK_car.car_id"; 

CREATE TABLE "salesperson" (
  "salesperson_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  "email" VARCHAR(100),
  "phone_number" VARCHAR(30),
  PRIMARY KEY ("salesperson_id")
);

CREATE TABLE "invoice" (
  "invoice_number" SERIAL,
  "salesperson_id" INTEGER,
  "customer_id" INTEGER,
  "invoice_date" DATE,
  "car_id" INTEGER,
  "price" VARCHAR(10),
  PRIMARY KEY ("invoice_number"),
  CONSTRAINT "FK_invoice.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id"),
  CONSTRAINT "FK_invoice.invoice_number"
    FOREIGN KEY ("invoice_number")
      REFERENCES "service_ticket"("invoice_number"),
  CONSTRAINT "FK_invoice.salesperson_id"
    FOREIGN KEY ("salesperson_id")
      REFERENCES "salesperson"("salesperson_id")
);

ALTER TABLE invoice
DROP CONSTRAINT "FK_invoice.customer_id"; 

ALTER TABLE invoice
DROP CONSTRAINT "FK_invoice.salesperson_id"; 

ALTER TABLE invoice
DROP CONSTRAINT "FK_invoice.invoice_number"; 


CREATE TABLE "service_history" (
  "service_number" SERIAL,
  "car_id" INTEGER,
  "customer_id" INTEGER,
  "history_repair_type" VARCHAR(100),
  "mechanic_id" INTEGER,
  "service_history_date" DATE,
  "service_price" VARCHAR(10),
  "ticket_id" INTEGER,
  PRIMARY KEY ("service_number"),
  CONSTRAINT "FK_service_history.ticket_id"
    FOREIGN KEY ("ticket_id")
      REFERENCES "service_ticket"("ticket_id")
);


ALTER TABLE service_history
ADD CONSTRAINT "FK_service_history.car_id"
FOREIGN KEY ("car_id") REFERENCES "car"("car_id"); 

ALTER TABLE service_history
ADD CONSTRAINT "FK_service_history.customer_id"
FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id"); 

ALTER TABLE service_history
ADD CONSTRAINT "FK_service_history.mechanic_id"
FOREIGN KEY ("mechanic_id") REFERENCES "mechanic"("mechanic_id");

ALTER TABLE service_history
DROP CONSTRAINT "FK_service_history.car_id"; 
