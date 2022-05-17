SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Jobs-ROMs - Building] (
		[Building_ID]                              [int] IDENTITY(1, 1) NOT NULL,
		[Insured_Co_ID]                            [int] NOT NULL,
		[Job_ID]                                   [int] NULL,
		[Assesssment_Instance_Num]                 [int] NULL,
		[Building_Name]                            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_Address]                         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_City]                            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_State]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_Zip]                             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_County]                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_Country]                         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_Lattitude]                       [decimal](8, 6) NULL,
		[Building_Longitude]                       [decimal](9, 6) NULL,
		[Building_Construction_Type]               [int] NULL,
		[Occupancy_Industry_Type]                  [int] NULL,
		[Square_Footage]                           [int] NULL,
		[Number_of_Stories]                        [int] NULL,
		[Number_of_Stories_Affected]               [int] NULL,
		[Average_Ceiling_Height]                   [int] NULL,
		[Floor_Coverings]                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Interior_Wall_Finishes]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[HVAC_System]                              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Age_of_Building]                          [int] NULL,
		[Most_Recent_Renovation]                   [date] NULL,
		[Moisture_Reading_Initial]                 [int] NULL,
		[Moisture_Reading_Initial_Date]            [date] NULL,
		[Moisture_Reading_at_Remediation]          [int] NULL,
		[Moisture_Reading_at_Remediation_Date]     [date] NULL,
		CONSTRAINT [PK_RA - Jobs-ROMs-Building]
		PRIMARY KEY
		CLUSTERED
		([Building_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs-Building_RA - Insured Companies]
	FOREIGN KEY ([Insured_Co_ID]) REFERENCES [dbo].[RA - Insured Companies] ([Insured_Co])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs-Building_RA - Insured Companies]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Building_RA - Jobs-ROM - Building Occupancy Industries]
	FOREIGN KEY ([Occupancy_Industry_Type]) REFERENCES [dbo].[RA - Jobs-ROM - Building Occupancy Industries] ([Building_Industry_Type])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Building_RA - Jobs-ROM - Building Occupancy Industries]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs-Building_RA - Jobs-ROMs]
	FOREIGN KEY ([Job_ID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs-Building_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Building_RA - Jobs-ROMs - Building Construction Types]
	FOREIGN KEY ([Building_Construction_Type]) REFERENCES [dbo].[RA - Jobs-ROMs - Building Construction Types] ([Building_Type_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Building_RA - Jobs-ROMs - Building Construction Types]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building] SET (LOCK_ESCALATION = TABLE)
GO
