SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Canada-Belfor-Subcontract-Vendor] (
		[ID]                       [int] IDENTITY(1, 1) NOT NULL,
		[Field1]                   [int] NULL,
		[Subcontractor/Vendor]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description]              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date]                     [datetime2](7) NULL,
		[Inv / Recpt #]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Total]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Mark Up %]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Mark Up Total]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Total Due]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Canada-Belfor-Subcontract-Vendor] SET (LOCK_ESCALATION = TABLE)
GO
