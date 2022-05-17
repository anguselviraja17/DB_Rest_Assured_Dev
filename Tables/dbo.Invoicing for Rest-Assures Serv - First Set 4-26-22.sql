SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Invoicing for Rest-Assures Serv - First Set 4-26-22] (
		[ID]                                                           [int] IDENTITY(1, 1) NOT NULL,
		[RA_Invoice_Produced]                                          [bit] NULL,
		[Parent_Insurance_Co]                                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insurance_Co_Name]                                            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Bill_Is_Active]                                               [bit] NULL,
		[dbo_RA - Workflow - Summary Ins ApprovalsInsurance_Co_ID]     [float] NULL,
		[dbo_RA - Jobs-ROMs - Insurance Co LinkageInsurance_Co_ID]     [float] NULL,
		[dbo_RA - Rest BillsJob_ID]                                    [float] NULL,
		[Rest_Co_Job_Number]                                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Name]                                                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Bill_ID]                                                 [float] NULL,
		[dbo_RA - Jobs-ROMs - Insurance Co LinkageClaim_Number]        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Invoice_Number]                                               [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Billing_Amount]                                               [money] NULL,
		[Net_Adjusted_Bill_Amount]                                     [money] NULL,
		[Approved_to_Pay]                                              [money] NULL,
		[IC_Co_Contact_Last_Name]                                      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Insurance_Co_Linkage_ID]                                  [float] NULL,
		[dbo_RA - Jobs-ROMs - Insurance Co LinkageJob_ID]              [float] NULL,
		[Field0]                                                       [float] NULL,
		[Coverage_Percent]                                             [float] NULL,
		[Ins_Contact_for_Job]                                          [float] NULL,
		[Field1]                                                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Item(Product/Service)]                                        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ItemDescription]                                              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Customer]                                                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ItemQuantity]                                                 [float] NULL,
		[ItemRate]                                                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ItemAmount]                                                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[InvoiceNo]                                                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[InvoiceDate]                                                  [datetime] NULL,
		[DueDate]                                                      [datetime] NULL,
		[Terms]                                                        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[email]                                                        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Invoicing for Rest-Assures Serv - First Set 4-26-22] SET (LOCK_ESCALATION = TABLE)
GO
