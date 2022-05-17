SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Jobs-ROM - Building Occupancy Industries] (
		[Building_Industry_Type]              [int] IDENTITY(1, 1) NOT NULL,
		[Building_Industry_Short_Name]        [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_Industry_Long_Name]         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_Industry_Category_Name]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_Industry_Sector_Type]       [int] NULL,
		CONSTRAINT [PK_RA - Jobs-ROM - Business Industries]
		PRIMARY KEY
		CLUSTERED
		([Building_Industry_Type])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Jobs-ROM - Building Occupancy Industries]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROM - Building Industries_RA - Jobs-ROM - Occupancy Sector]
	FOREIGN KEY ([Building_Industry_Sector_Type]) REFERENCES [dbo].[RA - Jobs-ROM - Building Occupancy Sector] ([Building_Occupancy_Sector_Type])
ALTER TABLE [dbo].[RA - Jobs-ROM - Building Occupancy Industries]
	CHECK CONSTRAINT [FK_RA - Jobs-ROM - Building Industries_RA - Jobs-ROM - Occupancy Sector]

GO
ALTER TABLE [dbo].[RA - Jobs-ROM - Building Occupancy Industries] SET (LOCK_ESCALATION = TABLE)
GO
