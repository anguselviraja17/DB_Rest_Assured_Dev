SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[spLoadBillingXActApplyKeyWords](@ProcessID int) as    

-- [AT] Created on 5-5-22 to set Xactimate Activity Staging Table rows to either Labor, Material or Equipment
-- [AT] Fixed a bug to allow teh procedure to run multiple times. Reset all values at the beginning of the procedure
--
--select	@JobID  = JobID,    
--		@BillID = BillID,    
--		@RestCo = RestCo    
--from	BillProcess    
--where	ID = @ProcessID    
   
--AS
BEGIN

	DECLARE
		@Init int= 1,
		@NumRows int,
		@ActionInit int= 1,
		@ActionNumRows int,
		@ActionCounter int,
		@ActionCounterOriginal int,
		@action_word varchar(15),
        @EquipmentInit int= 1,
        @EquipmentNumRows int,
        @EquipmentCounter int,
        @EquipmentCounterOriginal int,
        @Equipment_word varchar(15),
   		@MaterialInit int= 1,
		@MaterialNumRows int,
		@MaterialCounter int,
		@MaterialCounterOriginal int,
		@Material_word varchar(15),
		@CharIndex int,
		@IDCounter int,
        @Activity_Role_Found int = 0,
        @Material_Found int = 0,
        @Equipment_Found int = 0,
		@Desc varchar(255)

-- Get the Count and place to start for Labor, Equipment and Material Key Words for future loops
--
SELECT @ActionNumRows = Count(*),
    @ActionCounterOriginal = Min([Action_Word_ID])
	from dbo.[Staging-XAct-1-Action-Words]  

Select @MaterialNumRows = Count(*),
        @MaterialCounterOriginal = Min([Material_Word_ID])
        from dbo.[Staging-XAct-1-Material-Words]  

Select @EquipmentNumRows = Count(*),
        @EquipmentCounterOriginal = Min([Equipment_Word_ID])
        from dbo.[Staging-XAct-1-Equipment-Words]  

-- Reset all Word Match fields to '0' so procedure can run multiple times without a row getting multiple designations.
--
Update dbo.[Staging-XAct-1-Detail]
SET Activity_Word_Match = 0,
Activity_Word_Match_Name = '',
Equipment_Word_Match = 0,
Material_Word_Match = 0
Where BillID = @ProcessID

-- Get Count and starting point number from Staging Table (Activity)
SELECT @IDCounter = Min([ID]),
       @NumRows= COUNT([BillID])
	   FROM [Rest_Assured_Dev].[dbo].[Staging-XAct-1-Detail] 
	   WHERE BillID = @ProcessID
