-- Emissions by Sector --
select "Sector", sum("Emissions") from "Emission_Table" where "Year" = '2024'
group by "Sector" order by sum("Emissions") desc;

-- Emissions by Country --
select "Country", sum("Emissions") from "Emission_Table" where "Year" = '2024'
group by "Country" order by sum("Emissions") desc;

-- Emissions per GDP --
select e."Country", sum(e."Emissions") as Emissions, g."GDP" as GDP, sum(e."Emissions") / g."GDP" as Emissions_per_GDP
from "Emission_Table" e JOIN "GDP_Table" g on e."Country" = g."Country"
where e."Year" = '2024' and g."Year" = '2024' group by e."Country", g."GDP" order by Emissions_per_GDP desc;

-- Emissions per Population --
select e."Country", SUM(e."Emissions") as Emissions, p."Population" as Population, SUM(e."Emissions") / p."Population" AS Emissions_per_Population
from "Emission_Table" e join "Population_Table" p on e."Country" = p."Country"
where e."Year" = '2024' and p."Year" = '2024'
group by e."Country", p."Population"
order by Emissions_per_Population desc;

-- Energy Imports by Country --
select "countryRegionName", "activityName", SUM("value") as total_value
from "Energy_Table" where "period" = '2022' and "activityName" = 'Imports'
group by "countryRegionName", "activityName"
order by total_value desc;

-- Energy Exports by Country --
select "countryRegionName", "activityName", SUM("value") as total_value
from "Energy_Table" where "period" = '2022' and "activityName" = 'Exports'
group by "countryRegionName", "activityName"
order by total_value desc;

-- Energy Consumption by Country --
select "countryRegionName", "activityName", SUM("value") as total_value
from "Energy_Table" where "period" = '2022' and "activityName" = 'Consumption'
group by "countryRegionName", "activityName"
order by total_value desc;