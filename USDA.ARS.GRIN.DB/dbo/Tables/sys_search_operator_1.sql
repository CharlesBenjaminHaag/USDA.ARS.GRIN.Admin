CREATE TABLE [sys_search_operator] (
    [sys_search_operator_id] NVARCHAR (3)   NOT NULL,
    [title]                  NVARCHAR (50)  NOT NULL,
    [syntax]                 NVARCHAR (500) NOT NULL,
    CONSTRAINT [PK_sys_search_operator] PRIMARY KEY CLUSTERED ([sys_search_operator_id] ASC)
);

