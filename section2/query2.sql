SELECT car.manufacturer_name, COUNT(car.model_name)
FROM car
JOIN transaction ON car.car_id = transaction.car_id
WHERE date_trunc('month', transaction.sales_datetime) = date_trunc('month', current_date)
GROUP BY car.manufacturer_name
ORDER BY COUNT(car.model_name) DESC
LIMIT 3