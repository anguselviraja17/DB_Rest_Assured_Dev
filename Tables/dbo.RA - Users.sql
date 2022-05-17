SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Users] (
		[RA_User_Unique_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Email]                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[FullName]              [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Login]                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[FirstName]             [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[LastName]              [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Active]                [bit] NULL,
		[LastLogin]             [datetime] NULL,
		[LastPWChange]          [datetime] NULL,
		[PasswordHash]          [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PasswordSalt]          [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DateCreated]           [datetime] NULL,
		[CreatedByUser]         [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Users]
	ADD
	CONSTRAINT [DF__RA - User__Activ__4F12BBB9]
	DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[RA - Users] SET (LOCK_ESCALATION = TABLE)
GO
