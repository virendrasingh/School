USE [SchoolDB]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserId] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IsSuperUser] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTransportFeeCollection]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransportFeeCollection](
	[TransportFeeId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[PaymentAmount] [int] NULL,
	[BalanceAmount] [int] NULL,
	[PaymentDate] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](50) NULL,
	[CollectedBy] [nvarchar](50) NULL,
	[CollectionDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblTransportFeeCollecT] PRIMARY KEY CLUSTERED 
(
	[TransportFeeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTransportFee]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransportFee](
	[TransportID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[TransportAmount] [decimal](18, 0) NOT NULL,
	[VehicleNo] [nvarchar](50) NULL,
	[VehicleDriverName] [nvarchar](50) NULL,
	[VehicleAread] [nvarchar](50) NOT NULL,
	[Distance] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblTransportFee] PRIMARY KEY CLUSTERED 
(
	[TransportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTransport_Student_Mapping]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransport_Student_Mapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[Q1] [nchar](10) NULL,
	[Q2] [nchar](10) NULL,
	[Q3] [nchar](10) NULL,
	[Q4] [nchar](10) NULL,
	[IsBothSide] [nvarchar](50) NULL,
	[Distance] [nvarchar](50) NULL,
	[Amount] [nvarchar](50) NULL,
	[MappedOn] [nvarchar](50) NULL,
	[IsBothSideQ1] [int] NULL,
	[IsBothSideQ2] [int] NULL,
	[IsBothSideQ3] [int] NULL,
	[IsBothSideQ4] [int] NULL,
 CONSTRAINT [PK_tblTransport_Student_Mapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AssignUserToTicket]    Script Date: 04/03/2018 01:28:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AssignUserToTicket]
(
     @updateAuthor varchar(100)
    , @assignedUser varchar(100)
    , @ticketID bigint
)
AS
BEGIN
    BEGIN TRANSACTION;
    SAVE TRANSACTION MySavePoint;
    SET @updateAuthor = 'user1';
    SET @assignedUser = 'user2';
    SET @ticketID = 123456;

    BEGIN TRY
    UPDATE dbo.tblTicket 
    SET ticketAssignedUserSamAccountName = @assignedUser 
    WHERE (ticketID = @ticketID);

    INSERT INTO [dbo].[tblTicketUpdate]
            (
            [ticketID]
            ,[updateDetail]
            ,[updateDateTime]
            ,[userSamAccountName]
            ,[activity]
            )
        VALUES (
            @ticketID
            , 'Assigned ticket to ' + @assignedUser
            , GetDate()
            , @updateAuthor
            , 'Assign'
            );
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION MySavePoint; -- rollback to MySavePoint
        END
    END CATCH
    COMMIT TRANSACTION 
END;
GO
/****** Object:  Table [dbo].[tblStudentResult]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudentResult](
	[ResultId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Result] [nvarchar](50) NULL,
	[Session] [nchar](10) NULL,
	[Class] [nchar](10) NULL,
	[Sec] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStudentInformation]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudentInformation](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[FatherName] [nvarchar](50) NOT NULL,
	[MotherName] [nvarchar](50) NOT NULL,
	[CurrentAddress] [nvarchar](150) NOT NULL,
	[PermanentAddress] [nvarchar](150) NOT NULL,
	[DOB] [date] NOT NULL,
	[MobileNo] [nvarchar](50) NULL,
	[AlternateNo] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Class] [nvarchar](50) NULL,
	[Section] [nvarchar](50) NULL,
	[House] [nvarchar](50) NULL,
	[AadharNo] [nvarchar](50) NULL,
	[Sex] [nvarchar](50) NULL,
	[StudentType] [nvarchar](50) NULL,
	[IsRTE] [nvarchar](50) NULL,
	[BloodGroup] [nchar](10) NULL,
	[AdmissionDate] [nvarchar](50) NULL,
	[TransportService] [nchar](10) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Remark] [nvarchar](50) NULL,
	[SessionName] [nvarchar](20) NULL,
	[OldClass] [nvarchar](100) NULL,
	[OldClassPercentage] [nvarchar](100) NULL,
	[studentimage] [image] NULL,
	[CastName] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblStudentInformation] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStudentFeeDetails]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudentFeeDetails](
	[FeeDetails] [int] IDENTITY(1,1) NOT NULL,
	[FeeCollectionID] [int] NOT NULL,
	[StudentId] [int] NULL,
	[ClassId] [int] NULL,
	[BalanceAdmissionFee] [decimal](18, 0) NULL,
	[BalanceRegistrationFee] [decimal](18, 0) NULL,
	[BalanceTutionFee] [decimal](18, 0) NULL,
	[BalanceMonthlyFee] [decimal](18, 0) NULL,
	[BanancMiscFee] [decimal](18, 0) NULL,
	[BalanceTransport] [int] NULL,
 CONSTRAINT [PK_tblStudentFeeDetails] PRIMARY KEY CLUSTERED 
(
	[FeeDetails] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSession]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSession](
	[BatchId] [int] IDENTITY(1,1) NOT NULL,
	[BatchName] [nvarchar](50) NOT NULL,
	[BatchStartDate] [date] NULL,
	[BatchEndDate] [date] NULL,
	[BatchActive] [nvarchar](50) NULL,
	[CreatedDate] [nvarchar](50) NULL,
	[ModifiedDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSession] PRIMARY KEY CLUSTERED 
(
	[BatchId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPaymentMode]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaymentMode](
	[PaymentModeId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentModeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblPaymentMode] PRIMARY KEY CLUSTERED 
(
	[PaymentModeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPaymentInformation]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaymentInformation](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[PayeeName] [nvarchar](50) NOT NULL,
	[PaidAmount] [decimal](18, 0) NULL,
	[PaymentPurpose] [nvarchar](50) NULL,
	[PaymentMode] [nvarchar](50) NULL,
	[PaymentRemarks] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayeeInformation]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayeeInformation](
	[PayeeId] [int] IDENTITY(1,1) NOT NULL,
	[PayeeName] [nvarchar](50) NOT NULL,
	[ContactNo] [int] NOT NULL,
	[Address] [nvarchar](100) NULL,
	[AadharCardNo] [nvarchar](50) NULL,
	[OtherInformation] [nvarchar](100) NULL,
	[AddedDate] [datetime] NULL,
 CONSTRAINT [PK_tblPayeeInformation] PRIMARY KEY CLUSTERED 
(
	[PayeeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHouse]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHouse](
	[HouseId] [int] NOT NULL,
	[HouseName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblHouse] PRIMARY KEY CLUSTERED 
(
	[HouseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeeCollection]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeeCollection](
	[FeeCollectionID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[FeeReceiptDate] [datetime] NULL,
	[AdmissionFee] [int] NULL,
	[RegistrationFee] [int] NULL,
	[TutionFee] [int] NULL,
	[MonthlyFee] [int] NULL,
	[Misc] [int] NULL,
	[TransportFee] [int] NULL,
	[IsWorking] [nvarchar](10) NULL,
	[PaymentMode] [nvarchar](20) NULL,
	[Remarks] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblFeeCollection] PRIMARY KEY CLUSTERED 
(
	[FeeCollectionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblExpense]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExpense](
	[ExpId] [int] IDENTITY(1,1) NOT NULL,
	[ExpName] [nvarchar](50) NOT NULL,
	[CreatedDate] [nvarchar](50) NULL,
	[ModifiedDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblExpense] PRIMARY KEY CLUSTERED 
(
	[ExpId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployeeInformation]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeInformation](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [nvarchar](100) NOT NULL,
	[Sex] [nvarchar](50) NOT NULL,
	[FatherName] [nvarchar](50) NULL,
	[MotherName] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](50) NULL,
	[AlternateNo] [nvarchar](50) NULL,
	[AadharNo] [nvarchar](50) NULL,
	[PAddress] [nvarchar](max) NULL,
	[CAddress] [nvarchar](max) NULL,
	[StaffType] [nvarchar](50) NULL,
	[BloodGroup] [nvarchar](50) NULL,
	[DOJ] [datetime] NULL,
	[DOB] [datetime] NULL,
	[Email] [nvarchar](50) NULL,
	[Salary] [nvarchar](50) NULL,
	[CreatedDate] [nvarchar](50) NULL,
	[ModifiedDate] [nvarchar](50) NULL,
	[TrainedTeacher] [nvarchar](50) NULL,
	[OtherQualification] [nvarchar](50) NULL,
	[IsWorking] [nvarchar](10) NULL,
	[State] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblEmployeeInformation] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployeeEducation]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeEducation](
	[EmployeeEducationId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[BoardUniversity] [nvarchar](50) NULL,
	[YearOfPassing] [nvarchar](50) NULL,
	[PercentScored] [nvarchar](50) NULL,
	[Specialization] [nvarchar](50) NULL,
	[EmployeeId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[modifiedDate] [datetime] NULL,
 CONSTRAINT [PK_tblEmployeeEducation] PRIMARY KEY CLUSTERED 
(
	[EmployeeEducationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClassInformation]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClassInformation](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[Section] [nvarchar](50) NULL,
	[AdmissionFee] [decimal](18, 0) NULL,
	[RegistrationFee] [decimal](18, 0) NULL,
	[TutionFee] [decimal](18, 0) NULL,
	[MonthlyFee] [decimal](18, 0) NULL,
	[Misc] [decimal](18, 0) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_tblClassInformation] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCastList]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCastList](
	[CastId] [int] NOT NULL,
	[CastName] [nvarchar](50) NOT NULL,
	[CreatedDate] [nvarchar](50) NULL,
	[ModifiedDate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblbloodgroup]    Script Date: 04/03/2018 01:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblbloodgroup](
	[BloodGroup] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblbloodgroup] PRIMARY KEY CLUSTERED 
(
	[BloodGroup] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateStudentFeeDetails_AddFeeCollection]    Script Date: 04/03/2018 01:28:55 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_TransportOperation]    Script Date: 04/03/2018 01:28:55 ******/
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
	@SaveOrUpdate int,
	@Distance int
AS
BEGIN
	if(@SaveOrUpdate =0)		
		BEGIN
			INSERT INTO tblTransportFee(ClassID, TransportAmount, VehicleNo, VehicleDriverName, VehicleAread,Distance)VALUES(@ClassID, @TransportAmount, @VehicleNo, @VehicleDriverName, @VehicleAread,@Distance);
		END
	else
		BEGIN
			UPDATE tblTransportFee SET ClassID=@ClassID ,TransportAmount=@TransportAmount, VehicleNo=@VehicleNo, VehicleDriverName=@VehicleDriverName, VehicleAread=@VehicleAread,Distance=@Distance WHERE TransportID=@SaveOrUpdate
		END
		
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SearchTransportFee]    Script Date: 04/03/2018 01:28:55 ******/
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
		select t1.Amount from tblTransport_Student_Mapping t1  inner join tblStudentInformation t2 on t1.StudentId = t2.StudentId where t2.StudentId=@studentId;
	END
  ELSE 
	BEGIN
		SELECT  BalanceAmount from tblTransportFeeCollection where StudentId=@studentId;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUpdateRecordAfterTransportFeeReceipt]    Script Date: 04/03/2018 01:28:55 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_GetUpdateRecordAfterFeePayment]    Script Date: 04/03/2018 01:28:55 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetTransportData]    Script Date: 04/03/2018 01:28:55 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetStudentTransportMapDetail]    Script Date: 04/03/2018 01:28:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetStudentTransportMapDetail]
	@StudentId Int
