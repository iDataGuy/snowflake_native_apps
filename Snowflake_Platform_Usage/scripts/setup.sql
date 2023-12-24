-- ==========================================
-- This script runs when the app is installed 
-- ==========================================

-- Create Application Role and Schema

create application role if not exists app_instance_role;

-- create versioned schema + view
CREATE OR ALTER VERSIONED SCHEMA code_schema;
GRANT USAGE ON SCHEMA code_schema TO APPLICATION ROLE app_instance_role;

-- Create Streamlit app
create or replace streamlit code_schema.snowflake_account_status from '/libraries' main_file='streamlit.py';

-- Create UDFs

-- Create Stored Procedure

-- Grant usage and permissions on objects

grant usage on streamlit code_schema.snowflake_account_status to application role app_instance_role;

