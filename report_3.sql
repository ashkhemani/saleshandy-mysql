Create view weekly_revenue as SELECT
  WEEK(transact_time) AS Week,
  SUM(total_amount) AS Weekly_Total
FROM transaction_detail
GROUP BY WEEK(transact_time)
ORDER BY WEEK(transact_time);

select * from weekly_revenue;