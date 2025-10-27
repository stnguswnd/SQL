USE world; 

SHOW INDEX FROM city; 

describe city;

CREATE INDEX idx_city_name ON city(Name); 
EXPLAIN SELECT * FROM city WHERE Name = 'Seoul';

SHOW INDEX FROM city; 

DROP INDEX idx_city_name ON city; 
EXPLAIN SELECT * FROM city WHERE Name = 'Seoul';