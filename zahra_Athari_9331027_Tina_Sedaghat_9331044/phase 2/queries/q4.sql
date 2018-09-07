select Bought.BoughtID,RegisteredCostumerUsernames.CostumerUsername,Bought.BoughtDateTime ,Bought.CostumerCity,Bought.CostumerStreet,Bought.CostumerPelak,TransportDetail.RecievedDate
from RegisteredCostumerUsernames,TransportDetail,Bought
where month(RecievedDate)=05 and year(RecievedDate)=2017 and
TransportManPelak='P311' 
and TransportDetail.BoughtId=Bought.BoughtId 
and Bought.CostumerID=RegisteredCostumerUsernames.CostumerID 