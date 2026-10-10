select jpf.*,cd.*
from job_postings_fact as jpf
full outer join company_dim as cd
on jpf.company_id = cd.company_id
Limit 9;

select Distinct
jpf.Job_id,
jpf.Job_location,
sjd.skill_id,
sd.skills
from job_postings_fact as jpf
left join skills_job_dim as sjd
on jpf.job_id=sjd.job_id
left join skills_dim as sd
on sjd.skill_id=sd.skill_id
limit 12;