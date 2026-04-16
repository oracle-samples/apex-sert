--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:create_package_spec_sert_core.linter_util_1776211200000 stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package sert_core.linter_util
as

----------------------------------------------------------------------------------------------------------------------------
-- TYPES: P L S Q L _ S T A T E M E N T
----------------------------------------------------------------------------------------------------------------------------
-- Statement record and indexed collection returned by tokenize_plsql
----------------------------------------------------------------------------------------------------------------------------

  type t_plsql_statement is record
    (
    statement_text   varchar2(32767)  -- comment-stripped, upper-cased statement text
    ,statement_no    pls_integer      -- ordinal position within the source
    ,line_no         pls_integer      -- 1-based source line where this statement begins
    );
  type t_plsql_statements is table of t_plsql_statement index by pls_integer;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: T O K E N I Z E _ P L S Q L
----------------------------------------------------------------------------------------------------------------------------
-- Splits a PL/SQL or SQL source CLOB into individual statements, stripping comments
----------------------------------------------------------------------------------------------------------------------------

  function tokenize_plsql
    (
    p_source in clob
    )
  return t_plsql_statements;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: S T M T _ H A S _ U N P R O T E C T E D _ S U B S T
----------------------------------------------------------------------------------------------------------------------------
-- Returns true when a single statement contains an unprotected APEX substitution variable
----------------------------------------------------------------------------------------------------------------------------

  function stmt_has_unprotected_subst
    (
    p_stmt in varchar2
    )
  return boolean;

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: S Q L _ I N J E C T I O N _ I T E M _ S Y N T A X
----------------------------------------------------------------------------------------------------------------------------
-- Detects unprotected APEX substitution variables in a PL/SQL or SQL source CLOB
----------------------------------------------------------------------------------------------------------------------------

  function sql_injection_item_syntax
    (
    p_source in clob
    )
  return varchar2;

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
end linter_util;
/
--rollback drop package sert_core.linter_util;
