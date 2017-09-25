USE [SchoolDB]
GO

/****** Object:  StoredProcedure [dbo].[GetAllPaymentInformation]    Script Date: 09/26/2017 00:09:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllPaymentInformation]
	(@StartDate datetime,
	@EndDate datetime)
AS
BEGIN
SELECT * FROM tblPaymentInformation WHERE CreatedDate BETWEEN @StartDate AND	 @EndDate; 
END

GO

USE [SchoolDB]
GO

/****** Object:  StoredProcedure [dbo].[SP_AddPayeeInfo]    Script Date: 09/26/2017 00:09:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AddPayeeInfo] 
	(
		@PayeeName nvarchar(50),
		@Date datetime,
		@Address nvarchar(100),
		@ContactNo int,
		@AadharCard nvarchar(50),
		@Remarks nvarchar(50)
	)
AS
BEGIN
INSERT INTO tblPayeeInformation(PayeeName ,ContactNo,Address,AadharCardNo,OtherInformation,AddedDate)
     VALUES(@PayeeName,@ContactNo,@Address,@AadharCard,@Remarks,@Date)
END

GO
USE [SchoolDB]
GO

/****** Object:  StoredProcedure [dbo].[SP_AddPayment]    Script Date: 09/26/2017 00:10:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AddPayment]
(
		@PayeeName nvarchar(50)
       ,@PaidAmount decimal(18,0)
       ,@PaymentPurpose nvarchar(50)
       ,@PaymentMode nvarchar(50)
       ,@PaymentRemarks nvarchar(50)
       ,@Date Datetime
)

AS
BEGIN
	INSERT INTO [tblPaymentInformation]
           (
           [PayeeName]
           ,[PaidAmount]
           ,[PaymentPurpose]
           ,[PaymentMode]
           ,[PaymentRemarks]
           ,CreatedDate)
     VALUES
           (
            @PayeeName
           ,@PaidAmount
           ,@PaymentPurpose
           ,@PaymentMode
           ,@PaymentRemarks
           ,@Date)
END

GO
USE [SchoolDB]
GO

/****** Object:  StoredProcedure [dbo].[SP_ADDTransportFee]    Script Date: 09/26/2017 00:10:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ADDTransportFee](
	@studentid int , 
	@PaymentAmount int, 
	@BalanceAmount int, 
	@PaymentDate datetime, 
	@CollectedBy nvarchar(50), 
	@Remarks nvarchar(50)) 
AS
BEGIN
	insert into tblTransportFee(StudentId,PaymentAmount,BalanceAmount,PaymentDate,Remarks,CollectedBy) values  (@studentid, @PaymentAmount, @BalanceAmount, @PaymentDate, @CollectedBy, @Remarks)
	
	update tblStudentFeeDetails set BalanceTransport=@BalanceAmount where StudentId=@studentid;
	
END
GO
USE [SchoolDB]
GO

/****** Object:  StoredProcedure [dbo].[SP_CollectTransportFee]    Script Date: 09/26/2017 00:10:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CollectTransportFee](
	-- Add the parameters for the stored procedure here
	@studentid int,
	@PaymentAmount int, 
	@BalanceAmount int,
	@PaymentDate nvarchar(50),
	@Remarks nvarchar(50),
	@CollectedBy nvarchar(50)
	)
AS
BEGIN
	INSERT INTO [SchoolDB].[dbo].[tblTransportFeeCollection] ([StudentId]
           ,[PaymentAmount],[BalanceAmount],[PaymentDate],[Remarks],[CollectedBy])
     VALUES
           (@studentid,@PaymentAmount,@BalanceAmount,@PaymentDate,@Remarks,@CollectedBy)

END
GO
USE [SchoolDB]
GO

/****** Object:  StoredProcedure [dbo].[SP_CreateAndUpdateStudentInformation]    Script Date: 09/26/2017 00:10:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CreateAndUpdateStudentInformation]
(
			@StudentName nvarchar(50)
           ,@FatherName nvarchar(50)
           ,@MotherName  nvarchar(50)
           ,@CurrentAddress  nvarchar(150)
           ,@PermanentAddress nvarchar(150)
           ,@DOB Date
           ,@MobileNo nvarchar(50)
           ,@AlternateNo nvarchar(50)
           ,@City  nvarchar(50)
           ,@State nvarchar(50)
           ,@Class nvarchar(50)
           ,@Section  nvarchar(50)
           ,@House  nvarchar(50)
           ,@AadharNo  nvarchar(50)
           ,@Sex  nvarchar(50)
           ,@StudentType nvarchar(50)
           ,@IsRTE  nvarchar(50)
           ,@CastName  nvarchar(2)
           ,@BloodGroup  nvarchar(50)
           ,@AdmissionDate datetime
           ,@TransportService  nvarchar(50)
           ,@CreatedDate datetime
           ,@ModifiedDate datetime
           ,@ModifiedBy  nvarchar(50)
           ,@Remark nvarchar(150)
           ,@SessionName  nvarchar(50)
           ,@OldClass  nvarchar(50)
           ,@OldClassPercentage  nvarchar(50)
           ,@studentimage image
)
	
AS
BEGIN

 INSERT INTO tblStudentInformation
           (StudentName,FatherName,MotherName,CurrentAddress,PermanentAddress,DOB,MobileNo
,AlternateNo,City,State,Class,Section,House,AadharNo,Sex,StudentType,IsRTE,CastName
,BloodGroup,AdmissionDate,TransportService,CreatedDate,ModifiedDate,ModifiedBy,Remark,SessionName
,OldClass,OldClassPercentage,studentimage)
     VALUES
           (
@StudentName
,@FatherName
,@MotherName
,@CurrentAddress 
,@PermanentAddress
,@DOB
,@MobileNo
,@AlternateNo
,@City
,@State
,@Class
,@Section
,@House
,@AadharNo
,@Sex
,@StudentType
,@IsRTE
,@CastName
,@BloodGroup
,@AdmissionDate
,@TransportService
,@CreatedDate
,@ModifiedDate
,@ModifiedBy
,@Remark
,@SessionName
,@OldClass
,@OldClassPercentage
,@studentimage
)

END
GO
USE [SchoolDB]
GO

/****** Object:  StoredProcedure [dbo].[SP_FirstTimeGetData]    Script Date: 09/26/2017 00:10:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_FirstTimeGetData]
	(
	@studentId int
	)
AS
BEGIN
DECLARE @retVal int
  
  SELECT @retVal=count(FeeCollectionID)   FROM [SchoolDB].[dbo].[tblStudentFeeDetails] WHERE StudentId=1;   
  PRINT  @retVal 
  IF (@retVal=0)
  BEGIN
  SELECT T2.StudentName,t1.ClassName ,T2.Section,t1.AdmissionFee ,t1.RegistrationFee
      ,t1.TutionFee,t1.MonthlyFee ,t1.Misc,t1.CreatedDate ,t1.ModifiedDate
     ,t1.ClassId FROM [SchoolDB].[dbo].[tblClassInformation] t1 inner join tblStudentInformation t2 
	on t2.Class=t1.ClassId where T2.StudentId=@studentId;
	END
ELSE 
BEGIN
    SELECT t1.StudentName,t1.Class,t1.Section,t2.BalanceAdmissionFee,t2.BalanceRegistrationFee,t2.BalanceTutionFee,t2.BalanceMonthlyFee,t2.BanancMiscFee FROM tblStudentInformation t1 inner join tblStudentFeeDetails t2 on  t1.Class=t2.ClassId and t1.StudentId =@studentId;
    
END
END

GO
USE [SchoolDB]
GO

/****** Object:  StoredProcedure [dbo].[SP_GetClassInformation]    Script Date: 09/26/2017 00:10:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetClassInformation] (
	@studentId int
	)
AS
BEGIN
	select t1.TransportFee from tblClassInformation t1 inner join SchoolDB.dbo.tblStudentInformation t2 on t1.ClassId = t2.Class where t2.StudentId=@studentId
END

GO
USE [SchoolDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetTransportData]    Script Date: 09/26/2017 00:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetTransportData](
	@TransportFeeId int
	)
AS
BEGIN
	SELECT t1.TransportFeeId,t1.StudentId,t2.StudentName, t3.className, t2.section,t1.PaymentAmount,t1.BalanceAmount,t1.PaymentDate,t1.Remarks,t1.CollectedBy  FROM tblTransportFeeCollection t1 
inner join  tblStudentInformation t2 on t2.studentId=t1.StudentId
inner join tblClassInformation t3 on t2.Class=t3.ClassId
where TransportFeeId=@TransportFeeId
END

GO
USE [SchoolDB]
GO

/****** Object:  StoredProcedure [dbo].[SP_GetUpdateRecordAfterFeePayment]    Script Date: 09/26/2017 00:11:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetUpdateRecordAfterFeePayment]
	@StudentID INT =null
AS
BEGIN
	  Select top 1 t1.FeeCollectionID,t2.StudentName from tblFeeCollection t1 inner join tblStudentInformation t2 
	on t2.StudentId=t1.StudentID where t1.StudentID=@StudentID order by FeeCollectionID desc;

END

GO
USE [SchoolDB]
GO

/****** Object:  StoredProcedure [dbo].[SP_GetUpdateRecordAfterTransportFeeReceipt]    Script Date: 09/26/2017 00:11:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetUpdateRecordAfterTransportFeeReceipt]
	
AS
BEGIN
	Select  top 1 TransportFeeId from tblTransportFeeCollection order by TransportFeeId Desc
END

GO
USE [SchoolDB]
GO

/****** Object:  StoredProcedure [dbo].[SP_SearchTransportFee]    Script Date: 09/26/2017 00:11:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_SearchTransportFee]
	(
	@studentId int
	)
AS
BEGIN
DECLARE @retVal int  
  SELECT @retVal=count(TransportFeeId)   FROM tblTransportFeeCollection;      
  IF (@retVal=0)
	BEGIN
		select t1.TransportAmount from tblTransportFee t1  inner join tblStudentInformation t2 on t1.ClassID = t2.Class where t2.StudentId=@studentId;
	END
  ELSE 
	BEGIN
		SELECT  BalanceAmount from tblTransportFeeCollection where StudentId=@studentId;
	END
END

GO
USE [SchoolDB]
GO

/****** Object:  StoredProcedure [dbo].[SP_TransportOperation]    Script Date: 09/26/2017 00:11:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_TransportOperation] 
	@ClassID int, 
	@TransportAmount decimal, 
	@VehicleNo nvarchar(50), 
	@VehicleDriverName nvarchar(50), 
	@VehicleAread nvarchar(50),
	@SaveOrUpdate int
AS
BEGIN
	if(@SaveOrUpdate =0)		
		BEGIN
			INSERT INTO tblTransportFee(ClassID, TransportAmount, VehicleNo, VehicleDriverName, VehicleAread)VALUES(@ClassID, @TransportAmount, @VehicleNo, @VehicleDriverName, @VehicleAread);
		END
	else
		BEGIN
			UPDATE tblTransportFee SET ClassID=@ClassID ,TransportAmount=@TransportAmount, VehicleNo=@VehicleNo, VehicleDriverName=@VehicleDriverName, VehicleAread=@VehicleAread WHERE TransportID=@SaveOrUpdate
		END
		
END

GO
USE [SchoolDB]
GO

/****** Object:  StoredProcedure [dbo].[Sp_UpdateStudentFeeDetails_AddFeeCollection]    Script Date: 09/26/2017 00:11:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_UpdateStudentFeeDetails_AddFeeCollection]
(	-- Add the parameters for the stored procedure here
	
	@BalanceAdmissionFee nvarchar(50)=null,
	@BanancMiscFee nvarchar(50)=null,
	@BalanceRegistrationFee nvarchar(50)=null,
	@BalanceTutionFee nvarchar(50)=null,
	@BalanceMonthlyFee nvarchar(50)=null,
	@BalanceTranseportFee nvarchar(50)=null,
	
	@StudentID INT =null,
	@FeeReceiptDate DATETIME=null,
	@AdmissionFee INT=null,
	@RegistrationFee INT=null,
	@TutionFee INT=null,
	@MonthlyFee INT=null,
	@Misc INT=null,
	@TranseportFee int=null,
	@ClassId INT=null,
	@PaymentMode nvarchar(50)=null,
	@Remarks nvarchar(50)=null
	)
AS
 BEGIN 
 
  DECLARE @FEECOLLECTION int
  DECLARE @StudentFeeDetailCount int
  
 	insert into tblFeeCollection (StudentID,FeeReceiptDate,AdmissionFee,RegistrationFee,TutionFee,MonthlyFee,Misc,TransportFee,PaymentMode,Remarks) 
	values(@StudentID,@FeeReceiptDate,@AdmissionFee,@RegistrationFee,@TutionFee,@MonthlyFee,@Misc,@TranseportFee,@PaymentMode,@Remarks)
	
	select TOP 1 @FEECOLLECTION=FeeCollectionID FROM [tblFeeCollection] order by FeeCollectionID desc
		Select @StudentFeeDetailCount=COUNT(feedetails) from tblStudentFeeDetails;
	
  
  SELECT @StudentFeeDetailCount=count(FeeCollectionID)   from tblStudentFeeDetails
	if(@StudentFeeDetailCount >0)	
		update tblStudentFeeDetails set FeeCollectionID=@FEECOLLECTION, BalanceAdmissionFee=@BalanceAdmissionFee,BalanceRegistrationFee=@BalanceRegistrationFee,
		BalanceTutionFee=@BalanceTutionFee,BalanceMonthlyFee=@BalanceMonthlyFee,BanancMiscFee=@BanancMiscFee,BalanceTransport= @BalanceTranseportFee
	else
	 INSERT INTO [SchoolDB].[dbo].[tblStudentFeeDetails]
           (FeeCollectionID,StudentId,ClassId,BalanceAdmissionFee,BalanceRegistrationFee,BalanceTutionFee,BalanceMonthlyFee ,BanancMiscFee,BalanceTransport)
     VALUES
           (@FEECOLLECTION,@StudentID ,@ClassId ,@BalanceAdmissionFee ,@BalanceRegistrationFee ,@BalanceTutionFee
           ,@BalanceMonthlyFee,@BanancMiscFee ,@BalanceTranseportFee)	
	
	   
End;

GO

















