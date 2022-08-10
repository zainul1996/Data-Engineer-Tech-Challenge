SELECT cu.name "customer name", SUM(c.price) "spent" 
FROM public."Transaction" as t
JOIN public."Cars" AS c ON t.id = c."transactionId"
JOIN public."Customer" AS cu ON t."customerId" = cu."id"
GROUP BY cu.name