CREATE TABLE [improvement_level_mcpd_code_map] (
    [improvement_level_mcpd_code_map_id] INT           IDENTITY (1, 1) NOT NULL,
    [improvement_level_code]             NVARCHAR (20) NOT NULL,
    [mcpd_code]                          NVARCHAR (20) NULL,
    CONSTRAINT [PK_improvement_level_mcpd_code_map] PRIMARY KEY CLUSTERED ([improvement_level_mcpd_code_map_id] ASC)
);

