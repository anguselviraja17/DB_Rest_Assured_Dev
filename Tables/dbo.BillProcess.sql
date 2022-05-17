SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillProcess] (
		[ID]                    [int] IDENTITY(1, 1) NOT NULL,
		[Filename]              [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[BillFormat]            [int] NOT NULL,
		[BillID]                [int] NOT NULL,
		[JobID]                 [int] NOT NULL,
		[RestCo]                [int] NOT NULL,
		[SubmissionState]       [int] NOT NULL,
		[AuditSummaryID]        [int] NOT NULL,
		[Status]                [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CreatedBy]             [int] NOT NULL,
		[EntryDate]             [datetime] NULL,
		[State]                 [smallint] NULL,
		[Bottom2Top]            [bit] NULL,
		[Rotate]                [bit] NULL,
		[Pages]                 [int] NULL,
		[Images]                [int] NULL,
		[LastStart]             [datetime] NULL,
		[LastEnd]               [datetime] NULL,
		[LastLoad]              [datetime] NULL,
		[RowsLoaded]            [int] NULL,
		[FileCount]             [int] NULL,
		[EstimatedValue]        [decimal](12, 2) NULL,
		[AuditValue]            [decimal](12, 2) NULL,
		[BulkLoad]              [bit] NULL,
		[SourceFormat]          [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[FailStage]             [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DocumentReceived]      [datetime] NULL,
		[DataTypeConflicts]     [int] NULL,
		[Notified]              [bit] NULL,
		[PreProcessed]          [bit] NULL,
		[OCRState]              [smallint] NULL,
		[WordCount]             [int] NULL,
		[OCRWordCount]          [int] NULL,
		[OCRImages]             [int] NULL,
		[Processed]             [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BillProcess]
	ADD
	CONSTRAINT [DF__BillProce__Notif__2724C5F0]
	DEFAULT ((0)) FOR [Notified]
GO
ALTER TABLE [dbo].[BillProcess]
	ADD
	CONSTRAINT [DF__BillProce__PrePr__347EC10E]
	DEFAULT ((0)) FOR [PreProcessed]
GO
ALTER TABLE [dbo].[BillProcess]
	ADD
	CONSTRAINT [DF__BillProce__OCRSt__36670980]
	DEFAULT ((0)) FOR [OCRState]
GO
ALTER TABLE [dbo].[BillProcess]
	ADD
	CONSTRAINT [DF__BillProce__BulkL__4F67C174]
	DEFAULT ((0)) FOR [BulkLoad]
GO
ALTER TABLE [dbo].[BillProcess]
	ADD
	CONSTRAINT [DF__BillProce__Proce__605D434C]
	DEFAULT ((0)) FOR [Processed]
GO
ALTER TABLE [dbo].[BillProcess]
	ADD
	CONSTRAINT [DF__BillProce__Entry__79FD19BE]
	DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[BillProcess]
	ADD
	CONSTRAINT [DF__BillProce__State__7AF13DF7]
	DEFAULT ((0)) FOR [State]
GO
ALTER TABLE [dbo].[BillProcess]
	WITH CHECK
	ADD CONSTRAINT [FK_BillProcess_RA - Rest Bills]
	FOREIGN KEY ([BillID]) REFERENCES [dbo].[RA - Rest Bills] ([Rest_Bill_ID])
ALTER TABLE [dbo].[BillProcess]
	CHECK CONSTRAINT [FK_BillProcess_RA - Rest Bills]

GO
ALTER TABLE [dbo].[BillProcess]
	WITH CHECK
	ADD CONSTRAINT [FK_BillProcess_RA - Jobs-ROMs]
	FOREIGN KEY ([JobID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[BillProcess]
	CHECK CONSTRAINT [FK_BillProcess_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[BillProcess]
	WITH CHECK
	ADD CONSTRAINT [FK_BillProcess_RA - Restoration Companies]
	FOREIGN KEY ([RestCo]) REFERENCES [dbo].[RA - Restoration Companies] ([Rest_Co_ID])
ALTER TABLE [dbo].[BillProcess]
	CHECK CONSTRAINT [FK_BillProcess_RA - Restoration Companies]

GO
ALTER TABLE [dbo].[BillProcess]
	WITH CHECK
	ADD CONSTRAINT [FK_BillProcess_RA - Audit Results - Summary]
	FOREIGN KEY ([AuditSummaryID]) REFERENCES [dbo].[RA - Audit Results - Summary] ([Audit_Summary_ID])
ALTER TABLE [dbo].[BillProcess]
	CHECK CONSTRAINT [FK_BillProcess_RA - Audit Results - Summary]

GO
ALTER TABLE [dbo].[BillProcess]
	WITH CHECK
	ADD CONSTRAINT [FK_BillProcess_RA - Workflow - Bill Submission State]
	FOREIGN KEY ([SubmissionState]) REFERENCES [dbo].[RA - Workflow - Bill Submission State] ([Submission_ID])
ALTER TABLE [dbo].[BillProcess]
	CHECK CONSTRAINT [FK_BillProcess_RA - Workflow - Bill Submission State]

GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[BillProcess] ([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[BillProcess] SET (LOCK_ESCALATION = TABLE)
GO
