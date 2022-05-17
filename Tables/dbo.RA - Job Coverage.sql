SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RA - Job Coverage] (
		[Contract_Coverage_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Job_ID]                   [int] NULL,
		[Insured_Co_ID]            [int] NULL,
		[Insurance_Co_ID]          [int] NULL,
		[Rest_Co_ID]               [int] NULL,
		[Percent_of_Coverage]      [int] NULL,
		CONSTRAINT [PK_RA - Job Coverage]
		PRIMARY KEY
		CLUSTERED
		([Contract_Coverage_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Job Coverage] SET (LOCK_ESCALATION = TABLE)
GO
