SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Restoration Companies] (
		[Rest_Co_ID]                        [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Co_Name]                      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Service]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Industry]                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_HQ_Address]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_HQ_City]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_HQ_State]                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_HQ_Zip]                    [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_HQ_Country]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Geo]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date_Added]                        [datetime] NULL,
		[Rest_Co_Primary_Contact]           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Primary_Contact_Phone]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Primacy_Contact_email]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Primacy]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Federal_ID_Num]            [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[New_Company_Validation_Flag]       [bit] NULL,
		[Parent_Sub_Flag]                   [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Parent_Rest_Co]                    [int] NULL,
		CONSTRAINT [PK_RA - Restoration Companies]
		PRIMARY KEY
		CLUSTERED
		([Rest_Co_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Restoration Companies]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Restoration Companies_RA - Restoration Companies]
	FOREIGN KEY ([Parent_Rest_Co]) REFERENCES [dbo].[RA - Restoration Companies] ([Rest_Co_ID])
ALTER TABLE [dbo].[RA - Restoration Companies]
	CHECK CONSTRAINT [FK_RA - Restoration Companies_RA - Restoration Companies]

GO
ALTER TABLE [dbo].[RA - Restoration Companies] SET (LOCK_ESCALATION = TABLE)
GO