AS
BEGIN
DECLARE @retVal int  
  SELECT @retVal=count(Id)   FROM tblTransport_Student_Mapping WHERE StudentId=@StudentId
  --    
  IF(@retVal>0)
  BEGIN
	Select t1.StudentName,t1.Class,t1.Section,t2.Id As TransportMapId,t2.Q1,t2.Q2,t2.Q3,t2.Q4,t2.Distance,
	t2.IsBothSideQ1,t2.IsBothSideQ2,t2.IsBothSideQ3,t2.IsBothSideQ4	
	from tblStudentInformation t1 inner join 
	tblTransport_Student_Mapping t2 on t2.StudentId=t1.StudentId
	where t1.StudentId=	@StudentId  
	END
	
	ELSE
	BEGIN
	Select t1.StudentName,t1.Class,t1.Section
		from tblStudentInformation t1 
		where t1.StudentId=	@StudentId  
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetClassInformation]    Script Date: 04/03/2018 01:28:55 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_GetAllTransportFeesDetails]    Script Date: 04/03/2018 01:28:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetAllTransportFeesDetails]
	@FromDate date,
	@ToDate date
AS
BEGIN
	Select t1.TransportFeeId As Transaction_ID,t2.StudentName,t2.Class,t2.Section,t1.PaymentAmount,t1.PaymentDate,t1.BalanceAmount,t1.PaymentDate from tblTransportFeeCollection t1
	inner join tblStudentInformation t2 on t1.StudentId=t2.StudentId 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FirstTimeGetData]    Script Date: 04/03/2018 01:28:55 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateTransportMapping]    Script Date: 04/03/2018 01:28:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateTransportMapping] 
	@MappingId int,
	@StudentId int,
	@Q1 nvarchar(50),
	@Q2 NVARCHAR(50),
	@Q3 NVARCHAR(50),
	@Q4 NVARCHAR(50),
	
	@Distance nvarchar(50),
	@Amount nvarchar(50),
	@MappedOn nvarchar(50),
