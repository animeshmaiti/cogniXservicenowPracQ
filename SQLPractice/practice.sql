USE country;

DESCRIBE country;

-- 1.
SELECT Name from country WHERE Continent='Asia';

-- 2.
DESCRIBE city;
SELECT Name FROM city ORDER BY Population DESC LIMIT 5;

-- 3.
SELECT NAME FROM country WHERE Population>100000000;

-- 4.
DESCRIBE countrylanguage;
SELECT LANGUAGE FROM countrylanguage where CountryCode='JPN';

SELECT * FROM country;
-- 5.
SELECT Capital FROM country WHERE SurfaceArea=(SELECT MAX(SurfaceArea) FROM country);

-- 6.
SELECT Name FROM city where CountryCode='JPN';

-- 7.
SELECT avg(LifeExpectancy) FROM country WHERE Continent='Europe';

-- 8.
SELECT
    CountryCode,
    COUNT(CASE WHEN IsOfficial = 'T' THEN 1 END) AS NumOfficialLanguages
FROM
    countrylanguage
GROUP BY
    CountryCode;

-- 9.
SELECT Name FROM country where LifeExpectancy>(SELECT avg(LifeExpectancy) FROM country);

--10.
SELECT sum(Population) FROM city WHERE CountryCode='USA';

--11.
SELECT
    country.Name AS Country,
    city.Name AS Capital
from
    country
JOIN city ON country.Capital = city.ID;

--12.
SELECT
    country.Name as country
from
    country
JOIN
    countrylanguage ON country.Code = countrylanguage.CountryCode
where
CountryLanguage.Language='Spanish' AND CountryLanguage.IsOfficial='T';