CREATE TABLE [sys_search_resolver] (
    [sys_search_resolver_id] INT            IDENTITY (1, 1) NOT NULL,
    [sys_dataview_id]        INT            NOT NULL,
    [resolved_pkey_name]     NVARCHAR (100) NOT NULL,
    [sys_table_id]           INT            NOT NULL,
    [created_date]           DATETIME2 (7)  NOT NULL,
    [created_by]             INT            NOT NULL,
    [modified_date]          DATETIME2 (7)  NULL,
    [modified_by]            INT            NULL,
    [owned_date]             DATETIME2 (7)  NOT NULL,
    [owned_by]               INT            NOT NULL,
    CONSTRAINT [PK_sys_search_resolver] PRIMARY KEY CLUSTERED ([sys_search_resolver_id] ASC),
    CONSTRAINT [fk_ssr_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ssr_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ssr_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ssr_sd] FOREIGN KEY ([sys_dataview_id]) REFERENCES [sys_dataview] ([sys_dataview_id]),
    CONSTRAINT [fk_ssr_st] FOREIGN KEY ([sys_table_id]) REFERENCES [sys_table] ([sys_table_id])
);


GO
GRANT DELETE
    ON OBJECT::[sys_search_resolver] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[sys_search_resolver] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_search_resolver] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[sys_search_resolver] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_search_resolver] TO [gg_search]
    AS [dbo];

