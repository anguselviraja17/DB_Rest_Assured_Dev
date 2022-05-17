SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Industry - Equipment Rate Ranges] (
		[Industry_Equipment_ID]                [int] IDENTITY(1, 1) NOT NULL,
		[Geo_Scope]                            [int] NULL,
		[Geo_Country]                          [int] NULL,
		[Geo_State_Prov]                       [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Geo_Zip]                              [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Geo_County]                           [int] NULL,
		[Equipment_Name]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Equipment_Abbrev]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Equipment_Long_Desc]                  [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Equipment_Type]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Equipment_Low_Rate_Day]               [money] NULL,
		[Equipment_Low_Rate_Week]              [money] NULL,
		[Equipment_Low_Rate_Month]             [money] NULL,
		[Equipment_High_Rate_Day]              [money] NULL,
		[Equipment_High_Rate_Week]             [money] NULL,
		[Equipment_High_Rate_Month]            [money] NULL,
		[Rule_Source_Type]                     [int] NULL,
		[Industry_Standard_Equipment_Code]     [varbinary](50) NULL,
		[Equipment_Unit_Type]                  [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rule_Source_Rest_Co]                  [int] NULL,
		[Rule_Source_Contract_ID]              [int] NULL,
		[Rule_Source_Job_ID]                   [int] NULL,
		[Rule_Source_Bill_ID]                  [int] NULL,
		[Fuzzy_Original_Rule_Basis]            [int] NULL,
		[Date_Executed]                        [date] NULL,
		[Date_Added]                           [date] NULL,
		CONSTRAINT [PK_Industry_Equipment_Rate_Range]
		PRIMARY KEY
		CLUSTERED
		([Industry_Equipment_ID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Equipment Rate Ranges]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Industry - Equipment Rate Ranges_RA - Industry - Geo Scope]
	FOREIGN KEY ([Geo_Scope]) REFERENCES [dbo].[RA - Industry - Geo Scope] ([Geo_Scope_ID])
ALTER TABLE [dbo].[RA - Industry - Equipment Rate Ranges]
	CHECK CONSTRAINT [FK_RA - Industry - Equipment Rate Ranges_RA - Industry - Geo Scope]

GO
ALTER TABLE [dbo].[RA - Industry - Equipment Rate Ranges]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Industry - Equipment Rate Ranges_RA - Industry - Rule Source Type]
	FOREIGN KEY ([Rule_Source_Type]) REFERENCES [dbo].[RA - Industry - Rule Source Type] ([Industry_Rule_Source_Type])
ALTER TABLE [dbo].[RA - Industry - Equipment Rate Ranges]
	CHECK CONSTRAINT [FK_RA - Industry - Equipment Rate Ranges_RA - Industry - Rule Source Type]

GO
ALTER TABLE [dbo].[RA - Industry - Equipment Rate Ranges] SET (LOCK_ESCALATION = TABLE)
GO
