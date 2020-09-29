CREATE TABLE [dbo].[crop_germplasm_committee_crop_descriptor] (
    [crop_germplasm_committee_id] INT NOT NULL,
    [crop_id]                     INT NOT NULL,
    CONSTRAINT [PK_crop_germplasm_committee_crop_descriptor] PRIMARY KEY CLUSTERED ([crop_germplasm_committee_id] ASC, [crop_id] ASC)
);

