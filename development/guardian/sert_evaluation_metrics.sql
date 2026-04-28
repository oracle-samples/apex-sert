--
-- Shows evaluation metrics by eval_id: app size, pages, findings, duration, score, avg_page_complexity
--

with
function elapsed_sec(
    p_start_time in timestamp with time zone,
    p_end_time in timestamp with time zone )
    return number
is
    l_diff interval day to second;
begin
    -- Calculate the interval and extract components into total seconds.
    l_diff := p_end_time - p_start_time;

    return (extract(day from l_diff) * 86400) +
           (extract(hour from l_diff) * 3600) +
           (extract(minute from l_diff) * 60) +
           extract(second from l_diff);
end;
data as (
    select e.eval_id,
           e.workspace_id,
           e.application_id,
           e.eval_on,
           e.eval_on_date,
           e.score,
           e.pending_score,
           e.approved_score,
           (select count(*) from eval_results r where e.eval_id = r.eval_id)  as findings,
           (select min(r.created_on) from eval_results r where e.eval_id = r.eval_id)  as t0,
           (select max(r.created_on) from eval_results r where e.eval_id = r.eval_id)  as t1,
           a.pages,
           a.app_size,
           a.avg_page_complexity
      from evals e
      join sg_applications_d a on (a.workspace_id = e.workspace_id and a.application_id = e.application_id and a.eval_on = e.eval_on)
     where e.rule_set_id = (select rule_set_id from rule_sets_pub_v where rule_set_key = 'SERT-SECURITY')
       and e.job_status = 'COMPLETED'
)
select d.eval_id,
       d.workspace_id,
       d.application_id,
       d.eval_on_date,
       d.app_size,
       d.pages,
       d.findings,
       d.t1 - d.t0 duration,
       round(elapsed_sec(p_start_time => d.t0, p_end_time => d.t1),2) as duration_sec,
       round(d.avg_page_complexity) as avg_page_complexity,
       d.score,
       d.pending_score,
       d.approved_score
  from data d
 order by duration_sec desc;

