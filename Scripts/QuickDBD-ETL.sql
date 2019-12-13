-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/orPs73
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "gapminder" (
    "id" int   NOT NULL,
    "country" varchar   NOT NULL,
    "year" int   NOT NULL,
    "infant_mortality" decimal   NOT NULL,
    "life_expectancy" decimal   NOT NULL,
    "fertility" decimal   NOT NULL,
    "population" decimal   NOT NULL,
    "gdp" decimal   NOT NULL,
    "continent" varchar   NOT NULL,
    "region" varchar   NOT NULL,
    CONSTRAINT "pk_gapminder" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "country_code" (
    "id" int   NOT NULL,
    "country" varchar   NOT NULL,
    "country_code" text   NOT NULL,
    "iso_codes" text   NOT NULL,
    "population" int   NOT NULL,
    "area_km2" int   NOT NULL,
    "gdp" text   NOT NULL,
    CONSTRAINT "pk_country_code" PRIMARY KEY (
        "country"
     )
);

CREATE TABLE "co2" (
    "year" int   NOT NULL,
    "country" varchar   NOT NULL,
    "co2_emissions" varchar   NOT NULL,
    CONSTRAINT "pk_co2" PRIMARY KEY (
        "year","country"
     )
);

ALTER TABLE "gapminder" ADD CONSTRAINT "fk_gapminder_country_year" FOREIGN KEY("country", "year")
REFERENCES "co2" ("country", "year");

ALTER TABLE "country_code" ADD CONSTRAINT "fk_country_code_country" FOREIGN KEY("country")
REFERENCES "gapminder" ("country");

