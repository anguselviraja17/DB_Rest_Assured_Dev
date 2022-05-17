SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Independent-Adjuster-Companies] (
		[Ind_Adjuster_Co_ID]                          [int] IDENTITY(1, 1) NOT NULL,
		[Ind_Adjuster_Co_Name]                        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Ind_Adjuster_Co_Desc]                        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Ind_Adjuster_Address]                        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Ind_Adjuster_City]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Ind_Adjuster_State]                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Ind_Adjuster_Zip]                            [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Ind_Adjuster_Country]                        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Ind_Adjuster_Primary_Contact_First_Name]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Ind_Adjuster_Primary_Contact_Last_Name]      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Ind_Adjuster_Primary_Contact_phone]          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Ind_adjuster_Primary_Contact_e-mail]         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Last_Update_Date]                            [datetime] NULL,
		[New_Company_Validation_Flag]                 [bit] NULL,
		[Parent_Sub_Flag]                             [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Parent_Adjuster_Co]                          [int] NULL,
		CONSTRAINT [PK_RA - Independent-Adjuster-Companies]
		PRIMARY KEY
		CLUSTERED
		([Ind_Adjuster_Co_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Independent-Adjuster-Companies]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Independent-Adjuster-Companies_RA - Independent-Adjuster-Companies]
	FOREIGN KEY ([Ind_Adjuster_Co_ID]) REFERENCES [dbo].[RA - Independent-Adjuster-Companies] ([Ind_Adjuster_Co_ID])
ALTER TABLE [dbo].[RA - Independent-Adjuster-Companies]
	CHECK CONSTRAINT [FK_RA - Independent-Adjuster-Companies_RA - Independent-Adjuster-Companies]

GO
ALTER TABLE [dbo].[RA - Independent-Adjuster-Companies]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Independent-Adjuster-Companies_RA - Independent-Adjuster-Companies1]
	FOREIGN KEY ([Parent_Adjuster_Co]) REFERENCES [dbo].[RA - Independent-Adjuster-Companies] ([Ind_Adjuster_Co_ID])
ALTER TABLE [dbo].[RA - Independent-Adjuster-Companies]
	CHECK CONSTRAINT [FK_RA - Independent-Adjuster-Companies_RA - Independent-Adjuster-Companies1]

GO
ALTER TABLE [dbo].[RA - Independent-Adjuster-Companies] SET (LOCK_ESCALATION = TABLE)
GO
