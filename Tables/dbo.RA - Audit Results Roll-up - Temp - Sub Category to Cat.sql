SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RA - Audit Results Roll-up - Temp - Sub Category to Cat] (
		[Sub_Cat_toCat_Roll_Up_ID]                          [int] IDENTITY(1, 1) NOT NULL,
		[Audit_Results_Category_Type_ID]                    [int] NULL,
		[Audit_Summary_ID]                                  [int] NULL,
		[MaxOfAudit_Results_Sub_Cat_Check_Status_ID]        [int] NULL,
		[SumOfAudit_Results_Sub_Cat_Count_of_Successes]     [float] NULL,
		[SumOfAudit_Results_Sub_Cat_Count_of_Warnings]      [float] NULL,
		[SumOfAudit_Results_Sub_Cat_Count_of_Failures]      [float] NULL,
		[SumOfAudit_Results_Total_Sub_Cat_Cost]             [money] NULL,
		[SumOfAudit_Results_Total_Sub_Cat_Markup]           [money] NULL,
		[SumOfAudit_Results_Total_Sub_Cat_Bill_Amt]         [money] NULL,
		[SumOfAudit_Results_Total_Sub_Cat_Warning_Cost]     [money] NULL,
		[SumOfAudit_Results_Total_Sub_Cat_Error_Cost]       [money] NULL,
		[SumOfAudit_Results_Rate_Impact]                    [money] NULL,
		[SumOfAudit_Results_OT_Hours]                       [decimal](28, 2) NULL,
		[SumOfAudit_Results_OT_Cost]                        [money] NULL,
		CONSTRAINT [PK_RA - Audit Results Roll-up - Temp - Sub Category to Cat]
		PRIMARY KEY
		CLUSTERED
		([Sub_Cat_toCat_Roll_Up_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Audit Results Roll-up - Temp - Sub Category to Cat] SET (LOCK_ESCALATION = TABLE)
GO
