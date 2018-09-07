select personName,personFamilyName,onlineTime,offlinetime
from SupporterStatus,Supporters,person
where person.personID=supporters.supporterID and supporters.supporterID = supporterStatus.supporterID