CREATE SCHEMA IF NOT EXISTS %schemaName%;

CREATE TABLE %schemaName%.OUTBOX_SCHEMA_VERSION(
    ID INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    VERSION VARCHAR(255) NOT NULL,
    CREATED TIMESTAMP NOT NULL,
    PRIMARY KEY (ID)
    );

INSERT INTO %schemaName%.OUTBOX_SCHEMA_VERSION (VERSION, CREATED) VALUES ('1.11.0', CURRENT_TIMESTAMP);

CREATE TABLE IF NOT EXISTS %schemaName%.event_store
(
    id integer GENERATED ALWAYS AS IDENTITY (START WITH 1),
    type text COLLATE pg_catalog."default",
    created timestamp(4) without time zone,
    payload text COLLATE pg_catalog."default",
    REMAINING_RETRIES INT NOT NULL,
    BLOCKED_UNTIL TIMESTAMP NOT NULL,
    ERROR VARCHAR(1000),
    CAMUNDA_TASK_ID VARCHAR(40),
    SYSTEM_ENGINE_IDENTIFIER VARCHAR(128),
    CONSTRAINT event_store_pkey PRIMARY KEY (id)
    );
