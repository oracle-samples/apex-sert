with application_buckets as (
    -- 1. Assign each evaluated application to a non-overlapping quintile bucket (1 to 5)
    select
        e.eval_id,
        e.workspace_id,
        e.application_id,
        e.rule_set_id,
        e.approved_score as score,
        a.pages,
        case
            when a.pages <= 5  then 1 -- XS
            when a.pages <= 15 then 2 -- S
            when a.pages <= 30 then 3 -- M
            when a.pages <= 50 then 4 -- L
            else 5                    -- XL
        end as quintile_bucket,
        (select count(*) from sert_core.eval_results er where er.eval_id = e.eval_id) findings
    from
        sert_core.evals e,
        apex_applications a
    where
        e.application_id = a.application_id
),
bucket_summary as (
    -- 2. Group the results to get final counts, ranges, percentages, and the average page count
    select
        b.rule_set_id,
        b.quintile_bucket,
        min(b.pages) as min_pages,
        max(b.pages) as max_pages,
        count(b.application_id) as applications_in_bucket,
        round(avg(b.pages), 2) as average_pages,
        sum(count(b.application_id)) over () as total_applications,
        round((count(b.application_id) / sum(count(b.application_id)) over ()) * 100, 2) as percentage,
        min(b.score) as min_score,
        max(b.score) as max_score,
        round(avg(b.score),2) as avg_score,
        min(b.findings) as min_findings,
        max(b.findings) as max_findings,
        round(avg(b.findings),2) as avg_findings
    from
        application_buckets b
    group by
        b.rule_set_id,
        b.quintile_bucket
)
-- 3. Final SELECT adds the T-shirt size column (app_size) and formats the output
select
    s.rule_set_id,
    s.quintile_bucket,
    case s.quintile_bucket
        when 1 then 'XS'
        when 2 then 'S'
        when 3 then 'M'
        when 4 then 'L'
        when 5 then 'XL'
        else 'Unknown'
    end as app_size,
    s.min_pages || ' - ' || s.max_pages as page_range,
    s.min_pages,
    s.max_pages,
    s.average_pages,
    s.applications_in_bucket,
    s.percentage,
    s.min_score,
    s.max_score,
    s.avg_score,
    s.min_findings,
    s.max_findings,
    s.avg_findings
from
    bucket_summary s
order by
    s.rule_set_id,
    s.quintile_bucket;