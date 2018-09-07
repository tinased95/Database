select person.personName , person.personFamilyName , companyName
from CompanyLink , MrLink, person ,company 
where month(introducedDate)=05 and  year(introducedDate)=2017
and person.personID=mrlink.personID and companyLink.linkID=mrlink.personID 
and companyLink.companyID=company.companyID