use OnlineShopping1;
select utilitycode, avgrank
from(
select opinion.utilitycode , utility.utilitygroup ,avg(rank) as avgrank
from  opinion natural join  utility 
group by opinion.utilitycode) as tt
where utilitygroup='sport' 
