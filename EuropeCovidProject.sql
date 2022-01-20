-- Select everything from the raw data
Select *
From EuropeCovidProject..RawData
order by 3,4

-- 1. Showing global numbers
Select MAX(people_fully_vaccinated) as FullyVaccinated, MAX(total_vaccinations) as TotalVaccinations, MAX(total_vaccinations)/MAX(population) as AvgVaccinationsPerPerson, MAX(people_vaccinated)/MAX(population)*100 as VaccinationRate
From EuropeCovidProject..RawData
Where location like '%World%'
order by 1,2

-- 2. Showing continents highest vaccination numbers

Select continent, MAX(cast(total_vaccinations as bigint)) as TotalVaccinations, MAX(cast(people_fully_vaccinated as bigint)) as PeopleFullyVaccinated
From EuropeCovidProject..RawData
Where continent is not null
Group by continent
order by TotalVaccinations

-- 3. Showing total vaccinations and people fully vaccinated from Europe

Select location, MAX(population) as Population, MAX(cast(total_vaccinations as bigint)) as TotalVaccinations, MAX(cast(people_fully_vaccinated as bigint)) as 'FullyVaccinated%'
From EuropeCovidProject..RawData
Where continent like '%Europe%'
Group by location
order by TotalVaccinations desc

-- 4. Showing Europian countries' vaccination progress

Select date, location, people_fully_vaccinated/population as 'FullyVaccinated-%'
From EuropeCovidProject..RawData
Where continent like '%Europe%'
order by 2,1
