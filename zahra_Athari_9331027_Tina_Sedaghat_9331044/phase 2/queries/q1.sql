
      
      select cost.totalnumber,sum(cost.totalnumber*utility.utilitycost*(1-utilitySale)) as totalcost ,utility.utilitygroup
      from cost,utility
      where cost.utilityID=utility.utilityCode
      
     group by utility.utilitygroup