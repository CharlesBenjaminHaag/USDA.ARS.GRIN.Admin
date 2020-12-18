CREATE TABLE [inventory_quality_status] (
    [inventory_quality_status_id]  INT             IDENTITY (1, 1) NOT NULL,
    [inventory_id]                 INT             NOT NULL,
    [test_type_code]               NVARCHAR (20)   NOT NULL,
    [contaminant_code]             NVARCHAR (20)   NOT NULL,
    [test_result_code]             NVARCHAR (20)   NULL,
    [plant_part_tested_code]       NVARCHAR (20)   NULL,
    [test_results_score]           NVARCHAR (40)   NULL,
    [test_results_score_type_code] NVARCHAR (20)   NULL,
    [negative_control]             DECIMAL (10, 5) NULL,
    [positive_control]             DECIMAL (10, 5) NULL,
    [replicate]                    INT             NULL,
    [started_date]                 DATETIME2 (7)   NULL,
    [started_date_code]            NVARCHAR (20)   NULL,
    [completed_date]               DATETIME2 (7)   NULL,
    [completed_date_code]          NVARCHAR (20)   NULL,
    [required_replication_count]   INT             NULL,
    [started_count]                INT             NULL,
    [completed_count]              INT             NULL,
    [plate_or_assay_number]        NVARCHAR (40)   NULL,
    [method_id]                    INT             NULL,
    [tester_cooperator_id]         INT             NULL,
    [note]                         NVARCHAR (MAX)  NULL,
    [created_date]                 DATETIME2 (7)   NOT NULL,
    [created_by]                   INT             NOT NULL,
    [modified_date]                DATETIME2 (7)   NULL,
    [modified_by]                  INT             NULL,
    [owned_date]                   DATETIME2 (7)   NOT NULL,
    [owned_by]                     INT             NOT NULL,
    CONSTRAINT [PK_inventory_quality_status] PRIMARY KEY CLUSTERED ([inventory_quality_status_id] ASC),
    CONSTRAINT [fk_iqs_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_iqs_cur] FOREIGN KEY ([tester_cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_iqs_i] FOREIGN KEY ([inventory_id]) REFERENCES [inventory] ([inventory_id]),
    CONSTRAINT [fk_iqs_me] FOREIGN KEY ([method_id]) REFERENCES [method] ([method_id]),
    CONSTRAINT [fk_iqs_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_iqs_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_iqs_created]
    ON [inventory_quality_status]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_iqs_cur]
    ON [inventory_quality_status]([tester_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_iqs_i]
    ON [inventory_quality_status]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_iqs_me]
    ON [inventory_quality_status]([method_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_iqs_modified]
    ON [inventory_quality_status]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_iqs_owned]
    ON [inventory_quality_status]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_iqs_test]
    ON [inventory_quality_status]([test_type_code] ASC, [contaminant_code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_iqs]
    ON [inventory_quality_status]([inventory_id] ASC, [test_type_code] ASC, [contaminant_code] ASC, [started_date] ASC, [plant_part_tested_code] ASC, [test_results_score_type_code] ASC, [replicate] ASC);


GO
GRANT DELETE
    ON OBJECT::[inventory_quality_status] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[inventory_quality_status] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[inventory_quality_status] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[inventory_quality_status] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[inventory_quality_status] TO [gg_search]
    AS [dbo];

