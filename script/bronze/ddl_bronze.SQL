/*
===============================================================================
Create Bronze Layer Tables
===============================================================================

Script Purpose:
    This script creates all tables required for the bronze layer
    of the Datawarehouse project.

    Data types are temporarily defined as NVARCHAR where needed
    to handle spaces, invalid values, and formatting issues during
    raw data import.

WARNING:
    Running this script will drop existing bronze tables
    and permanently delete their data.
===============================================================================
*/

USE Datawarehouse;
GO

/*=============================================================================
    CRM TABLES
=============================================================================*/

DROP TABLE IF EXISTS bronze.crm_cust_info;
GO

CREATE TABLE bronze.crm_cust_info
(
    cst_id                 NVARCHAR(50), -- Changed to NVARCHAR to handle spaces during import
    cst_key                NVARCHAR(50),
    cst_firstname          NVARCHAR(50),
    cst_lastname           NVARCHAR(50),
    cst_marital_status     NVARCHAR(50),
    cst_gndr               NVARCHAR(50),
    cst_create_date        NVARCHAR(50)  -- Changed to NVARCHAR to avoid date format errors
);
GO


DROP TABLE IF EXISTS bronze.crm_prd_info;
GO

CREATE TABLE bronze.crm_prd_info
(
    prd_id                 NVARCHAR(50), -- Changed to NVARCHAR for flexible import
    prd_key                NVARCHAR(50),
    prd_nm                 NVARCHAR(50),
    prd_cost               NVARCHAR(50), -- Avoid numeric conversion issues
    prd_line               NVARCHAR(50),
    prd_start_dt           NVARCHAR(50), -- Avoid datetime conversion issues
    prd_end_dt             NVARCHAR(50)
);
GO


DROP TABLE IF EXISTS bronze.crm_sales_details;
GO

CREATE TABLE bronze.crm_sales_details
(
    sls_ord_num            NVARCHAR(50),
    sls_prd_key            NVARCHAR(50),
    sls_cust_id            NVARCHAR(50),
    sls_order_dt           NVARCHAR(50), -- Imported as text first
    sls_ship_dt            NVARCHAR(50),
    sls_due_dt             NVARCHAR(50),
    sls_sales              NVARCHAR(50),
    sls_quantity           NVARCHAR(50),
    sls_price              NVARCHAR(50)
);
GO


/*=============================================================================
    ERP TABLES
=============================================================================*/

DROP TABLE IF EXISTS bronze.erp_loc_a101;
GO

CREATE TABLE bronze.erp_loc_a101
(
    cid                    NVARCHAR(50),
    cntry                  NVARCHAR(50)
);
GO


DROP TABLE IF EXISTS bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12
(
    cid                    NVARCHAR(50),
    bdate                  NVARCHAR(50), -- Avoid date parsing issues during import
    gen                    NVARCHAR(50)
);
GO


DROP TABLE IF EXISTS bronze.erp_px_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2
(
    id                     NVARCHAR(50),
    cat                    NVARCHAR(50),
    subcat                 NVARCHAR(50),
    maintenance            NVARCHAR(50)
);
GO
