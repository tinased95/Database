select Tracking.TrackingText ,Tracking.TrackingAnswer ,Person.PersonName,PersonFamilyName, Tracking.TrackingTime, Tracking.TrackingKind
from Tracking,Person,Supporters
where Supporters.SupporterID = Person.PersonID