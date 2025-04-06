--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset mzimon:aop_grants endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
--preconditions onFail:MARK_RAN onError:HALT

grant execute on sert_core.aop_api_pkg to sert_pub
/
grant select on sert_core.eval_results to sert_pub
/
grant select on sert_core.categories to sert_pub
/
grant select on sert_core.evals to sert_pub
/
grant select on sert_core.exceptions to sert_pub
/
grant select on sert_core.eval_results_v to sert_pub
/
grant select on sert_core.exceptions_pub_v to sert_pub
/
grant select on sert_core.exceptions_v to sert_pub
/
grant select on sert_core.exception_cnt_v to sert_pub
/
grant select on sert_core.eval_results_v to sert_pub
/
grant select on sert_core.exceptions_pub_v to sert_pub
/
grant select on sert_core.exceptions_v to sert_pub
/
grant select on sert_core.exception_cnt_v to sert_pub
/
grant select on sert_core.evals_v to sert_pub
/
--rollback not required
