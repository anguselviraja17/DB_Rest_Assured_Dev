SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Company Contacts] (
		[Company_Contact_ID]        [int] IDENTITY(1, 1) NOT NULL,
		[Company_ID]                [int] NULL,
		[Company_Type]              [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contact_First_Name]        [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contact_Last_Name]         [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contact_EMail_Address]     [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contact_Phone_Number]      [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contact_Addresss]          [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contact_City]              [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contact_State]             [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contact_Zip]               [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Company Contacts]
		PRIMARY KEY
		CLUSTERED
		([Company_Contact_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Company Contacts] SET (LOCK_ESCALATION = TABLE)
GO
