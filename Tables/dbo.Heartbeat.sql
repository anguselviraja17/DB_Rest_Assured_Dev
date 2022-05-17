SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Heartbeat] (
		[ID]              [int] IDENTITY(1, 1) NOT NULL,
		[App]             [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Params]          [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[StartDate]       [datetime] NULL,
		[EndDate]         [datetime] NULL,
		[Pulse]           [datetime] NULL,
		[Running]         [bit] NULL,
		[ErrorText]       [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Terminated]      [int] NULL,
		[Active]          [bit] NULL,
		[RunInterval]     [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Heartbeat]
	ADD
	CONSTRAINT [DF__Heartbeat__Termi__113584D1]
	DEFAULT ((0)) FOR [Terminated]
GO
ALTER TABLE [dbo].[Heartbeat]
	ADD
	CONSTRAINT [DF__Heartbeat__Activ__131DCD43]
	DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Heartbeat]
	ADD
	CONSTRAINT [DF__Heartbeat__RunIn__1411F17C]
	DEFAULT ((10)) FOR [RunInterval]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[Heartbeat] ([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Heartbeat] SET (LOCK_ESCALATION = TABLE)
GO
