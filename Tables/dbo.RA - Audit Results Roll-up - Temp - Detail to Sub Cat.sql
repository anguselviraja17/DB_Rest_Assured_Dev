SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RA - Audit Results Roll-up - Temp - Detail to Sub Cat] (
		[Detail_To_Sub_Cat_Roll_Up_ID]                     [int] IDENTITY(1, 1) NOT NULL,
		[Audit_Summary_ID]                                 [int] NULL,
		[Audit_Results_Sub_Cat_Type_ID]                    [int] NULL,
		[SumOfAudit_Results_Total_Detail_Cost]             [money] NULL,
		[SumOfAudit_Results_Total_Detail_Markup]           [money] NULL,
		[SumOfAudit_Results_Total_Detail_Bill_Amt]         [money] NULL,
		[SumOfAudit_Results_Total_Detail_Warning_Cost]     [money] NULL,
		[SumOfAudit_Results_Total_Detail_Error_Cost]       [money] NULL,
		[Audit_Results_Category_Type_ID]                   [int] NULL,
		[MaxOfAudit_Results_Detail_Check_Status_ID]        [int] NULL,
		[SumOfAudit_Results_Count_of_Successes]            [float] NULL,
		[SumOfAudit_Results_Count_of_Warnings]             [float] NULL,
		[SumOfAudit_Results_Count_of_Failures]             [float] NULL,
		[SumOfAudit_Results_Total_Laborer_Cost]            [money] NULL,
		[SumOfAudit_Results_Total_Number_of_Laborers]      [decimal](28, 2) NULL,
		[SumOfAudit_Results_Total_OT_Hours]                [decimal](28, 2) NULL,
		[SumOfAudit_Results_Total_OT_Cost]                 [money] NULL,
		[SumOfRate_Diff_Impact]                            [money] NULL,
		CONSTRAINT [PK_RA - Audit Result Results -Temp- Detail Summary to Sub Cat]
		PRIMARY KEY
		CLUSTERED
		([Detail_To_Sub_Cat_Roll_Up_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Audit Results Roll-up - Temp - Detail to Sub Cat] SET (LOCK_ESCALATION = TABLE)
GO
