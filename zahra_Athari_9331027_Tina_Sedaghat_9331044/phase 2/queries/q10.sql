select UtilityName,UtilityCode, UtilitySale , UtilityCost- UtilityCost*UtilitySale as UtilityNewCost, UtilityGroup
from Utility
where UtilitySale!=0