--
--
-- Spin through all the Xactimate Activity Staging table rows for the Bill looking for a match on Labor/Activities, Material or Material Key Words
--
WHILE @Init<= @NumRows
BEGIN
	    -- Get the Description for the next row
    	SELECT @Desc = Description FROM dbo.[Staging-XAct-1-Detail] where BillID = @ProcessID and [ID] = @IDCounter
	
        Print ('Descr: ' + @Desc)
		Print ('Num Rows: ' + STR(@NumRows) + ' Init: ' + STR(@Init) + ' ID Counter: ' + STR(@IDCounter))

        -- Reset Action Counters
	    SET @ActionInit = 1
		SET @ActionCounter = @ActionCounterOriginal

        -- Reset All Found Indicators
        SET @Activity_Role_Found = 0
        SET @Equipment_Found = 0
        SET @Material_Found = 0

        -- Labor-ACTIVITY/ROLE CHECK
        --
        -- Spin through Action Words to determine if any are present in the description
        -- Stop when an Activity is found
        --
	    WHILE (@ActionInit<= @ActionNumRows) and (@Activity_Role_Found = 0)
	    BEGIN
	       PRINT(@ActionCounter)
		   PRINT(@ActionCounterOriginal)
		   PRINT(@ActionInit)
		  
           -- Grab the next action word from the Action Word table 
           --
           Select @action_word = LTRIM(RTRIM(Action_Word)) from dbo.[Staging-XAct-1-Action-Words]  
           where dbo.[Staging-XAct-1-Action-Words].[Action_Word_ID] = @ActionCounter;
		   
           PRINT('Action Word: ' + @action_word)

		   SET @ActionInit = @ActionInit + 1
		   SET @ActionCounter = @ActionCounter + 1

           -- Get the position of the action word if it exists. If it doesn't a 0 will be returned
           --
		   SET @CharIndex = STR(CHARINDEX(@action_word, @desc))

		   Print ('CHAR INDEX: ' + STR(@CharIndex))

		   -- Decided it was better to do a "Like" to check for teh existance of the acton word in the description
           -- 
           IF @desc LIKE '%' + @action_word + '%'
               Begin
			       PRINT ('Labor Match++++++++++++++++++++++' + @Action_word + ' is in ' + @Desc)
				   Update dbo.[Staging-XAct-1-Detail] 
				   SET Activity_Word_Match = 1,
				   Activity_Word_Match_Name = @Action_word
				   Where BillID = @ProcessID and [ID] = @IDCounter

                   set @Activity_Role_Found = 1 
               End
		   ELSE
		       Begin
                    PRINT ('Labor No Match ' + @action_word + ' is not in ' + @Desc)
		       ENd 
		END

		
        -- lOOK FOR EQUIPMENT


        SET @EquipmentInit = 1
        SET @EquipmentCounter = @EquipmentCounterOriginal

        WHILE (@EquipmentInit<= @EquipmentNumRows) and (@Equipment_Found = 0) and (@Activity_Role_Found = 0)

        BEGIN
            PRINT(@EquipmentCounter)
            PRINT(@EquipmentCounterOriginal)
            PRINT(@EquipmentInit)
            
            Select @Equipment_word = LTRIM(RTRIM(Equipment_Word)) from dbo.[Staging-XAct-1-Equipment-Words]  
            where dbo.[Staging-XAct-1-Equipment-Words].[Equipment_Word_ID] = @EquipmentCounter;

            PRINT('Equipment Word: ' + @Equipment_word)

            SET @EquipmentInit = @EquipmentInit + 1
            SET @EquipmentCounter = @EquipmentCounter + 1
            SET @CharIndex = STR(CHARINDEX(@Equipment_word, @desc))

            Print ('CHAR INDEX: ' + STR(@CharIndex))

            IF @desc LIKE '%' + @Equipment_word + '%'
                Begin
                    PRINT ('Equip Match++++++++++++++++++++++' + @Equipment_word + ' is in ' + @Desc)
                    Update dbo.[Staging-XAct-1-Detail] 
                    SET Equipment_Word_Match = 1
    --				   Activity_Word_Match_Name = @Equipment_word
                    Where BillID = @ProcessID and [ID] = @IDCounter 
                    
                    SET @Equipment_Found = 1

                End
            ELSE
                Begin
                        PRINT ('Equip No Match' + @Equipment_word + ' is not in ' + @Desc)
                ENd 
            

    
        End


        SET @MaterialInit = 1
        SET @MaterialCounter = @MaterialCounterOriginal

        WHILE (@MaterialInit<= @MaterialNumRows) and (@Equipment_Found = 0) and (@Activity_Role_Found = 0) and (@Material_Found = 0)
        BEGIN
            PRINT(@MaterialCounter)
            PRINT(@MaterialCounterOriginal)
            PRINT(@MaterialInit)

            Select @Material_word = LTRIM(RTRIM(Material_Word)) from dbo.[Staging-XAct-1-Material-Words]  
            where dbo.[Staging-XAct-1-Material-Words].[Material_Word_ID] = @MaterialCounter;
            
            PRINT('Material Word: ' + @Material_word)

            SET @MaterialInit = @MaterialInit + 1
            SET @MaterialCounter = @MaterialCounter + 1
            SET @CharIndex = STR(CHARINDEX(@Material_word, @desc))

            Print ('CHAR INDEX: ' + STR(@CharIndex))

            IF @desc LIKE '%' + @Material_word + '%'
                Begin
                    PRINT ('Material Match++++++++++++++++++++++' + @Material_word + ' is in ' + @Desc)
                    Update dbo.[Staging-XAct-1-Detail] 
                    SET Material_Word_Match = 1
                    --   Activity_Word_Match_Name = @Material_word
                    Where BillID = @ProcessID and [ID] = @IDCounter 
                
                    SET @Material_Found = 1
                
                End
            ELSE
                Begin
                        PRINT ('Material No Match ' + @Material_word + ' is not in ' + @Desc)
                ENd 
            
        END


        IF (@Equipment_Found = 0) and (@Activity_Role_Found = 0) and (@Material_Found = 0)
            BEGIN
                    PRINT ('No Match Defaulting to Material ++++++++++++++++++++++' + @Desc)
                    Update dbo.[Staging-XAct-1-Detail] 
                    SET Material_Word_Match = 1
                    Where BillID = @ProcessID and [ID] = @IDCounter 
            END
        ELSE
            BEGIN
                    PRINT ('Should Never Get Here ++++++++++++++++++++++' + @Desc)
            END

    SET @Init= @Init + 1
    SET @IDCounter = @IDCounter + 1
    PRINT ('Increment Counters' + STR(@Init) + 'ID Counter ' + STR(@IDCounter))

    END

END

GO
