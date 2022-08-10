SELECT s.name "salesperson name", SUM(c.price) "total sale"
FROM public."Salesperson" as s
JOIN public."Transaction" AS t ON s.id = t."salespersonId"
JOIN public."Cars" as c ON t.id = c."transactionId"
GROUP BY s.name