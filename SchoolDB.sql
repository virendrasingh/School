USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblbloodgroup]    Script Date: 09/26/2017 00:06:21 ******/
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

USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblCastList]    Script Date: 09/26/2017 00:06:31 ******/
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

USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblClassInformation]    Script Date: 09/26/2017 00:06:41 ******/
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
USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblExpense]    Script Date: 09/26/2017 00:06:54 ******/
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
USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblFeeCollection]    Script Date: 09/26/2017 00:07:08 ******/
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
USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblHouse]    Script Date: 09/26/2017 00:07:17 ******/
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
USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblPayeeInformation]    Script Date: 09/26/2017 00:07:25 ******/
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
USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblPaymentInformation]    Script Date: 09/26/2017 00:07:34 ******/
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
USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblPaymentMode]    Script Date: 09/26/2017 00:07:42 ******/
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
USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblSession]    Script Date: 09/26/2017 00:07:50 ******/
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
USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblStudentFeeDetails]    Script Date: 09/26/2017 00:07:57 ******/
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
USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblStudentInformation]    Script Date: 09/26/2017 00:08:07 ******/
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
USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblTransportFee]    Script Date: 09/26/2017 00:08:16 ******/
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
 CONSTRAINT [PK_tblTransportFee] PRIMARY KEY CLUSTERED 
(
	[TransportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblTransportFeeCollection]    Script Date: 09/26/2017 00:08:23 ******/
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
 CONSTRAINT [PK_tblTransportFeeCollecT] PRIMARY KEY CLUSTERED 
(
	[TransportFeeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [SchoolDB]
GO

/****** Object:  Table [dbo].[tblUsers]    Script Date: 09/26/2017 00:08:30 ******/
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
















