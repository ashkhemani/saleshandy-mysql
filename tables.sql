CREATE TABLE payment_types(
	method_id int(2) NOT NULL PRIMARY KEY,
	payment_type varchar(30) NOT NULL);

CREATE TABLE transaction_detail (
	transaction_id int(6) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	driver_id int(6) NOT NULL,
	passenger_id int(6) NOT NULL,
	fare_amount int(8) NOT NULL,
	tax_amount int(8) NOT NULL,
	total_amount int(8) NOT NULL,
	method_id int(1) NOT NULL,
	transact_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (method_id) REFERENCES payment_types(method_id),
	CONSTRAINT chk_method_id check(method_id in ('1', '2', '3'))	
);

/* Add tax amount and total amount everytime a new entry is created in transaction_detail*/
DELIMITER //
CREATE TRIGGER transaction_tax BEFORE INSERT ON transaction_detail 
FOR EACH ROW 
BEGIN
	SET NEW.tax_amount = 0.18 * NEW.fare_amount;
	SET NEW.total_amount = NEW.fare_amount + NEW.tax_amount;
END;
//