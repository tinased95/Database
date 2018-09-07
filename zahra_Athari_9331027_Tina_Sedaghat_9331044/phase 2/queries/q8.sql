select Bought.BoughtID , Bought.BoughtDateTime , Person.PersonName , Person.PersonFamilyName ,RegisteredCostumerUsernames.CostumerUsername
from Bought,Person,RegisteredCostumerUsernames
where Person.personID=RegisteredCostumerUsernames.costumerID and  Person.personID=bought.costumerID 
and month(BoughtDateTime)=10 and year(BoughtDateTime)=2017 