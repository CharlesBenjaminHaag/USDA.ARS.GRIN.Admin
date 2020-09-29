CREATE TABLE [dbo].[sys_search_operator] (
    [sys_search_operator_id] INT            IDENTITY (1, 1) NOT NULL,
    [code]                   NVARCHAR (20)  NOT NULL,
    [title]                  NVARCHAR (50)  NOT NULL,
    [syntax]                 NVARCHAR (500) NOT NULL,
    CONSTRAINT [PK_sys_search_operator] PRIMARY KEY CLUSTERED ([sys_search_operator_id] ASC)
);

