-- Run as DBA / SYS before installing nonprod test packages
-- Grants CREATE JOB to unit_test so utPLSQL tests that exercise
-- AUTHID CURRENT_USER scheduler procedures can create jobs.
grant create job to unit_test;
