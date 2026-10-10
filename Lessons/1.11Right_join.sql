select cd.company_id,jpf.job_id,jpf.job_location
from company_dim as cd
right join job_postings_fact as jpf
on jpf.company_id= cd.company_id
limit 9;