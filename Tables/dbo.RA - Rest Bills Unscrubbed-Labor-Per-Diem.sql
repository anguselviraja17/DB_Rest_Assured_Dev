SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Per-Diem] (
		[Rest_Bill_Labor_Per_Diem_Entry]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                       [int] NULL,
		[Job_ID]                             [int] NULL,
		[Rest_Co]                            [int] NULL,
		[Staff_Name]                         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Description]                   [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Work_Date]                          [date] NULL,
		[Small_Tools]                        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Per_Diem]                           [money] NULL,
		[PPE]                                [money] NULL,
		[PRP]                                [money] NULL,
		[PFP]                                [money] NULL,
		[Lodging]                            [money] NULL,
		[Total_Cost]                         [money] NULL,
		[Per_Laborer_Cost]                   [money] NULL,
		[Number_of_Labors]                   [int] NULL,
		[Estimate]                           [money] NULL,
		CONSTRAINT [PK_RA - Rest Bills Unscrubbed-Labor-Per-Diem]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_Labor_Per_Diem_Entry])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Per-Diem]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Labor-Per-Diem_RA - Jobs-ROMs]
	FOREIGN KEY ([Job_ID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Per-Diem]
	CHECK CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Labor-Per-Diem_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Per-Diem]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Labor-Per-Diem_RA - Rest Bills]
	FOREIGN KEY ([Rest_Bill_ID]) REFERENCES [dbo].[RA - Rest Bills] ([Rest_Bill_ID])
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Per-Diem]
	CHECK CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Labor-Per-Diem_RA - Rest Bills]

GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Per-Diem]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Labor-Per-Diem_RA - Restoration Companies]
	FOREIGN KEY ([Rest_Co]) REFERENCES [dbo].[RA - Restoration Companies] ([Rest_Co_ID])
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Per-Diem]
	CHECK CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Labor-Per-Diem_RA - Restoration Companies]

GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Per-Diem] SET (LOCK_ESCALATION = TABLE)
GO
