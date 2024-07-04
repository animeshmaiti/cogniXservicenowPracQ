USE country;
CREATE TABLE country (
    Code CHAR(3) NOT NULL,
    Name CHAR(52) NOT NULL,
    Continent ENUM('Asia', 'Europe', 'North America', 'Africa', 'Oceania', 'Antarctica', 'South America') NOT NULL,
    Region CHAR(26) NOT NULL,
    SurfaceArea DECIMAL(10, 2) NOT NULL,
    IndepYear SMALLINT(6),
    Population INT(11) NOT NULL,
    LifeExpectancy DECIMAL(3, 1),
    GNP DECIMAL(10, 2),
    GNPOld DECIMAL(10, 2),
    LocalName CHAR(45) NOT NULL,
    GovernmentForm CHAR(45) NOT NULL,
    HeadOfState CHAR(60),
    Capital INT(11),
    Code2 CHAR(2) NOT NULL
);

ALTER TABLE country ADD PRIMARY KEY (Code);

DESCRIBE country;

CREATE TABLE City (
    ID INT(11) NOT NULL,
    Name CHAR(35) NOT NULL,
    CountryCode CHAR(3) NOT NULL,
    District CHAR(20) NOT NULL,
    Population INT(11) NOT NULL,
    PRIMARY KEY (ID)
);
ALTER TABLE City ADD FOREIGN KEY (CountryCode) REFERENCES country(Code);
DESCRIBE City;

CREATE TABLE CountryLanguage (
    CountryCode CHAR(3) NOT NULL,
    Language CHAR(30) NOT NULL,
    IsOfficial ENUM('T', 'F') NOT NULL,
    Percentage DECIMAL(4, 1) NOT NULL,
    PRIMARY KEY (Language),
    FOREIGN KEY (CountryCode) REFERENCES country(Code)
);

ALTER TABLE CountryLanguage DROP PRIMARY KEY;

DESCRIBE CountryLanguage;

INSERT INTO country (Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, GNPOld, LocalName, GovernmentForm, HeadOfState, Capital, Code2)
VALUES
('USA', 'United States', 'North America', 'Northern America', 9372610, 1776, 331002651, 78.93, 21137518, 20611800, 'United States', 'Federal Republic', 'Joe Biden', 3813, 'US'),
('CHN', 'China', 'Asia', 'Eastern Asia', 9596960, 1949, 1439323776, 76.91, 14140163, 13894800, 'Zhongguo', 'Communist State', 'Xi Jinping', 1892, 'CN'),
('JPN', 'Japan', 'Asia', 'Eastern Asia', 377975, 660, 126476461, 84.63, 5064873, 4909000, 'Nihon', 'Constitutional Monarchy', 'Naruhito', 1534, 'JP'),
('DEU', 'Germany', 'Europe', 'Western Europe', 357114, 1955, 83166711, 81.33, 3845630, 3693200, 'Deutschland', 'Federal Republic', 'Frank-Walter Steinmeier', 3068, 'DE'),
('BRA', 'Brazil', 'South America', 'South America', 8515767, 1822, 212559417, 75.88, 2055500, 2011780, 'Brasil', 'Federal Republic', 'Jair Bolsonaro', 2110, 'BR');

SELECT * FROM country;

INSERT INTO city (ID, Name, CountryCode, District, Population)
VALUES
(3813, 'Washington', 'USA', 'District of Columbia', 689545),
(1892, 'Beijing', 'CHN', 'Beijing', 21542000),
(1534, 'Tokyo', 'JPN', 'Tokyo', 13929286),
(3068, 'Berlin', 'DEU', 'Berlin', 3644826),
(2110, 'Brasília', 'BRA', 'Federal District', 3055149);

SELECT * FROM city;

INSERT INTO countrylanguage (CountryCode, Language, IsOfficial, Percentage)
VALUES
('USA', 'English', 'T', 82.1),
('USA', 'Spanish', 'F', 13.5),
('CHN', 'Chinese', 'T', 92.0),
('JPN', 'Japanese', 'T', 99.0),
('DEU', 'German', 'T', 95.0),
('BRA', 'Portuguese', 'T', 98.0),
('BRA', 'Spanish', 'F', 1.0);

SELECT * FROM countrylanguage;