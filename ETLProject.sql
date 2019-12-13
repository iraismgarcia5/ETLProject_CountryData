-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/orPs73
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "gapminder" (
    "id" int PRIMARY KEY,
    "country" varchar   NOT NULL,
    "year" int,
    "infant_mortality" decimal,
    "life_expectancy" decimal,
    "fertility" decimal,
    "population" decimal,
    "gdp" decimal,
    "continent" varchar,
    "region" varchar
);

CREATE TABLE "country_code" (
    "id" int   NOT NULL,
    "country" varchar   NOT NULL,
    "country_code" text   NOT NULL,
    "iso_codes" text,
    "population" int,
    "area_km2" int,
    "gdp" text,
    CONSTRAINT "pk_country_code" PRIMARY KEY (
        "country"
     )
);

CREATE TABLE "co2" (
    "year" int   NOT NULL,
    "country" varchar   NOT NULL,
    "co2_emissions" varchar,
    CONSTRAINT "pk_co2" PRIMARY KEY (
        "year","country"
     )
);

ALTER TABLE "gapminder" ADD CONSTRAINT "fk_gapminder_country_year" FOREIGN KEY("country", "year")
REFERENCES "co2" ("country", "year");



SELECT g.country, g.year, g.gdp, c.area_km2, co2.co2_emissions, CAST(co2.co2_emissions AS DECIMAL) * 10^6/CAST(c.area_km2 AS DECIMAL) millionth_co2_per_km2
FROM gapminder g
JOIN country_code c ON LOWER(c.country) = g.country
JOIN co2 ON co2.year=g.year AND LOWER(co2.country)=g.country


