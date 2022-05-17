SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Jobs-ROMs - Cat Names-Numbers] (
		[Job_Cat_Name_ID]       [int] IDENTITY(1, 1) NOT NULL,
		[Job_Cat_Name]          [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Cat_Number]        [nchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Cat_From_Date]     [date] NULL,
		[Job_Cat_To_Date]       [date] NULL,
		[Job_Cat_States]        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Perils]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Jobs-ROMs - Cat Names-Numbers]
		PRIMARY KEY
		CLUSTERED
		([Job_Cat_Name_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Cat Names-Numbers] SET (LOCK_ESCALATION = TABLE)
GO
