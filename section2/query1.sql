SELECT transaction.customer_name, SUM(car.price) FROM transaction
JOIN car ON transaction.car_id = car.car_id
GROUP BY transaction.customer_name