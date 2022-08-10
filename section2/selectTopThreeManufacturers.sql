SELECT m.name "manufacturer", COUNT(m.name) "total sold"
FROM public."Manufacturer" as m
JOIN public."CarModel" as cm ON m.id = cm."manufacturerId"
JOIN public."Cars" as c ON cm.id = c."carModelId"
JOIN public."Transaction" as t ON c."transactionId" = t.id
WHERE date_trunc('month', t."datetimeCreated") = date_trunc('month', current_date)
GROUP BY m.name
ORDER BY COUNT(cm.name) DESC
LIMIT 3