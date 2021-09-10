SELECT SUM(fare_amount)*0.85 as Payout FROM transaction_detail WHERE driver_id = 1 AND transact_time BETWEEN Date('2021-05-24') AND Date('2021-06-04');
