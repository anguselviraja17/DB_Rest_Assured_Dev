SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Jobs-ROMs] (
		[Job_ID]                        [int] IDENTITY(1, 1) NOT NULL,
		[Contract_ID]                   [int] NULL,
		[Rest_Co_Job_Number]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Rest_Co_ID]                    [int] NULL,
		[Insured_Co_ID]                 [int] NULL,
		[Insurance_Co_ID]               [int] NULL,
		[IA_Co_ID]                      [int] NULL,
		[Job_Name]                      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Description]               [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Address]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_City]                      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_State]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Zip]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_County]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Type]                      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Event_Type]                [int] NULL,
		[Job_Contract_Date]             [date] NULL,
		[Job_Contract_Type]             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Primary_Signer]        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_Co_Primary_Signer]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_ID]                   [int] NULL,
		[Building_Type]                 [int] NULL,
		[Scope_of_Work_Summary]         [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Construction_Type_Primary]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ROM_Document]                  [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Estimated_Total_Cost]          [money] NULL,
		[Occupancy_Type_Primary]        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Estimated_Job_Duration]        [int] NULL,
		[Estimated_Job_Start_Date]      [date] NULL,
		[Estimated_Job_End_Date]        [date] NULL,
		[ROM_URL]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IA_Company_Involved]           [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IA_Assigned_Contact_ID]        [int] NULL,
		[RC_Contact_ID]                 [int] NULL,
		[PO_Contact_ID]                 [int] NULL,
		[CAT_Named_Event_Ind]           [int] NULL,
		[CAT_Name]                      [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Submitted_to_RA_Date]          [datetime] NULL,
		[Job_S3_File_Name]              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_S3_Bucket_Name]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Last_Update_Date]              [datetime] NULL,
		CONSTRAINT [PK_RA - Jobs-ROMs]
		PRIMARY KEY
		CLUSTERED
		([Job_ID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	ADD
	CONSTRAINT [DF_RA - Jobs-ROMs_Last_Update_Date]
	DEFAULT (getdate()) FOR [Last_Update_Date]
GO
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs_RA - Independent-Adjuster-Companies]
	FOREIGN KEY ([IA_Co_ID]) REFERENCES [dbo].[RA - Independent-Adjuster-Companies] ([Ind_Adjuster_Co_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs_RA - Independent-Adjuster-Companies]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs_RA - Independent-Adjuster-Companies-Contacts]
	FOREIGN KEY ([IA_Assigned_Contact_ID]) REFERENCES [dbo].[RA - Independent-Adjuster-Companies-Contacts] ([IA_Co_Contact_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs_RA - Independent-Adjuster-Companies-Contacts]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs_RA - Insurance Companies]
	FOREIGN KEY ([Insurance_Co_ID]) REFERENCES [dbo].[RA - Insurance Companies] ([Insurance_Co_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs_RA - Insurance Companies]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs_RA - Insured Companies]
	FOREIGN KEY ([Insured_Co_ID]) REFERENCES [dbo].[RA - Insured Companies] ([Insured_Co])
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs_RA - Insured Companies]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs_RA - Jobs-ROMs - Cat Names-Numbers]
	FOREIGN KEY ([CAT_Named_Event_Ind]) REFERENCES [dbo].[RA - Jobs-ROMs - Cat Names-Numbers] ([Job_Cat_Name_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs_RA - Jobs-ROMs - Cat Names-Numbers]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs_RA - Jobs-ROMs - Building]
	FOREIGN KEY ([Building_ID]) REFERENCES [dbo].[RA - Jobs-ROMs - Building] ([Building_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs_RA - Jobs-ROMs - Building]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs_RA - Restoration Companies - Contacts]
	FOREIGN KEY ([RC_Contact_ID]) REFERENCES [dbo].[RA - Restoration Companies - Contacts] ([Rest_Co_Contact_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs_RA - Restoration Companies - Contacts]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs_RA - Restoration Companies]
	FOREIGN KEY ([Rest_Co_ID]) REFERENCES [dbo].[RA - Restoration Companies] ([Rest_Co_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs_RA - Restoration Companies]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs_RA - Jobs-ROMs - Event Types]
	FOREIGN KEY ([Job_Event_Type]) REFERENCES [dbo].[RA - Jobs-ROMs - Event Types] ([Job_Event_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs_RA - Jobs-ROMs - Event Types]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs] SET (LOCK_ESCALATION = TABLE)
GO
