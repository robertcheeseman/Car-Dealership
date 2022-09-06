-- ADD VALUES TO CUSTOMER TABLE
INSERT INTO customer(
    first_name,
    last_name,
    email,
    phone_number
) VALUES (
    'Happy',
    'Gilmore',
    'thebestgolferever@gmail.com',
    '533-555-5432'
), (
    'Billy',
    'Madison',
    'badstudent@hotmail.com',
    '654-677-5432'
), (
    'Robbie',
    'Hart',
    'theweddingsinger@theweddingsinger.org',
    '905-345-4321'
), (
    'Bobbie',
    'Boucher Jr.',
    'the_waterboy@football.com',
    '345-765-1234'
);

-- ADD VALUES TO MECHANIC TABLE
INSERT INTO mechanic(
    first_name,
    last_name,
    email,
    phone_number
) VALUES (
    'Little',
    'Nicky',
    'littlenicky@gmail.com',
    '856-666-5345'
), (
    'Preston',
    'Blake',
    'mrdeeds@hotmail.com',
    '121-232-1132'
);

-- ADD VALUES TO SERVICE TICKET TABLE
INSERT INTO service_ticket(
    car_id,
    customer_id,
    mechanic_id,
    repair_type,
    service_ticket_date,
    invoice_number
) VALUES (
    4,
    3,
    1,
    'Oil Change',
    '09-05-2022',
    2
), (
    7,
    4,
    2,
    'Tire Rotation',
    '08-27-2022',
    3
);


-- ADD VALUES TO CAR TABLE
INSERT INTO car(
    make,
    model,
    year,
    car_price,
    new_used
) VALUES (
    'Honda',
    'Accord',
    2009,
    5500,
    'Used'
), (
    'Subaru',
    'Outback',
    2013,
    11000,
    'Used'
);

-- ADD VALUES TO SALESPERSON TABLE
INSERT INTO salesperson(
    first_name,
    last_name,
    email,
    phone_number
) VALUES (
    'Henry',
    'Roth',
    'henryroth@sealifepark.com',
    '456-888-0192'
), (
    'Michael',
    'Newman',
    'click@click.net',
    '834-512-1109'
);

-- ADD VALUES TO INVOICE TABLE
INSERT INTO invoice(
    salesperson_id,
    customer_id,
    invoice_date,
    car_id,
    price
) VALUES (
    2,
    4,
    '09-05-2022',
    7,
    '349'
), (
    2,
    1,
    '08-30-2022',
    8,
    '599'
);

-- ADD VALUES TO SERVICE HISTORY TABLE
INSERT INTO service_history(
    car_id,
    customer_id,
    history_repair_type,
    mechanic_id,
    service_history_date,
    service_price
) VALUES (
    1,
    2,
    'Brake Pad Replacement',
    2,
    '04-23-2021',
    '279'
), (
    2,
    1,
    'Oil Filter',
    1,
    '06-19-2022',
    '79'
);


-- Stored Procedure to add new car

CREATE PROCEDURE add_car(_make VARCHAR, _model VARCHAR, _year VARCHAR, _car_price VARCHAR, _new_used VARCHAR)
LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO car(make, model, year, car_price, new_used)
    VALUES (_make, _model, _year, _car_price, _new_used);
END
$$;

CALL add_car('Ford', 'Mustang', '2021', '35000', 'new');
CALL add_car('Chevrolet', 'Camaro', '2022', '45000', 'New');
CALL add_car('Jeep', 'Wrangler', '2018', '16500', 'Used');
CALL add_car('Chevrolet', 'Ascent', '2021', '44000', 'New');


-- Stored Procedure to add new customer

CREATE PROCEDURE new_customer(_first_name VARCHAR, _last_name VARCHAR, _email VARCHAR, _phone_number VARCHAR)
LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO customer(first_name, last_name, email, phone_number)
    VALUES (_first_name, _last_name, _email, _phone_number);
END
$$;

CALL new_customer('Paul', 'Crewe', 'thelongestyard@football.com', '345-098-0909')
CALL new_customer('Dave', 'Buznik', 'angermanagement@msn.com', '657-097-1134')
