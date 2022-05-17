SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Company Information] (
		[Company_ID]                             [int] IDENTITY(1, 1) NOT NULL,
		[Company_Type]                           [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company_Name]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company_Desc]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company_Address]                        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company_City]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company_State]                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company_Zip]                            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company_Primary_Contact_First_Name]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company_Primary_Contact_Last_Name]      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company_Primary_Contact_phone]          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company_Primary_Contact_email]          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Last_Update_Date]                       [datetime] NULL,
		CONSTRAINT [PK_RA - Company Information]
		PRIMARY KEY
		CLUSTERED
		([Company_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Company Information] SET (LOCK_ESCALATION = TABLE)
GO