@IsBothSideQ1 int,
@IsBothSideQ2 int,
@IsBothSideQ3 int,
@IsBothSideQ4 int
	
	
AS
BEGIN
	if(@MappingId = 0)
	begin
	 insert into tblTransport_Student_Mapping (
StudentId
,Q1
,Q2
,Q3
,Q4      
,Distance
,Amount
,MappedOn
,IsBothSideQ1
,IsBothSideQ2
,IsBothSideQ3
,IsBothSideQ4
      
      ) 
      values(@StudentId,@Q1,@Q2,@Q3,@Q4,@Distance,@Amount,@MappedOn,@IsBothSideQ1,@IsBothSideQ2,@IsBothSideQ3,@IsBothSideQ4 )
	end																			
	else																		
	begin																		
	update tblTransport_Student_Mapping set 
Q1=@Q1
,Q2=@Q2
,Q3=@Q3
,Q4    =@Q4  
,Distance=@Distance
,Amount=@Amount
,MappedOn=@MappedOn
,IsBothSideQ1=@IsBothSideQ1
,IsBothSideQ2=@IsBothSideQ2
,IsBothSideQ3=@IsBothSideQ3
,IsBothSideQ4=@IsBothSideQ4

 where Id=@MappingId
	
	end
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateAndUpdateStudentInformation]    Script Date: 04/03/2018 01:28:55 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_CollectTransportFee]    Script Date: 04/03/2018 01:28:55 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ADDTransportFee]    Script Date: 04/03/2018 01:28:55 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_AddPayment]    Script Date: 04/03/2018 01:28:55 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_AddPayeeInfo]    Script Date: 04/03/2018 01:28:55 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllPaymentInformation]    Script Date: 04/03/2018 01:28:55 ******/
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
