--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mipotter:eval_pkg_1722223650188 endDelimiter:; runOnChange:true runAlways:false rollbackEndDelimiter:;
create synonym sert_pub.eval_pkg for sert_core.eval_pkg;
--rollback not required
