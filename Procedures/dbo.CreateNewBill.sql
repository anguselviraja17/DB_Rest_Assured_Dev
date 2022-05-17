SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,>  
-- Description: <Description,,>  
-- =============================================  
CREATE    PROCEDURE [dbo].[CreateNewBill]  
 -- Add the parameters for the stored procedure here  
        @Job_ID int,       
           @Job_Number nvarchar(255),  
           @Invoice_Number nvarchar(255),  
           @Invoice_Date date,  
           @Customer_ID nvarchar(255),  
           @Rest_Co_Federal_ID_Num nvarchar(255),  
           @Customer_Address nvarchar(255),  
           @Customer_City nvarchar(255),  
           @Customer_State nvarchar(255),  
           @Customer_Zip nvarchar(255),  
           @Customer_County nvarchar(255),  
           @Customer_Country nvarchar(255),  
           @Job_Building_Location_Address nvarchar(255),  
           @Job_Building_Location_City nvarchar(255),  
           @Job_Building_Location_State nvarchar(255),  
           @Job_Building_Location_Zip nvarchar(255),  
           @Job_Building_Location_County nvarchar(255),  
           @Job_Building_Location_Country nvarchar(255),  
           @Billing_Amount money,  
           @Billing_Tax money,  
           @Billing_Total money,  
           @Billing_Phone_number nvarchar(255),  
           @Billing_E_Mail nvarchar(255),  
           @Payment_Terms nvarchar(255),  
           @Billing_Labor_Cost money,  
           @Associated_Labor_Fees money,  
           @Material_Cost money,  
           @Equipment_Tools_Cost money,  
           @Subcontract_and_Vendors money,  
           @Reimbursable_Items money,  
           @Equipment_Term_Discount money,  
           @TM_Sub_Total money,  
           @Off_Site_Logistical_Fee money,  
           @Indirect_Expense_Allocation money,  
           @Applied_Credits money,  
           @Previous_Payments money,  
           @Pre_Tax_Total_Amount_Due money,  
           @Bill_URL nvarchar(255),  
           @CAT_Named_Event_Ind nchar(1),  
           @CAT_Name nvarchar(50),  
           @CAT_Fee_Percent decimal(5,2),  
           @CAT_Fee money  
  
 AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
 Declare @DateTime datetime  
 DECLARE @id integer  
  
 SET @DateTime = GETDATE()  
  
INSERT INTO [dbo].[RA - Rest Bills]  
           ([Job_ID]  
           ,[Submission_date]  
           ,[Job_Number]  
           ,[Invoice_Number]  
           ,[Invoice_Date]  
           ,[Customer_ID]  
           ,[Rest_Co_Federal_ID_Num]  
           ,[Customer_Address]  
           ,[Customer_City]  
           ,[Customer_State]  
           ,[Customer_Zip]  
           ,[Customer_County]  
           ,[Customer_Country]  
           ,[Job_Building_Location_Address]  
           ,[Job_Building_Location_City]  
           ,[Job_Building_Location_State]  
           ,[Job_Building_Location_Zip]  
           ,[Job_Building_Location_County]  
           ,[Job_Building_Location_Country]  
           ,[Billing_Amount]  
           ,[Billing_Tax]  
           ,[Billing_Total]  
           ,[Billing_Phone_number]  
           ,[Billing_E-Mail]  
           ,[Payment_Terms]  
           ,[Billing_Labor_Cost]  
           ,[Associated_Labor_Fees]  
           ,[Material_Cost]  
           ,[Equipment_Tools_Cost]  
           ,[Subcontract_and_Vendors]  
           ,[Reimbursable_Items]  
           ,[Equipment_Term_Discount]  
           ,[TM_Sub_Total]  
           ,[Off-Site_Logistical_Fee]  
           ,[Indirect_Expense_Allocation]  
           ,[Applied_Credits]  
           ,[Previous_Payments]  
           ,[Pre-Tax_Total_Amount_Due]  
           ,[Bill_URL]  
           ,[CAT_Named_Event_Ind]  
           ,[CAT_Name]  
           ,[CAT_Fee_Percent]  
           ,[CAT_Fee])  
     VALUES  
           (@Job_ID,  
           GetDate(),  
           @Job_Number,  
           @Invoice_Number,  
           @Invoice_Date,  
           @Customer_ID,  
           @Rest_Co_Federal_ID_Num,  
           @Customer_Address,  
           @Customer_City,  
           @Customer_State,  
           @Customer_Zip,  
           @Customer_County,  
           @Customer_Country,  
           @Job_Building_Location_Address,  
           @Job_Building_Location_City,  
           @Job_Building_Location_State,  
           @Job_Building_Location_Zip,  
           @Job_Building_Location_County,  
           @Job_Building_Location_Country,  
           @Billing_Amount,  
           @Billing_Tax,  
           @Billing_Total,  
           @Billing_Phone_number,  
           @Billing_E_Mail,  
           @Payment_Terms,  
           @Billing_Labor_Cost,  
           @Associated_Labor_Fees,  
           @Material_Cost,   
           @Equipment_Tools_Cost,   
           @Subcontract_and_Vendors,   
           @Reimbursable_Items,   
           @Equipment_Term_Discount,   
           @TM_Sub_Total,   
           @Off_Site_Logistical_Fee,   
           @Indirect_Expense_Allocation,   
           @Applied_Credits,   
           @Previous_Payments,   
           @Pre_Tax_Total_Amount_Due,   
           @Bill_URL,  
           @CAT_Named_Event_Ind,   
           @CAT_Name,   
           @CAT_Fee_Percent,   
           @CAT_Fee )  
  
     select @id = Scope_Identity()  
  
     RETURN @id  
  
  
END  
GO
