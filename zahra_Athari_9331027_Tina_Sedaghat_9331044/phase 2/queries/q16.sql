select utility.utilityCode , utilityName,utilityNExist
from utility , homeUtility
where utility.utilitycode=homeUtility.utilitycode and utilityGroup='home'