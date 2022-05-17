SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Narrative] (
		[Rest_Bill_Narrative_Entry]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                  [int] NULL,
		[Job_ID]                        [int] NULL,
		[Rest_Co]                       [int] NULL,
		[Category_Type]                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Narrative_Line_Number]         [int] NULL,
		[Narrative]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Related_Line_Number]           [int] NULL,
		[Labor_Overtime_Ind]            [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Rest Bills Unscrubbed-Narrative]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_Narrative_Entry])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Narrative] SET (LOCK_ESCALATION = TABLE)
GO
