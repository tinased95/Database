select companyname,sum(totalcost) as totalcost
from employeewithdiscount
group by companyname




-- select companyname,1.9*sum(totalcost) as totalcost
-- from employeewithdiscount
-- group by companyname
