--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset SERT:create_aop_tables runOnChange:true runAlways:false endDelimiter:/ stripComments=false
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(1) from all_tables where owner = 'SERT_CORE' and upper(table_name) = 'AOP_CONFIG';

declare
  l_check number(1) := 0;
  l_sert_base_schema VARCHAR2(100):= 'SERT_CORE';
begin
  -- epoch 123456789
  -- TABLE: AOP_CONFIG
  begin
    select 1
      into l_check
      from all_tables
     where table_name = 'AOP_CONFIG'
     and owner = l_sert_base_schema;

  exception
  when no_data_found then
    begin
      execute immediate q'~
      create table sert_core.aop_config (
        id                 number not null,
        aop_url            varchar2(200) not null,
        api_key            varchar2(50),
        aop_mode           varchar2(15),
        failover_aop_url   varchar2(200),
        failover_procedure varchar2(200),
        debug              varchar2(10),
        converter          varchar2(100),
        settings_pkg       varchar2(100),
        logging_pkg        varchar2(100),
        email_from         varchar2(200),
        created          date not null,
        created_by       varchar2(255) not null,
        updated          date not null,
        updated_by       varchar2(255) not null,
        CONSTRAINT aop_config_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
        )
    ~';
    end;

    begin
      execute immediate q'~
      begin
        insert into sert_core.aop_config (id, aop_url, created, created_by, updated, updated_by) values (1, 'https://api.apexofficeprint.com', sysdate, 'AOP', sysdate, 'AOP');
        commit;
      end;
    ~';
    end;
  end;

  -- TABLE: AOP_DOWNSUBSCR_TEMPLATE
  begin
    select 1
      into l_check
      from all_tables
     where table_name = 'AOP_DOWNSUBSCR_TEMPLATE'
     and owner = l_sert_base_schema;

  exception
  when no_data_found then
    execute immediate q'~
        create table sert_core.aop_downsubscr_template (
        id               number not null,
        title            varchar2(255) not null,
        description      clob,
        template_blob    blob,
        template_url     varchar2(255),
        file_name        varchar2(255),
        mime_type        varchar2(255),
        last_update_date date,
        template_default number(3) default 0,
        report_types     varchar2(255),
        created          date not null,
        created_by       varchar2(255) not null,
        updated          date not null,
        updated_by       varchar2(255) not null,
        CONSTRAINT aop_downsubscr_template_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
        )
    ~';
  end;

  -- TABLE: AOP_DOWNSUBSCR_TEMPLATE_APP
  begin
    select 1
      into l_check
      from all_tables
     where table_name = 'AOP_DOWNSUBSCR_TEMPLATE_APP'
     and owner = l_sert_base_schema;

  exception
  when no_data_found then
    execute immediate q'~
        create table sert_core.aop_downsubscr_template_app (
        id                     number not null,
        downsubscr_template_id number not null
        constraint aop_downsubscr_template_app_fk references sert_core.aop_downsubscr_template,
        app_id                 number,
        page_id                number,
        region_id              number,
        template_default       number(3),
        created                date not null,
        created_by             varchar2(255) not null,
        updated                date not null,
        updated_by             varchar2(255) not null,
        CONSTRAINT aop_downsubscr_template_app_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
        )
    ~';
  end;

  -- TABLE: AOP_DOWNSUBSCR
  begin
    select 1
      into l_check
      from all_tables
     where table_name = 'AOP_DOWNSUBSCR'
     and owner = l_sert_base_schema;

  exception
  when no_data_found then
    execute immediate q'~
      create table sert_core.aop_downsubscr
      ( id                        number not null,
        app_id                    number,
        page_id                   number,
        region_pipe_report_ids    varchar2(4000),
        items_in_session          varchar2(4000),
        app_user                  varchar2(4000),
        template_type             varchar2(100),
        template_source           clob,
        output_type               varchar2(4000),
        output_to                 varchar2(100),
        output_procedure          varchar2(100),
        start_date                TIMESTAMP WITH LOCAL TIME ZONE,
        end_date                  TIMESTAMP WITH LOCAL TIME ZONE,
        repeat_every              number,
        repeat_interval           varchar2(100),
        repeat_days               varchar2(100),
        repeat_string             varchar2(255),
        email_from                varchar2(4000),
        email_to                  varchar2(4000),
        email_cc                  varchar2(4000),
        email_bcc                 varchar2(4000),
        email_subject             varchar2(4000),
        email_body_text           clob,
        email_body_html           clob,
        comments                  varchar2(4000),
        job_name                  varchar2(4000),
        init_code                 clob,
        email_download_link       varchar2(4000),
        email_blob_size           number,
        save_log                  varchar2(1),
        created                   date not null,
        created_by                varchar2(255) not null,
        updated                   date not null,
        updated_by                varchar2(255) not null,
        CONSTRAINT aop_downsubscr_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
      )
    ~';

    execute immediate q'~
      create sequence sert_core.aop_downsubscr_seq
    ~';
  end;

  -- TABLE: AOP_DOWNSUBSCR_ITEM
  begin
    select 1
      into l_check
      from all_tables
     where table_name = 'AOP_DOWNSUBSCR_ITEM'
     and owner = l_sert_base_schema;

  exception
  when no_data_found then
    execute immediate q'~
      create table sert_core.aop_downsubscr_item (
        id            number not null,
        downsubscr_id number not null
        constraint aop_downsubscr_item_report_fk references sert_core.aop_downsubscr,
        item_name     varchar2(255),
        item_value    clob,
        created       date not null,
        created_by    varchar2(255) not null,
        updated       date not null,
        updated_by    varchar2(255) not null,
        CONSTRAINT aop_downsubscr_item_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
      )
    ~';
  end;

  -- TABLE: AOP_DOWNSUBSCR_LOG
  begin
    select 1
      into l_check
      from all_tables
     where table_name = 'AOP_DOWNSUBSCR_LOG'
     and owner = l_sert_base_schema;

  exception
  when no_data_found then
    execute immediate q'~
      create table sert_core.aop_downsubscr_log
      ( id                        number not null,
        app_id                    number,
        page_id                   number,
        region_pipe_report_ids    varchar2(4000),
        app_user                  varchar2(4000),
        output_filename           varchar2(300),
        output_mime_type          varchar2(250),
        downsubscr_id             number
        constraint aop_downsubscr_log_fk references sert_core.aop_downsubscr,
        created                   date not null,
        created_by                varchar2(255) not null,
        CONSTRAINT aop_downsubscr_log_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
      )
    ~';
  end;

  -- TABLE: AOP_DOWNSUBSCR_OUTPUT
  begin
    select 1
      into l_check
      from all_tables
     where table_name = 'AOP_DOWNSUBSCR_OUTPUT'
     and owner = l_sert_base_schema;

  exception
  when no_data_found then
    execute immediate q'~
      create table sert_core.aop_downsubscr_output
      ( id                        number not null,
        app_id                    number,
        page_id                   number,
        app_user                  varchar2(4000),
        downsubscr_id             number
        constraint aop_downsubscr_output_fk references sert_core.aop_downsubscr,
        output_filename           varchar2(300),
        output_blob               blob,
        output_mime_type          varchar2(250),
        created                   date not null,
        created_by                varchar2(255) not null,
        CONSTRAINT aop_downsubscr_output_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
      )
    ~';
  end;

  -- TABLE: AOP_DOWNSUBSCR_MESSAGE
  begin
    select 1
      into l_check
      from all_tables
     where table_name = 'AOP_DOWNSUBSCR_MESSAGE'
     and owner = l_sert_base_schema;

  exception
  when no_data_found then
    execute immediate q'~
      create table sert_core.aop_downsubscr_message
      ( id                        number not null,
        name                      varchar2(100),
        language                  varchar2(100),
        message                   varchar2(4000),
        created                   date not null,
        created_by                varchar2(255) not null,
        updated                   date not null,
        updated_by                varchar2(255) not null,
        CONSTRAINT aop_downsubscr_message_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
      )
    ~';
  end;

