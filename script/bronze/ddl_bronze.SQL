/*
===============================================================================
Create Bronze Layer Tables
===============================================================================

Script Purpose:
    This script creates all tables required for the bronze layer
    of the Datawarehouse project.

    Data types are temporarily defined to support raw data ingestion
    from CSV files before transformation and cleansing operations.

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

-- Drop and recreate CRM Customer Information Table
DROP TABLE IF EXISTS bronze.crm_cust_info;
GO

CREATE TABLE bronze.crm_cust_info
(
    cst_id                 INT,
    cst_key                NVARCHAR(50),
    cst_firstname          NVARCHAR(50),
    cst_lastname           NVARCHAR(50),
    cst_marital_status     NVARCHAR(50),
    cst_gndr               NVARCHAR(50),
    cst_create_date        DATE
);
GO


-- Drop and recreate CRM Product Information Table
DROP TABLE IF EXISTS bronze.crm_prd_info;
GO

CREATE TABLE bronze.crm_prd_info
(
    prd_id                 INT,
    prd_key                NVARCHAR(50),
    prd_nm                 NVARCHAR(50),
    prd_cost               INT,
    prd_line               NVARCHAR(50),
    prd_start_dt           DATETIME,
    prd_end_dt             DATETIME
);
GO


-- Drop and recreate CRM Sales Details Table
DROP TABLE IF EXISTS bronze.crm_sales_details;
GO

CREATE TABLE bronze.crm_sales_details
(
    sls_ord_num            NVARCHAR(50),
    sls_prd_key            NVARCHAR(50),
    sls_cust_id            INT,
    sls_order_dt           INT,
    sls_ship_dt            INT,
    sls_due_dt             INT,
    sls_sales              INT,
    sls_quantity           INT,
    sls_price              INT
);
GO


/*=============================================================================
    ERP TABLES
=============================================================================*/

-- Drop and recreate ERP Location Table
DROP TABLE IF EXISTS bronze.erp_loc_a101;
GO

CREATE TABLE bronze.erp_loc_a101
(
    cid                    NVARCHAR(50),
    cntry                  NVARCHAR(50)
);
GO


-- Drop and recreate ERP Customer Table
DROP TABLE IF EXISTS bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12
(
    cid                    NVARCHAR(50),
    bdate                  DATE,
    gen                    NVARCHAR(50)
);
GO


-- Drop and recreate ERP Product Category Table
DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2
(
    id                     NVARCHAR(50),
    cat                    NVARCHAR(50),
    subcat                 NVARCHAR(50),
    maintenance            NVARCHAR(50)
);
GO
