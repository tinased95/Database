select sum(cost2.numberofutility*utility.utilitycost) as totalcost 
      from cost2,utility
      where cost2.utilityID=utility.utilityCode and 08 < month(cost2.BoughtDateTime) < 10 and year(cost2.BoughtDateTime)=2017