end;
/

create or replace trigger sert_core.aop_config_biu
    before insert or update
    on sert_core.aop_config
    for each row
begin
    if :new.id is null then
        :new.id := 1;
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end aop_config_biu;
/

create or replace trigger sert_core.aop_downsubscr_template_biu
    before insert or update
    on sert_core.aop_downsubscr_template
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end aop_downsubscr_template_biu;
/

create or replace trigger sert_core.aop_downsubscr_template_app_bi
    before insert or update
    on sert_core.aop_downsubscr_template_app
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end aop_downsubscr_template_app_bi;
/

create or replace trigger sert_core.aop_downsubscr_biu
    before insert or update
    on sert_core.aop_downsubscr
    for each row
begin
    if :new.id is null then
        $IF DBMS_DB_VERSION.VER_LE_11 $THEN
        :new.id := aop_downsubscr_seq.nextval;
        $ELSIF DBMS_DB_VERSION.VER_LE_12 $THEN
        :new.id := aop_downsubscr_seq.nextval;
        $ELSE
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
        $END
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end aop_downsubscr_biu;
/

create or replace trigger sert_core.aop_downsubscr_item_biu
    before insert or update
    on sert_core.aop_downsubscr_item
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end aop_downsubscr_item_biu;
/

create or replace trigger sert_core.aop_downsubscr_log_biu
    before insert or update
    on sert_core.aop_downsubscr_log
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
end aop_downsubscr_log_biu;
/

create or replace trigger sert_core.aop_downsubscr_output_biu
    before insert or update
    on sert_core.aop_downsubscr_output
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
end aop_downsubscr_output_biu;
/

create or replace trigger sert_core.aop_downsubscr_message_biu
    before insert or update
    on sert_core.aop_downsubscr_message
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end aop_downsubscr_message_biu;
/

CREATE OR REPLACE FORCE VIEW "sert_core.OUTPUTTO_COLLECTION" ("ID", "FILENAME", "MIMETYPE", "FILE_CONTENT") AS
  select
  seq_id id,
  c001 filename,
  c002 mimetype,
  blob001 file_content
from
  apex_collections
where
  collection_name = 'OUTPUTTO_COLLECTION'
/
--rollback not required
