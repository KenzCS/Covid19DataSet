--Total Cases vs Total Deaths
-- Persentase Kematian Covid Di Indonesia
SELECT Location, Date, Total_Cases, Total_Deaths, ROUND((Total_Deaths/Total_Cases)* 100,2) AS PercentageDeaths
FROM PortfolioProject..DataKematianCovid$
WHERE Location = 'Indonesia'
ORDER BY 1,2

--Total Cases vs Population
-- Persentase Populasi Yang Terkena Covid Di Indonesia
SELECT Location, Date, Population, Total_Cases, ROUND((Total_Cases/Population)* 100,2) AS PercentagePopulationInfected
FROM PortfolioProject..DataKematianCovid$
WHERE Location = 'Indonesia'
ORDER BY 1,2

-- Negara Dengan Kasus Tertinggi Dibandingkan Dengan Populasi
SELECT Location, Population, MAX(Total_Cases) KasusTertinggi, ROUND(MAX((Total_Cases/Population))* 100,2) PercentagePopulationInfected
FROM PortfolioProject..DataKematianCovid$
GROUP BY Location, Population
ORDER BY PercentagePopulationInfected DESC

-- Negara Dengan Kematian Tertinggi
SELECT Location, MAX(CAST(Total_Deaths AS INT)) AS TotalDeath
FROM PortfolioProject..DataKematianCovid$
WHERE Continent IS NOT NULL
GROUP BY Location
ORDER BY TotalDeath DESC

--Kontinen Dengan Kematian Tertinggi
SELECT Continent, MAX(CAST(Total_Deaths AS INT)) AS TotalDeath
FROM PortfolioProject..DataKematianCovid$
WHERE Continent IS NOT NULL
GROUP BY Continent
ORDER BY TotalDeath DESC

--Keseluruhan TotalCases,Deaths, dan DeathPercentage Secara Global
SELECT SUM(New_Cases) AS TotalCases, SUM(CAST(New_Deaths AS INT)) AS TotalDeaths,
SUM(CAST(New_Deaths AS INT))/SUM(New_Cases) * 100 AS DeathPercentage
FROM PortfolioProject..DataKematianCovid$
WHERE CONTINENT IS NOT NULL
ORDER BY 1,2
