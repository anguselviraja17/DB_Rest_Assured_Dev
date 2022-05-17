SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Industry - Raw - Role Rate Ranges] (
		[Industry_Role_ID]                [int] IDENTITY(1, 1) NOT NULL,
		[Geo_Scope]                       [int] NULL,
		[Geo_Country]                     [int] NULL,
		[Geo_State_Prov]                  [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Geo_Zip]                         [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Geo_County]                      [int] NULL,
		[Role_Name]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Abbrev]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Long_Desc]                  [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Type]                       [varbinary](50) NULL,
		[Role_Low_Rate]                   [money] NULL,
		[Role_High_Rate]                  [money] NULL,
		[Rule_Source_Type]                [int] NULL,
		[Industry_Standard_Role_Code]     [varbinary](50) NULL,
		[Rule_Source_Rest_Co]             [int] NULL,
		[Rule_Source_Contract_ID]         [int] NULL,
		[Rule_Source_Job_ID]              [int] NULL,
		[Rule_Source_Bill_ID]             [int] NULL,
		[Fuzzy_Original_Rule_Basis]       [int] NULL,
		[Management_Ind]                  [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date_Executed]                   [date] NULL,
		[Date_Added]                      [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Raw - Role Rate Ranges] SET (LOCK_ESCALATION = TABLE)
GO
