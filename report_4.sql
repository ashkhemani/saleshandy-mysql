Create view weekly_payout as
SELECT WEEK(transact_time) AS Week, SUM(fare_amount)*0.85 as Weekly_Payout FROM transaction_detail 
GROUP BY WEEK(transact_time)
ORDER BY WEEK(transact_time);

select * from weekly_payout;