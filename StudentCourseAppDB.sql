USE [master]
GO
/****** Object:  Database [StudentCourseAppDB]    Script Date: 7/28/2023 10:09:12 PM ******/
CREATE DATABASE [StudentCourseAppDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentCourseAppDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentCourseAppDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentCourseAppDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentCourseAppDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentCourseAppDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentCourseAppDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentCourseAppDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentCourseAppDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentCourseAppDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StudentCourseAppDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentCourseAppDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentCourseAppDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentCourseAppDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentCourseAppDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentCourseAppDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentCourseAppDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentCourseAppDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentCourseAppDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentCourseAppDB', N'ON'
GO
ALTER DATABASE [StudentCourseAppDB] SET QUERY_STORE = OFF
GO
USE [StudentCourseAppDB]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 7/28/2023 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [nvarchar](191) NULL,
	[CourseName] [nvarchar](191) NULL,
	[TeacherId] [nvarchar](191) NULL,
	[CourseStartDate] [date] NULL,
	[CourseEndDate] [date] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 7/28/2023 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](191) NULL,
	[LastName] [nvarchar](191) NULL,
	[ShortName] [nvarchar](191) NULL,
	[Gender] [nvarchar](191) NULL,
	[DateOfBirth] [date] NULL,
	[Address1] [nvarchar](191) NULL,
	[Address2] [nvarchar](191) NULL,
	[Address3] [nvarchar](191) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/28/2023 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](191) NULL,
	[LastName] [nvarchar](191) NULL,
	[ShortName] [nvarchar](191) NULL,
	[Email] [nvarchar](191) NULL,
	[DateOfBirth] [date] NULL,
	[Phone] [nvarchar](191) NULL,
	[PasswordText] [nvarchar](191) NULL,
	[Address1] [nvarchar](191) NULL,
	[Address2] [nvarchar](191) NULL,
	[Address3] [nvarchar](191) NULL,
	[IsActive] [bit] NOT NULL,
	[UserType] [int] NOT NULL,
	[RoleName] [nvarchar](191) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Students] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Students] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Students] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [UserType]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
/****** Object:  StoredProcedure [dbo].[uspInsertStudent]    Script Date: 7/28/2023 10:09:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspInsertStudent]
@FirstName nvarchar(191),
@LastName nvarchar(191),
@Gender nvarchar(100),
@DateOfBirth nvarchar(100),
@Address1 nvarchar(191),
@Address2 nvarchar(191),
@Address3 nvarchar(191),
@Id int OUTPUT
AS
BEGIN
IF EXISTS(SELECT Id FROM Students WHERE FirstName = @FirstName AND LastName = @LastName)
    BEGIN
        SET @Id = 0
    END
ELSE
    BEGIN
        INSERT INTO Students(FirstName, LastName, Gender, DateOfBirth, Address1, Address2, Address3, IsActive) 
		VALUES (@FirstName, @LastName, @Gender, @DateOfBirth, @Address1, @Address2, @Address3, 1)
        SET @Id = @@IDENTITY
    END
END


--Select * From Students Order By Id Desc
GO
USE [master]
GO
ALTER DATABASE [StudentCourseAppDB] SET  READ_WRITE 
GO
