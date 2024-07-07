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

--13.
SELECT Name FROM country ORDER BY Population DESC LIMIT 10;

--14.
SELECT
    country.Name, city.Name, city.Population
FROM
    country
JOIN city ON country.code = city.CountryCode
where
    country.LifeExpectancy>75;

--15.
SELECT 
    country.Name,countrylanguage.Language 
from
    country JOIN CountryLanguage on country.code=countrylanguage.CountryCode
where
    countrylanguage.IsOfficial='T'
ORDER BY country.Name;

--16.
SELECT
    country.Name
from
    country
JOIN
    city on country.code=city.CountryCode
where city.Name='Paris';

--17.
SELECT country.Name,count(CASE WHEN countrylanguage.IsOfficial='T' THEN 1 END) as NumOfficialLanguages from country
JOIN countrylanguage on country.code=countrylanguage.CountryCode
GROUP BY countrylanguage.CountryCode
having NumOfficialLanguages>=5;

--18.
SELECT Continent,sum(Population) as TotalPopulation from country
GROUP BY Continent;

--19.
SELECT country.Name,city.Name,city.Population from country
JOIN city on country.Code=city.CountryCode
where city.id=country.Capital AND city.Population>=country.Population/10;

--20.
SELECT Continent,avg(LifeExpectancy) as AvgLifeExpectancy from country
GROUP BY Continent;

--21.
SELECT city.Name from city
JOIN country on city.id=country.Capital
where country.Continent='Asia';

--22.
SELECT country.Name from country
join city on country.code=city.CountryCode
where city.Population < 1000000;

--23.
SELECT country.Name,country.Population,sum(city.Population) as TotalPopulationCity from country
join city on country.code=city.CountryCode
GROUP BY country.Name,country.Population
HAVING TotalPopulationCity > country.Population/10;

--24.
SELECT country.Name,count(city.Name) as NumCities from country
join city on country.code=city.CountryCode
GROUP BY country.Name
order by NumCities desc
LIMIT 1;

-- 25.
SELECT country.Name,countrylanguage.Language from country
join countrylanguage on country.code=countrylanguage.CountryCode
where countrylanguage.Language='English' AND countrylanguage.IsOfficial!='T' AND countrylanguage.Percentage>50;

-- 26.
SELECT Name,
CASE
    WHEN Population < 1000000 THEN 'Small'
    WHEN Population >=1000000 AND Population < 10000000 THEN 'Medium'
    ELSE 'Large'
END AS PopulationCategory
from country;

-- 27.
SELECT Name,
    CASE
        WHEN GNP <100000000000 THEN 'Low'
        WHEN GNP >=100000000000 AND GNP < 1000000000000 THEN 'Medium'
        ELSE 'High'
    END AS GNPCategory
from country;

-- 28.
SELECT Name,
    CASE
        WHEN Population < 100000 THEN 'Small'
        WHEN Population >=100000 AND Population < 1000000 THEN 'Medium'
        ELSE 'Large'
    END AS PopulationCategory
from city;

-- 29.
SELECT Name,
    CASE
        WHEN LifeExpectancy < 50 THEN 'Low'
        WHEN LifeExpectancy >=50 AND LifeExpectancy < 75 THEN 'Medium'
        ELSE 'High'
    END as LifeExpectancyCategory
from country;