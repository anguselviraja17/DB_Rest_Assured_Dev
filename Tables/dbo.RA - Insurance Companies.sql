SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Insurance Companies] (
		[Insurance_Co_ID]                             [int] IDENTITY(1, 1) NOT NULL,
		[Insurance_Co_Name]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insurance_Co_Desc]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insurance_Co_HQ_Address]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insurance_Co_HQ_City]                        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insuracne_Co_HQ_State]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insurance_Co_HQ_Zip]                         [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insurance_Co_HQ_Country]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insurance_Co_Geo_Coverage]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date_Added]                                  [datetime] NULL,
		[Insurance_Co_Primary_Contact_First_Name]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insurance_Co_Primary_Contact_Last_Name]      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insurance_Co_Primary_Contact_Phone]          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insurance_Co_Primary_Contact_email]          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[New_Company_Validation_Flag]                 [bit] NULL,
		[Parent_Sub_Flag]                             [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Parent_Insurance_Co]                         [int] NULL,
		CONSTRAINT [PK_RA - Insurance Companies]
		PRIMARY KEY
		CLUSTERED
		([Insurance_Co_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Insurance Companies]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Insurance Companies_RA - Insurance Companies]
	FOREIGN KEY ([Parent_Insurance_Co]) REFERENCES [dbo].[RA - Insurance Companies] ([Insurance_Co_ID])
ALTER TABLE [dbo].[RA - Insurance Companies]
	CHECK CONSTRAINT [FK_RA - Insurance Companies_RA - Insurance Companies]

GO
ALTER TABLE [dbo].[RA - Insurance Companies] SET (LOCK_ESCALATION = TABLE)
GO
