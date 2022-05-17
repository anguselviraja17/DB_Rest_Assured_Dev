SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RA - Audit Results Roll-up - Temp - Cat to Sum] (
		[Cat_Sum_Roll_Up_ID]                                 [int] IDENTITY(1, 1) NOT NULL,
		[Audit_Summary_ID]                                   [int] NULL,
		[MaxOfAudit_Results_Category_Check_Status_ID]        [int] NULL,
		[SumOfAudit_Results_Count_of_Successes]              [float] NULL,
		[SumOfAudit_Results_Count_of_Warnings]               [float] NULL,
		[SumOfAudit_Results_Count_of_Failures]               [float] NULL,
		[SumOfAudit_Results_Total_Category_Cost]             [money] NULL,
		[SumOfAudit_Results_Total_Category_Markup]           [money] NULL,
		[SumOfAudit_Results_Total_Category_Bill_Amt]         [money] NULL,
		[SumOfAudit_Results_Total_Category_Warning_Cost]     [money] NULL,
		[SumOfAudit_Results_Total_Category_Error_Cost]       [money] NULL,
		[SumOfAudit_Results_Rate_Impact]                     [money] NULL,
		[SumOfAudit_Results_Total_Category_OT_Hours]         [decimal](28, 2) NULL,
		[SumOfAudit_Results_Total_Category_OT_Cost]          [money] NULL,
		CONSTRAINT [PK_RA_Audit Results Roll-up - Temp - Cat to Sum]
		PRIMARY KEY
		CLUSTERED
		([Cat_Sum_Roll_Up_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Audit Results Roll-up - Temp - Cat to Sum] SET (LOCK_ESCALATION = TABLE)
GO
