SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Contracts] (
		[Contract_ID]                      [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Co_ID]                       [int] NULL,
		[Insured_Co_ID]                    [int] NULL,
		[Customer_Number]                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contract_Name]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contract Description]             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contract Date]                    [date] NULL,
		[Contract Type]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Primary_Signer_ID]        [int] NULL,
		[Insured_Co_Primary_Signer_ID]     [int] NULL,
		[Contract_URL]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contract_End]                     [datetime] NULL,
		[Contract_S3_File_Name]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contract_S3_Bucket_Name]          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Contracts]
		PRIMARY KEY
		CLUSTERED
		([Contract_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Contracts]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Contracts_RA - Insured Companies]
	FOREIGN KEY ([Insured_Co_ID]) REFERENCES [dbo].[RA - Insured Companies] ([Insured_Co])
ALTER TABLE [dbo].[RA - Contracts]
	CHECK CONSTRAINT [FK_RA - Contracts_RA - Insured Companies]

GO
ALTER TABLE [dbo].[RA - Contracts]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Contracts_RA - Restoration Companies]
	FOREIGN KEY ([Rest_Co_ID]) REFERENCES [dbo].[RA - Restoration Companies] ([Rest_Co_ID])
ALTER TABLE [dbo].[RA - Contracts]
	CHECK CONSTRAINT [FK_RA - Contracts_RA - Restoration Companies]

GO
ALTER TABLE [dbo].[RA - Contracts] SET (LOCK_ESCALATION = TABLE)
GO
