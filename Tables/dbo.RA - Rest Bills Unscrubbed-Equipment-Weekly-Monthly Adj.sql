SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Equipment-Weekly-Monthly Adj] (
		[Rest_Bill_Equip_Adj_Entry_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                     [int] NULL,
		[Job_ID]                           [int] NULL,
		[Material_Name]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Daily_Rate]                       [money] NULL,
		[Daily_Quantity]                   [int] NULL,
		[Daily_Total_with_Terms]           [money] NULL,
		[Daily_Total_Before_Terms]         [money] NULL,
		[Daily_Credit_Total]               [money] NULL,
		[Weekly_Rate]                      [money] NULL,
		[Weekly_Quantity]                  [int] NULL,
		[Weekly_Total_with_Terms]          [money] NULL,
		[Weekly_Total_Before_Terms]        [money] NULL,
		[Weekly_Credit_Total]              [money] NULL,
		[Monthly_Rate]                     [money] NULL,
		[Monthly_Quantity]                 [int] NULL,
		[Monthly_Total_with_Terms]         [money] NULL,
		[Monthly_Total_Before_Terms]       [money] NULL,
		[Monthly_Credit_Total]             [money] NULL,
		CONSTRAINT [PK_RA - Rest Bills Unscrubbed-Equipment-Weekly-Monthly Adj]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_Equip_Adj_Entry_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Equipment-Weekly-Monthly Adj] SET (LOCK_ESCALATION = TABLE)
GO
