with quintile_thresholds as (
    -- 1. Calculate the page count thresholds for the 20th, 40th, 60th, and 80th percentiles.
    select
        approx_percentile(0.2) within group (order by pages) as q1_max_pages, -- Upper limit of Quintile 1
        approx_percentile(0.4) within group (order by pages) as q2_max_pages, -- Upper limit of Quintile 2
        approx_percentile(0.6) within group (order by pages) as q3_max_pages, -- Upper limit of Quintile 3
        approx_percentile(0.8) within group (order by pages) as q4_max_pages  -- Upper limit of Quintile 4
    from
        apex_applications
),
application_buckets as (
    -- 2. Assign each application to a non-overlapping quintile bucket (1 to 5)
    select
        a.application_id,
        a.pages,
        case
            when a.pages <= t.q1_max_pages then 1 -- XS
            when a.pages <= t.q2_max_pages then 2 -- S
            when a.pages <= t.q3_max_pages then 3 -- M
            when a.pages <= t.q4_max_pages then 4 -- L
            else 5                                -- XL
        end as quintile_bucket
    from
        apex_applications a
    cross join
        quintile_thresholds t
),
bucket_summary as (
    -- 3. Group the results to get final counts, ranges, percentages, and the average page count
    select
        b.quintile_bucket,
        min(b.pages) as min_pages,
        max(b.pages) as max_pages,
        count(b.application_id) as applications_in_bucket,
        round(avg(b.pages), 2) as average_pages,
        sum(count(b.application_id)) over () as total_applications,
        round((count(b.application_id) / sum(count(b.application_id)) over ()) * 100, 2) as percentage
    from
        application_buckets b
    group by
        b.quintile_bucket
)
-- 4. Final SELECT adds the T-shirt size column (app_size) and formats the output
select
    s.quintile_bucket,
    case s.quintile_bucket
        when 1 then 'XS'
        when 2 then 'S'
        when 3 then 'M'
        when 4 then 'L'
        when 5 then 'XL'
        else 'Unknown'
    end as app_size,
    s.min_pages || ' - ' || s.max_pages as clean_page_count_range,
    s.min_pages,
    s.max_pages,
    s.average_pages,
    s.applications_in_bucket,
    s.percentage
from
    bucket_summary s
order by
    s.quintile_bucket;