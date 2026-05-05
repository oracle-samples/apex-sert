--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_body_unit_test.test_bulk_add_comment stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body unit_test.test_bulk_add_comment
as

-- Test workspace/app IDs that do not exist in production data.
c_workspace_id   constant number := -99001;
c_application_id constant number := -99001;

-- Inserts a minimal eval row and returns the generated eval_id.
-- Uses the first available rule_set_id from production data.
function setup_eval return number
is
    l_eval_id     number;
    l_rule_set_id number;
begin
    select min(rule_set_id) into l_rule_set_id from sert_core.rule_sets;

    insert into sert_core.evals (
        workspace_id, application_id, rule_set_id, eval_on_date)
    values (
        c_workspace_id, c_application_id, l_rule_set_id, sysdate)
    returning eval_id into l_eval_id;

    return l_eval_id;
end setup_eval;

-- Inserts an eval_result row with the given result JSON value.
procedure setup_result (
    p_eval_id in number,
    p_rule_id in number,
    p_result  in varchar2)
is
begin
    insert into sert_core.eval_results (
        eval_id, rule_id, application_id, result)
    values (
        p_eval_id,
        p_rule_id,
        c_application_id,
        json_object('result' value p_result));
end setup_result;

-- Returns the number of comments inserted for the test rule.
function comment_count (p_rule_id in number) return number
is
    l_count number;
begin
    select count(*) into l_count
    from   sert_core.comments
    where  rule_id        = p_rule_id
    and    workspace_id   = c_workspace_id
    and    application_id = c_application_id;
    return l_count;
end comment_count;

------------------------------------------------------------
-- inserts_all_when_no_filter
------------------------------------------------------------
procedure inserts_all_when_no_filter
as
    l_eval_id number;
    l_rule_id number;
begin
    select min(rule_id) into l_rule_id from sert_core.rules;
    l_eval_id := setup_eval;
    setup_result(l_eval_id, l_rule_id, 'FAIL');
    setup_result(l_eval_id, l_rule_id, 'PASS');

    sert_core.comments_api.bulk_add_comment(
        p_eval_id        => l_eval_id,
        p_workspace_id   => c_workspace_id,
        p_application_id => c_application_id,
        p_rule_id        => l_rule_id,
        p_comment        => 'all filter test');

    ut.expect(comment_count(l_rule_id)).to_equal(2);
end inserts_all_when_no_filter;

------------------------------------------------------------
-- inserts_only_fail_when_filter_fail
------------------------------------------------------------
procedure inserts_only_fail_when_filter_fail
as
    l_eval_id number;
    l_rule_id number;
begin
    select min(rule_id) into l_rule_id from sert_core.rules;
    l_eval_id := setup_eval;
    setup_result(l_eval_id, l_rule_id, 'FAIL');
    setup_result(l_eval_id, l_rule_id, 'PASS');

    sert_core.comments_api.bulk_add_comment(
        p_eval_id        => l_eval_id,
        p_workspace_id   => c_workspace_id,
        p_application_id => c_application_id,
        p_rule_id        => l_rule_id,
        p_comment        => 'fail filter test',
        p_result_filter  => 'FAIL');

    ut.expect(comment_count(l_rule_id)).to_equal(1);
end inserts_only_fail_when_filter_fail;

------------------------------------------------------------
-- inserts_only_pass_when_filter_pass
------------------------------------------------------------
procedure inserts_only_pass_when_filter_pass
as
    l_eval_id number;
    l_rule_id number;
begin
    select min(rule_id) into l_rule_id from sert_core.rules;
    l_eval_id := setup_eval;
    setup_result(l_eval_id, l_rule_id, 'FAIL');
    setup_result(l_eval_id, l_rule_id, 'PASS');

    sert_core.comments_api.bulk_add_comment(
        p_eval_id        => l_eval_id,
        p_workspace_id   => c_workspace_id,
        p_application_id => c_application_id,
        p_rule_id        => l_rule_id,
        p_comment        => 'pass filter test',
        p_result_filter  => 'PASS');

    ut.expect(comment_count(l_rule_id)).to_equal(1);
end inserts_only_pass_when_filter_pass;

------------------------------------------------------------
-- inserts_none_when_filter_no_match
------------------------------------------------------------
procedure inserts_none_when_filter_no_match
as
    l_eval_id number;
    l_rule_id number;
begin
    select min(rule_id) into l_rule_id from sert_core.rules;
    l_eval_id := setup_eval;
    setup_result(l_eval_id, l_rule_id, 'PASS');

    sert_core.comments_api.bulk_add_comment(
        p_eval_id        => l_eval_id,
        p_workspace_id   => c_workspace_id,
        p_application_id => c_application_id,
        p_rule_id        => l_rule_id,
        p_comment        => 'no match test',
        p_result_filter  => 'FAIL');

    ut.expect(comment_count(l_rule_id)).to_equal(0);
end inserts_none_when_filter_no_match;

end test_bulk_add_comment;
/
--rollback not required
