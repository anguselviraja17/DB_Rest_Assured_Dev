SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Insured Companies] (
		[Insured_Co]                            [int] IDENTITY(1, 1) NOT NULL,
		[Insured_Name]                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_Desc]                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_Industry]                      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_HQ_Address]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_HQ_State]                      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_HQ_City]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_HQ_Zip]                        [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_HQ_Country]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_Geo_Coverage]                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date_Added]                            [datetime] NULL,
		[Insured_Primary_Contact]               [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_Primary_Contact_Last_Name]     [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_Primary_Contact_Phone]         [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_Primacy_Contact_email]         [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[New_Company_Validation_Flag]           [bit] NULL,
		[Parent_Sub_Flag]                       [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Parent_Insured_Co]                     [int] NULL,
		CONSTRAINT [PK_RA - Insured Companies]
		PRIMARY KEY
		CLUSTERED
		([Insured_Co])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Insured Companies]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Insured Companies_RA - Insured Companies1]
	FOREIGN KEY ([Parent_Insured_Co]) REFERENCES [dbo].[RA - Insured Companies] ([Insured_Co])
ALTER TABLE [dbo].[RA - Insured Companies]
	CHECK CONSTRAINT [FK_RA - Insured Companies_RA - Insured Companies1]

GO
ALTER TABLE [dbo].[RA - Insured Companies] SET (LOCK_ESCALATION = TABLE)
GO
