select PersonName, PersonFamilyName, RegisteredDate 
from RegisteredCostumer , Person
where Person.personID=RegisteredCostumer.costumerID
