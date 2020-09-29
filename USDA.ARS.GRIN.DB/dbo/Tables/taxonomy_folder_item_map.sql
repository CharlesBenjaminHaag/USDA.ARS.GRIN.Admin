CREATE TABLE [dbo].[taxonomy_folder_item_map] (
    [taxonomy_folder_item_id] INT      IDENTITY (1, 1) NOT NULL,
    [taxonomy_folder_id]      INT      NOT NULL,
    [item_id]                 INT      NOT NULL,
    [created_by]              INT      NULL,
    [created_date]            DATETIME CONSTRAINT [DF_taxonomy_folder_item_created_date] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_taxonomy_folder_item] PRIMARY KEY CLUSTERED ([taxonomy_folder_item_id] ASC),
    CONSTRAINT [FK_taxonomy_folder_item_cooperator] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [FK_taxonomy_folder_item_taxonomy_folder] FOREIGN KEY ([taxonomy_folder_id]) REFERENCES [dbo].[taxonomy_folder] ([taxonomy_folder_id]) ON DELETE CASCADE
);

