SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Industry - Material Audit Rates] (
		[Industry_Material_Audit_ID]          [int] IDENTITY(1, 1) NOT NULL,
		[Industry_Material_Audit_Version]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Material_Name_Alias]        [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Material_ID]                [int] NULL,
		[Industry_Material_Name]              [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[MaxOfMaterial_High_Rate]             [money] NULL,
		[MinOfMaterial_High_Rate]             [money] NULL,
		[AVGOfMaterial_High_Rate]             [money] NULL,
		[NumOfMaterial_High_Rate]             [money] NULL,
		[Quart3OfMaterial_High_Rate_Day]      [money] NULL,
		[MaxQuatDiff]                         [money] NULL,
		CONSTRAINT [PK_RA - Industry - Material Audit Rates]
		PRIMARY KEY
		CLUSTERED
		([Industry_Material_Audit_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Material Audit Rates] SET (LOCK_ESCALATION = TABLE)
GO
