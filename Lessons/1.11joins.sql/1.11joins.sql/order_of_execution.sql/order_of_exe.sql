select cd.name,count(jpf.job_id)
from job_postings_fact as jpf
left join company_dim as cd
    on jpf.company_id = cd.company_id
    group by cd.name
    having count(jpf.job_id) > 333;