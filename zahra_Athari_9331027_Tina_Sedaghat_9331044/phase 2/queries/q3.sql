select PersonName,PersonFamilyName,CostumerUsername
from RegisteredCostumerUsernames , Person ,Employee , company
where RegisteredCostumerUsernames.costumerID=Employee.EmployeeID and Person.PersonID=Employee.EmployeeID and Employee.companyID=company.companyID and company.CompanyName='fanap'