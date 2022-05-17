SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Jobs-ROM - Building Occupancy Sector] (
		[Building_Occupancy_Sector_Type]           [int] IDENTITY(1, 1) NOT NULL,
		[Building_Occupancy_Sector_Short_Name]     [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_Occupancy_Sector_Long_Name]      [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Jobs - ROM - Occupancy Sectory]
		PRIMARY KEY
		CLUSTERED
		([Building_Occupancy_Sector_Type])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Jobs-ROM - Building Occupancy Sector] SET (LOCK_ESCALATION = TABLE)
GO
