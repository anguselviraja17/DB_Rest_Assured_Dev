SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RA - Jobs-ROMs - Building Job Linkage] (
		[Job_Building_Link_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Job_ID]                   [int] NULL,
		[Building_ID]              [int] NULL,
		CONSTRAINT [PK_RA - Jobs-ROMs - Building Job Linkage]
		PRIMARY KEY
		CLUSTERED
		([Job_Building_Link_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building Job Linkage]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Building Job Linkage_RA - Jobs-ROMs]
	FOREIGN KEY ([Job_ID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building Job Linkage]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Building Job Linkage_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building Job Linkage]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Building Job Linkage_RA - Jobs-ROMs - Building]
	FOREIGN KEY ([Building_ID]) REFERENCES [dbo].[RA - Jobs-ROMs - Building] ([Building_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building Job Linkage]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Building Job Linkage_RA - Jobs-ROMs - Building]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building Job Linkage] SET (LOCK_ESCALATION = TABLE)
GO
