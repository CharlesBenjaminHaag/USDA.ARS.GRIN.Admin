CREATE TABLE [dbo].[feedback_form_trait] (
    [feedback_form_trait_id] INT            IDENTITY (1, 1) NOT NULL,
    [feedback_form_id]       INT            NOT NULL,
    [crop_trait_id]          INT            NOT NULL,
    [sort_order]             INT            NOT NULL,
    [references_tag]         NVARCHAR (50)  NULL,
    [title]                  NVARCHAR (500) NULL,
    [description]            NVARCHAR (MAX) NOT NULL,
    [created_date]           DATETIME2 (7)  NOT NULL,
    [created_by]             INT            NOT NULL,
    [modified_date]          DATETIME2 (7)  NULL,
    [modified_by]            INT            NULL,
    [owned_date]             DATETIME2 (7)  NOT NULL,
    [owned_by]               INT            NOT NULL,
    CONSTRAINT [PK_feedback_form_trait] PRIMARY KEY CLUSTERED ([feedback_form_trait_id] ASC),
    CONSTRAINT [fk_fft_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fft_ct] FOREIGN KEY ([crop_trait_id]) REFERENCES [dbo].[crop_trait] ([crop_trait_id]),
    CONSTRAINT [fk_fft_ff] FOREIGN KEY ([feedback_form_id]) REFERENCES [dbo].[feedback_form] ([feedback_form_id]),
    CONSTRAINT [fk_fft_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fft_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fft_created]
    ON [dbo].[feedback_form_trait]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fft_ct]
    ON [dbo].[feedback_form_trait]([crop_trait_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fft_modified]
    ON [dbo].[feedback_form_trait]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fft_owned]
    ON [dbo].[feedback_form_trait]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_fft]
    ON [dbo].[feedback_form_trait]([feedback_form_id] ASC, [crop_trait_id] ASC);

