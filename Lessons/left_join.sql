select jpf.*,cd.*
from job_postings_fact as jpf
left join company_dim as cd
on jpf.company_id = cd.company_id
Limit 9;