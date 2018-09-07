use OnlineShopping1;

select person.PersonName as 'registered Customer name' , person.PersonFamilyName as 'registered Customer lastname' , RegisteredCostumerUsernames.CostumerUsername as 'registeredCustomer username'
from person , RegisteredCostumerUsernames,boughtDetail,bought
where person.personID=RegisteredCostumerUsernames.CostumerID and RegisteredCostumerUsernames.CostumerID=bought.costumerID and bought.boughtID=boughtDetail.boughtID
and boughtDetail.utilityID='12' ;

select person.PersonName as 'unregistered Customer name' , person.PersonFamilyName as 'unregistered Customer lastname' 
from person , unRegisteredCostumer,boughtDetail,bought
where person.personID=unRegisteredCostumer.CostumerID and unRegisteredCostumer.CostumerID=bought.costumerID and bought.boughtID=boughtDetail.boughtID
and boughtDetail.utilityID='12' 
