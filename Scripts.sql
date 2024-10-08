USE [master]
GO
/****** Object:  Database [Aeropuerto]    Script Date: 21/08/2024 09:48:31 p. m. ******/
CREATE DATABASE [Aeropuerto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Aeropuerto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Aeropuerto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Aeropuerto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Aeropuerto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Aeropuerto] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Aeropuerto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Aeropuerto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Aeropuerto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Aeropuerto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Aeropuerto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Aeropuerto] SET ARITHABORT OFF 
GO
ALTER DATABASE [Aeropuerto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Aeropuerto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Aeropuerto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Aeropuerto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Aeropuerto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Aeropuerto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Aeropuerto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Aeropuerto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Aeropuerto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Aeropuerto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Aeropuerto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Aeropuerto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Aeropuerto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Aeropuerto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Aeropuerto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Aeropuerto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Aeropuerto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Aeropuerto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Aeropuerto] SET  MULTI_USER 
GO
ALTER DATABASE [Aeropuerto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Aeropuerto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Aeropuerto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Aeropuerto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Aeropuerto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Aeropuerto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Aeropuerto] SET QUERY_STORE = OFF
GO
USE [Aeropuerto]
GO
/****** Object:  Table [dbo].[Airplane]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airplane](
	[RegistrationNumber] [varchar](50) NOT NULL,
	[BeginOfOperation] [date] NULL,
	[Status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RegistrationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[AirportID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AirportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AvailableSeat]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvailableSeat](
	[AvailableSeatID] [int] IDENTITY(1,1) NOT NULL,
	[FlightID] [int] NULL,
	[SeatID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AvailableSeatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id_city] [int] IDENTITY(1,1) NOT NULL,
	[id_country] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City_Airport]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City_Airport](
	[id_city] [int] NOT NULL,
	[id_airport] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_city] ASC,
	[id_airport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id_country] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[CouponID] [int] IDENTITY(1,1) NOT NULL,
	[DateOfRedemption] [date] NULL,
	[Class] [varchar](50) NULL,
	[Standby] [bit] NULL,
	[MealCode] [varchar](50) NULL,
	[TicketID] [int] NULL,
	[FlightID] [int] NULL,
	[AvailableSeatID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[DateOfBirth] [date] NULL,
	[FFCNumber] [int] NULL,
	[id_document] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[id_document] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_document] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[FlightID] [int] IDENTITY(1,1) NOT NULL,
	[BoardingTime] [time](7) NULL,
	[FlightDate] [date] NULL,
	[Gate] [varchar](50) NULL,
	[CheckInCounter] [varchar](50) NULL,
	[FlightNumberID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightNumber]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightNumber](
	[FlightNumberID] [int] IDENTITY(1,1) NOT NULL,
	[DepartureTime] [time](7) NULL,
	[Description] [varchar](255) NULL,
	[Type] [varchar](50) NULL,
	[Airline] [varchar](50) NULL,
	[StartAirportID] [int] NULL,
	[GoalAirportID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FlightNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FrequentFlyerCard]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FrequentFlyerCard](
	[FFCNumber] [int] NOT NULL,
	[Miles] [int] NULL,
	[MealCode] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FFCNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PiecesOfLuggage]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PiecesOfLuggage](
	[LuggageID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NULL,
	[Weight] [decimal](5, 2) NULL,
	[CouponID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LuggageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaneModel]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaneModel](
	[PlaneModelID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NULL,
	[Graphic] [varbinary](max) NULL,
	[RegistrationNumber] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PlaneModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seat]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seat](
	[SeatID] [int] IDENTITY(1,1) NOT NULL,
	[Size] [varchar](50) NULL,
	[Number] [int] NULL,
	[Location] [varchar](50) NULL,
	[PlaneModelID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SeatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 21/08/2024 09:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[TicketingCode] [varchar](50) NULL,
	[Number] [int] NULL,
	[CustomerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Airplane] ([RegistrationNumber], [BeginOfOperation], [Status]) VALUES (N'N11223', CAST(N'2014-07-19' AS Date), N'Retired')
INSERT [dbo].[Airplane] ([RegistrationNumber], [BeginOfOperation], [Status]) VALUES (N'N12345', CAST(N'2015-06-01' AS Date), N'Active')
INSERT [dbo].[Airplane] ([RegistrationNumber], [BeginOfOperation], [Status]) VALUES (N'N33445', CAST(N'2016-01-17' AS Date), N'Active')
INSERT [dbo].[Airplane] ([RegistrationNumber], [BeginOfOperation], [Status]) VALUES (N'N44332', CAST(N'2021-07-10' AS Date), N'Active')
INSERT [dbo].[Airplane] ([RegistrationNumber], [BeginOfOperation], [Status]) VALUES (N'N54321', CAST(N'2011-03-22' AS Date), N'In Maintenance')
INSERT [dbo].[Airplane] ([RegistrationNumber], [BeginOfOperation], [Status]) VALUES (N'N66778', CAST(N'2013-05-22' AS Date), N'In Maintenance')
INSERT [dbo].[Airplane] ([RegistrationNumber], [BeginOfOperation], [Status]) VALUES (N'N67890', CAST(N'2018-09-15' AS Date), N'Active')
INSERT [dbo].[Airplane] ([RegistrationNumber], [BeginOfOperation], [Status]) VALUES (N'N77889', CAST(N'2019-03-25' AS Date), N'Active')
INSERT [dbo].[Airplane] ([RegistrationNumber], [BeginOfOperation], [Status]) VALUES (N'N98765', CAST(N'2020-12-05' AS Date), N'Active')
INSERT [dbo].[Airplane] ([RegistrationNumber], [BeginOfOperation], [Status]) VALUES (N'N99887', CAST(N'2017-11-30' AS Date), N'Retired')
GO
SET IDENTITY_INSERT [dbo].[Airport] ON 

INSERT [dbo].[Airport] ([AirportID], [Name]) VALUES (1, N'John F. Kennedy International Airport')
INSERT [dbo].[Airport] ([AirportID], [Name]) VALUES (2, N'Los Angeles International Airport')
INSERT [dbo].[Airport] ([AirportID], [Name]) VALUES (3, N'Heathrow Airport')
INSERT [dbo].[Airport] ([AirportID], [Name]) VALUES (4, N'Tokyo Haneda Airport')
INSERT [dbo].[Airport] ([AirportID], [Name]) VALUES (5, N'Dubai International Airport')
INSERT [dbo].[Airport] ([AirportID], [Name]) VALUES (6, N'Sydney Airport')
INSERT [dbo].[Airport] ([AirportID], [Name]) VALUES (7, N'Toronto Pearson International Airport')
INSERT [dbo].[Airport] ([AirportID], [Name]) VALUES (8, N'Berlin Brandenburg Airport')
INSERT [dbo].[Airport] ([AirportID], [Name]) VALUES (9, N'Charles de Gaulle Airport')
INSERT [dbo].[Airport] ([AirportID], [Name]) VALUES (10, N'Chhatrapati Shivaji Maharaj International Airport')
SET IDENTITY_INSERT [dbo].[Airport] OFF
GO
SET IDENTITY_INSERT [dbo].[AvailableSeat] ON 

INSERT [dbo].[AvailableSeat] ([AvailableSeatID], [FlightID], [SeatID]) VALUES (1, 1, 1)
INSERT [dbo].[AvailableSeat] ([AvailableSeatID], [FlightID], [SeatID]) VALUES (2, 1, 2)
INSERT [dbo].[AvailableSeat] ([AvailableSeatID], [FlightID], [SeatID]) VALUES (3, 2, 3)
INSERT [dbo].[AvailableSeat] ([AvailableSeatID], [FlightID], [SeatID]) VALUES (4, 3, 4)
INSERT [dbo].[AvailableSeat] ([AvailableSeatID], [FlightID], [SeatID]) VALUES (5, 4, 5)
INSERT [dbo].[AvailableSeat] ([AvailableSeatID], [FlightID], [SeatID]) VALUES (6, 5, 6)
INSERT [dbo].[AvailableSeat] ([AvailableSeatID], [FlightID], [SeatID]) VALUES (7, 6, 7)
INSERT [dbo].[AvailableSeat] ([AvailableSeatID], [FlightID], [SeatID]) VALUES (8, 7, 8)
INSERT [dbo].[AvailableSeat] ([AvailableSeatID], [FlightID], [SeatID]) VALUES (9, 8, 9)
INSERT [dbo].[AvailableSeat] ([AvailableSeatID], [FlightID], [SeatID]) VALUES (10, 9, 10)
SET IDENTITY_INSERT [dbo].[AvailableSeat] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([id_city], [id_country], [name]) VALUES (1, 1, N'New York')
INSERT [dbo].[City] ([id_city], [id_country], [name]) VALUES (2, 1, N'Los Angeles')
INSERT [dbo].[City] ([id_city], [id_country], [name]) VALUES (3, 2, N'London')
INSERT [dbo].[City] ([id_city], [id_country], [name]) VALUES (4, 3, N'Tokyo')
INSERT [dbo].[City] ([id_city], [id_country], [name]) VALUES (5, 4, N'Dubai')
INSERT [dbo].[City] ([id_city], [id_country], [name]) VALUES (6, 5, N'Sydney')
INSERT [dbo].[City] ([id_city], [id_country], [name]) VALUES (7, 6, N'Toronto')
INSERT [dbo].[City] ([id_city], [id_country], [name]) VALUES (8, 7, N'Berlin')
INSERT [dbo].[City] ([id_city], [id_country], [name]) VALUES (9, 8, N'Paris')
INSERT [dbo].[City] ([id_city], [id_country], [name]) VALUES (10, 9, N'Mumbai')
INSERT [dbo].[City] ([id_city], [id_country], [name]) VALUES (11, 10, N'Sao Paulo')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
INSERT [dbo].[City_Airport] ([id_city], [id_airport]) VALUES (1, 1)
INSERT [dbo].[City_Airport] ([id_city], [id_airport]) VALUES (2, 2)
INSERT [dbo].[City_Airport] ([id_city], [id_airport]) VALUES (3, 3)
INSERT [dbo].[City_Airport] ([id_city], [id_airport]) VALUES (4, 4)
INSERT [dbo].[City_Airport] ([id_city], [id_airport]) VALUES (5, 5)
INSERT [dbo].[City_Airport] ([id_city], [id_airport]) VALUES (6, 6)
INSERT [dbo].[City_Airport] ([id_city], [id_airport]) VALUES (7, 7)
INSERT [dbo].[City_Airport] ([id_city], [id_airport]) VALUES (8, 8)
INSERT [dbo].[City_Airport] ([id_city], [id_airport]) VALUES (9, 9)
INSERT [dbo].[City_Airport] ([id_city], [id_airport]) VALUES (10, 10)
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id_country], [name]) VALUES (1, N'United States')
INSERT [dbo].[Country] ([id_country], [name]) VALUES (2, N'United Kingdom')
INSERT [dbo].[Country] ([id_country], [name]) VALUES (3, N'Japan')
INSERT [dbo].[Country] ([id_country], [name]) VALUES (4, N'United Arab Emirates')
INSERT [dbo].[Country] ([id_country], [name]) VALUES (5, N'Australia')
INSERT [dbo].[Country] ([id_country], [name]) VALUES (6, N'Canada')
INSERT [dbo].[Country] ([id_country], [name]) VALUES (7, N'Germany')
INSERT [dbo].[Country] ([id_country], [name]) VALUES (8, N'France')
INSERT [dbo].[Country] ([id_country], [name]) VALUES (9, N'India')
INSERT [dbo].[Country] ([id_country], [name]) VALUES (10, N'Brazil')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Coupon] ON 

INSERT [dbo].[Coupon] ([CouponID], [DateOfRedemption], [Class], [Standby], [MealCode], [TicketID], [FlightID], [AvailableSeatID]) VALUES (1, CAST(N'2024-08-01' AS Date), N'Economy', 0, N'Vegan', 1, 1, 1)
INSERT [dbo].[Coupon] ([CouponID], [DateOfRedemption], [Class], [Standby], [MealCode], [TicketID], [FlightID], [AvailableSeatID]) VALUES (2, CAST(N'2024-08-02' AS Date), N'Economy', 1, N'Vegetarian', 2, 2, 2)
INSERT [dbo].[Coupon] ([CouponID], [DateOfRedemption], [Class], [Standby], [MealCode], [TicketID], [FlightID], [AvailableSeatID]) VALUES (3, CAST(N'2024-08-03' AS Date), N'Business', 0, N'Gluten-Free', 3, 3, 3)
INSERT [dbo].[Coupon] ([CouponID], [DateOfRedemption], [Class], [Standby], [MealCode], [TicketID], [FlightID], [AvailableSeatID]) VALUES (4, CAST(N'2024-08-04' AS Date), N'First', 1, N'Non-Vegetarian', 4, 4, 4)
INSERT [dbo].[Coupon] ([CouponID], [DateOfRedemption], [Class], [Standby], [MealCode], [TicketID], [FlightID], [AvailableSeatID]) VALUES (5, CAST(N'2024-08-05' AS Date), N'Economy', 0, N'Kosher', 5, 5, 5)
INSERT [dbo].[Coupon] ([CouponID], [DateOfRedemption], [Class], [Standby], [MealCode], [TicketID], [FlightID], [AvailableSeatID]) VALUES (6, CAST(N'2024-08-06' AS Date), N'Business', 1, N'Halal', 6, 6, 6)
INSERT [dbo].[Coupon] ([CouponID], [DateOfRedemption], [Class], [Standby], [MealCode], [TicketID], [FlightID], [AvailableSeatID]) VALUES (7, CAST(N'2024-08-07' AS Date), N'First', 0, N'Lactose-Free', 7, 7, 7)
INSERT [dbo].[Coupon] ([CouponID], [DateOfRedemption], [Class], [Standby], [MealCode], [TicketID], [FlightID], [AvailableSeatID]) VALUES (8, CAST(N'2024-08-08' AS Date), N'Economy', 1, N'Pescatarian', 8, 8, 8)
INSERT [dbo].[Coupon] ([CouponID], [DateOfRedemption], [Class], [Standby], [MealCode], [TicketID], [FlightID], [AvailableSeatID]) VALUES (9, CAST(N'2024-08-09' AS Date), N'Business', 0, N'No Preference', 9, 9, 9)
INSERT [dbo].[Coupon] ([CouponID], [DateOfRedemption], [Class], [Standby], [MealCode], [TicketID], [FlightID], [AvailableSeatID]) VALUES (10, CAST(N'2024-08-10' AS Date), N'Economy', 1, N'Vegetarian', 10, 10, 10)
SET IDENTITY_INSERT [dbo].[Coupon] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [Name], [DateOfBirth], [FFCNumber], [id_document]) VALUES (1, N'John Doe', CAST(N'1980-05-15' AS Date), 1001, 1)
INSERT [dbo].[Customer] ([CustomerID], [Name], [DateOfBirth], [FFCNumber], [id_document]) VALUES (2, N'Jane Smith', CAST(N'1992-08-22' AS Date), 1002, 2)
INSERT [dbo].[Customer] ([CustomerID], [Name], [DateOfBirth], [FFCNumber], [id_document]) VALUES (3, N'Alice Johnson', CAST(N'1975-03-10' AS Date), NULL, 3)
INSERT [dbo].[Customer] ([CustomerID], [Name], [DateOfBirth], [FFCNumber], [id_document]) VALUES (4, N'Bob Brown', CAST(N'1988-11-30' AS Date), 1003, 4)
INSERT [dbo].[Customer] ([CustomerID], [Name], [DateOfBirth], [FFCNumber], [id_document]) VALUES (5, N'Charlie Davis', CAST(N'2000-01-20' AS Date), NULL, 5)
INSERT [dbo].[Customer] ([CustomerID], [Name], [DateOfBirth], [FFCNumber], [id_document]) VALUES (6, N'Eve White', CAST(N'1985-07-14' AS Date), 1004, 1)
INSERT [dbo].[Customer] ([CustomerID], [Name], [DateOfBirth], [FFCNumber], [id_document]) VALUES (7, N'Frank Black', CAST(N'1995-02-25' AS Date), 1005, 2)
INSERT [dbo].[Customer] ([CustomerID], [Name], [DateOfBirth], [FFCNumber], [id_document]) VALUES (8, N'Grace Green', CAST(N'1970-09-05' AS Date), 1006, 3)
INSERT [dbo].[Customer] ([CustomerID], [Name], [DateOfBirth], [FFCNumber], [id_document]) VALUES (9, N'Hank Hill', CAST(N'1982-12-15' AS Date), 1007, 4)
INSERT [dbo].[Customer] ([CustomerID], [Name], [DateOfBirth], [FFCNumber], [id_document]) VALUES (10, N'Ivy Blue', CAST(N'1990-06-01' AS Date), NULL, 5)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Document] ON 

INSERT [dbo].[Document] ([id_document], [description]) VALUES (1, N'Passport')
INSERT [dbo].[Document] ([id_document], [description]) VALUES (2, N'Driver License')
INSERT [dbo].[Document] ([id_document], [description]) VALUES (3, N'National ID')
INSERT [dbo].[Document] ([id_document], [description]) VALUES (4, N'Social Security Number')
INSERT [dbo].[Document] ([id_document], [description]) VALUES (5, N'Voter ID')
SET IDENTITY_INSERT [dbo].[Document] OFF
GO
SET IDENTITY_INSERT [dbo].[Flight] ON 

INSERT [dbo].[Flight] ([FlightID], [BoardingTime], [FlightDate], [Gate], [CheckInCounter], [FlightNumberID]) VALUES (1, CAST(N'09:00:00' AS Time), CAST(N'2024-09-01' AS Date), N'A1', N'Counter 1', 1)
INSERT [dbo].[Flight] ([FlightID], [BoardingTime], [FlightDate], [Gate], [CheckInCounter], [FlightNumberID]) VALUES (2, CAST(N'13:00:00' AS Time), CAST(N'2024-09-02' AS Date), N'B2', N'Counter 2', 2)
INSERT [dbo].[Flight] ([FlightID], [BoardingTime], [FlightDate], [Gate], [CheckInCounter], [FlightNumberID]) VALUES (3, CAST(N'17:00:00' AS Time), CAST(N'2024-09-03' AS Date), N'C3', N'Counter 3', 3)
INSERT [dbo].[Flight] ([FlightID], [BoardingTime], [FlightDate], [Gate], [CheckInCounter], [FlightNumberID]) VALUES (4, CAST(N'07:00:00' AS Time), CAST(N'2024-09-04' AS Date), N'D4', N'Counter 4', 4)
INSERT [dbo].[Flight] ([FlightID], [BoardingTime], [FlightDate], [Gate], [CheckInCounter], [FlightNumberID]) VALUES (5, CAST(N'11:00:00' AS Time), CAST(N'2024-09-05' AS Date), N'E5', N'Counter 5', 5)
INSERT [dbo].[Flight] ([FlightID], [BoardingTime], [FlightDate], [Gate], [CheckInCounter], [FlightNumberID]) VALUES (6, CAST(N'10:30:00' AS Time), CAST(N'2024-09-06' AS Date), N'F6', N'Counter 6', 6)
INSERT [dbo].[Flight] ([FlightID], [BoardingTime], [FlightDate], [Gate], [CheckInCounter], [FlightNumberID]) VALUES (7, CAST(N'08:00:00' AS Time), CAST(N'2024-09-07' AS Date), N'G7', N'Counter 7', 7)
INSERT [dbo].[Flight] ([FlightID], [BoardingTime], [FlightDate], [Gate], [CheckInCounter], [FlightNumberID]) VALUES (8, CAST(N'14:00:00' AS Time), CAST(N'2024-09-08' AS Date), N'H8', N'Counter 8', 8)
INSERT [dbo].[Flight] ([FlightID], [BoardingTime], [FlightDate], [Gate], [CheckInCounter], [FlightNumberID]) VALUES (9, CAST(N'16:30:00' AS Time), CAST(N'2024-09-09' AS Date), N'I9', N'Counter 9', 9)
INSERT [dbo].[Flight] ([FlightID], [BoardingTime], [FlightDate], [Gate], [CheckInCounter], [FlightNumberID]) VALUES (10, CAST(N'12:00:00' AS Time), CAST(N'2024-09-10' AS Date), N'J10', N'Counter 10', 10)
SET IDENTITY_INSERT [dbo].[Flight] OFF
GO
SET IDENTITY_INSERT [dbo].[FlightNumber] ON 

INSERT [dbo].[FlightNumber] ([FlightNumberID], [DepartureTime], [Description], [Type], [Airline], [StartAirportID], [GoalAirportID]) VALUES (1, CAST(N'10:00:00' AS Time), N'Morning flight to LA', N'International', N'Delta', 1, 2)
INSERT [dbo].[FlightNumber] ([FlightNumberID], [DepartureTime], [Description], [Type], [Airline], [StartAirportID], [GoalAirportID]) VALUES (2, CAST(N'14:00:00' AS Time), N'Afternoon flight to London', N'International', N'British Airways', 1, 3)
INSERT [dbo].[FlightNumber] ([FlightNumberID], [DepartureTime], [Description], [Type], [Airline], [StartAirportID], [GoalAirportID]) VALUES (3, CAST(N'18:00:00' AS Time), N'Evening flight to Tokyo', N'International', N'Japan Airlines', 1, 4)
INSERT [dbo].[FlightNumber] ([FlightNumberID], [DepartureTime], [Description], [Type], [Airline], [StartAirportID], [GoalAirportID]) VALUES (4, CAST(N'08:00:00' AS Time), N'Early flight to Dubai', N'International', N'Emirates', 1, 5)
INSERT [dbo].[FlightNumber] ([FlightNumberID], [DepartureTime], [Description], [Type], [Airline], [StartAirportID], [GoalAirportID]) VALUES (5, CAST(N'12:00:00' AS Time), N'Midday flight to LA', N'International', N'American Airlines', 2, 1)
INSERT [dbo].[FlightNumber] ([FlightNumberID], [DepartureTime], [Description], [Type], [Airline], [StartAirportID], [GoalAirportID]) VALUES (6, CAST(N'13:30:00' AS Time), N'Afternoon flight to Paris', N'International', N'Air France', 1, 6)
INSERT [dbo].[FlightNumber] ([FlightNumberID], [DepartureTime], [Description], [Type], [Airline], [StartAirportID], [GoalAirportID]) VALUES (7, CAST(N'09:00:00' AS Time), N'Morning flight to Frankfurt', N'International', N'Lufthansa', 7, 3)
INSERT [dbo].[FlightNumber] ([FlightNumberID], [DepartureTime], [Description], [Type], [Airline], [StartAirportID], [GoalAirportID]) VALUES (8, CAST(N'15:00:00' AS Time), N'Evening flight to Hong Kong', N'International', N'Cathay Pacific', 8, 4)
INSERT [dbo].[FlightNumber] ([FlightNumberID], [DepartureTime], [Description], [Type], [Airline], [StartAirportID], [GoalAirportID]) VALUES (9, CAST(N'17:30:00' AS Time), N'Flight to Singapore', N'International', N'Singapore Airlines', 1, 9)
INSERT [dbo].[FlightNumber] ([FlightNumberID], [DepartureTime], [Description], [Type], [Airline], [StartAirportID], [GoalAirportID]) VALUES (10, CAST(N'11:00:00' AS Time), N'Flight to Beijing', N'International', N'Air China', 10, 5)
SET IDENTITY_INSERT [dbo].[FlightNumber] OFF
GO
INSERT [dbo].[FrequentFlyerCard] ([FFCNumber], [Miles], [MealCode]) VALUES (1001, 15000, N'Vegan')
INSERT [dbo].[FrequentFlyerCard] ([FFCNumber], [Miles], [MealCode]) VALUES (1002, 12000, N'Vegetarian')
INSERT [dbo].[FrequentFlyerCard] ([FFCNumber], [Miles], [MealCode]) VALUES (1003, 18000, N'Gluten-Free')
INSERT [dbo].[FrequentFlyerCard] ([FFCNumber], [Miles], [MealCode]) VALUES (1004, 20000, N'Non-Vegetarian')
INSERT [dbo].[FrequentFlyerCard] ([FFCNumber], [Miles], [MealCode]) VALUES (1005, 8000, N'Kosher')
INSERT [dbo].[FrequentFlyerCard] ([FFCNumber], [Miles], [MealCode]) VALUES (1006, 10000, N'Halal')
INSERT [dbo].[FrequentFlyerCard] ([FFCNumber], [Miles], [MealCode]) VALUES (1007, 9000, N'Lactose-Free')
INSERT [dbo].[FrequentFlyerCard] ([FFCNumber], [Miles], [MealCode]) VALUES (1008, 5000, N'Pescatarian')
INSERT [dbo].[FrequentFlyerCard] ([FFCNumber], [Miles], [MealCode]) VALUES (1009, 7000, N'No Preference')
INSERT [dbo].[FrequentFlyerCard] ([FFCNumber], [Miles], [MealCode]) VALUES (1010, 6000, N'Vegetarian')
GO
SET IDENTITY_INSERT [dbo].[PlaneModel] ON 

INSERT [dbo].[PlaneModel] ([PlaneModelID], [Description], [Graphic], [RegistrationNumber]) VALUES (1, N'Boeing 737', NULL, N'N12345')
INSERT [dbo].[PlaneModel] ([PlaneModelID], [Description], [Graphic], [RegistrationNumber]) VALUES (2, N'Airbus A320', NULL, N'N67890')
INSERT [dbo].[PlaneModel] ([PlaneModelID], [Description], [Graphic], [RegistrationNumber]) VALUES (3, N'Boeing 777', NULL, N'N54321')
INSERT [dbo].[PlaneModel] ([PlaneModelID], [Description], [Graphic], [RegistrationNumber]) VALUES (4, N'Airbus A380', NULL, N'N98765')
INSERT [dbo].[PlaneModel] ([PlaneModelID], [Description], [Graphic], [RegistrationNumber]) VALUES (5, N'Boeing 787', NULL, N'N11223')
INSERT [dbo].[PlaneModel] ([PlaneModelID], [Description], [Graphic], [RegistrationNumber]) VALUES (6, N'Boeing 747', NULL, N'N77889')
INSERT [dbo].[PlaneModel] ([PlaneModelID], [Description], [Graphic], [RegistrationNumber]) VALUES (7, N'Airbus A330', NULL, N'N33445')
INSERT [dbo].[PlaneModel] ([PlaneModelID], [Description], [Graphic], [RegistrationNumber]) VALUES (8, N'Boeing 767', NULL, N'N99887')
INSERT [dbo].[PlaneModel] ([PlaneModelID], [Description], [Graphic], [RegistrationNumber]) VALUES (9, N'Boeing 757', NULL, N'N66778')
INSERT [dbo].[PlaneModel] ([PlaneModelID], [Description], [Graphic], [RegistrationNumber]) VALUES (10, N'Airbus A350', NULL, N'N44332')
SET IDENTITY_INSERT [dbo].[PlaneModel] OFF
GO
SET IDENTITY_INSERT [dbo].[Seat] ON 

INSERT [dbo].[Seat] ([SeatID], [Size], [Number], [Location], [PlaneModelID]) VALUES (1, N'Economy', 1, N'Aisle', 1)
INSERT [dbo].[Seat] ([SeatID], [Size], [Number], [Location], [PlaneModelID]) VALUES (2, N'Economy', 2, N'Window', 1)
INSERT [dbo].[Seat] ([SeatID], [Size], [Number], [Location], [PlaneModelID]) VALUES (3, N'Business', 1, N'Aisle', 2)
INSERT [dbo].[Seat] ([SeatID], [Size], [Number], [Location], [PlaneModelID]) VALUES (4, N'First', 1, N'Window', 3)
INSERT [dbo].[Seat] ([SeatID], [Size], [Number], [Location], [PlaneModelID]) VALUES (5, N'Economy', 3, N'Middle', 4)
INSERT [dbo].[Seat] ([SeatID], [Size], [Number], [Location], [PlaneModelID]) VALUES (6, N'Business', 2, N'Window', 5)
INSERT [dbo].[Seat] ([SeatID], [Size], [Number], [Location], [PlaneModelID]) VALUES (7, N'First', 2, N'Aisle', 6)
INSERT [dbo].[Seat] ([SeatID], [Size], [Number], [Location], [PlaneModelID]) VALUES (8, N'Economy', 4, N'Aisle', 7)
INSERT [dbo].[Seat] ([SeatID], [Size], [Number], [Location], [PlaneModelID]) VALUES (9, N'Business', 3, N'Middle', 8)
INSERT [dbo].[Seat] ([SeatID], [Size], [Number], [Location], [PlaneModelID]) VALUES (10, N'Economy', 5, N'Window', 9)
SET IDENTITY_INSERT [dbo].[Seat] OFF
GO
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([TicketID], [TicketingCode], [Number], [CustomerID]) VALUES (1, N'TICKET123', 1, 1)
INSERT [dbo].[Ticket] ([TicketID], [TicketingCode], [Number], [CustomerID]) VALUES (2, N'TICKET124', 2, 2)
INSERT [dbo].[Ticket] ([TicketID], [TicketingCode], [Number], [CustomerID]) VALUES (3, N'TICKET125', 3, 3)
INSERT [dbo].[Ticket] ([TicketID], [TicketingCode], [Number], [CustomerID]) VALUES (4, N'TICKET126', 4, 4)
INSERT [dbo].[Ticket] ([TicketID], [TicketingCode], [Number], [CustomerID]) VALUES (5, N'TICKET127', 5, 5)
INSERT [dbo].[Ticket] ([TicketID], [TicketingCode], [Number], [CustomerID]) VALUES (6, N'TICKET128', 6, 6)
INSERT [dbo].[Ticket] ([TicketID], [TicketingCode], [Number], [CustomerID]) VALUES (7, N'TICKET129', 7, 7)
INSERT [dbo].[Ticket] ([TicketID], [TicketingCode], [Number], [CustomerID]) VALUES (8, N'TICKET130', 8, 8)
INSERT [dbo].[Ticket] ([TicketID], [TicketingCode], [Number], [CustomerID]) VALUES (9, N'TICKET131', 9, 9)
INSERT [dbo].[Ticket] ([TicketID], [TicketingCode], [Number], [CustomerID]) VALUES (10, N'TICKET132', 10, 10)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
GO
ALTER TABLE [dbo].[AvailableSeat]  WITH CHECK ADD FOREIGN KEY([FlightID])
REFERENCES [dbo].[Flight] ([FlightID])
GO
ALTER TABLE [dbo].[AvailableSeat]  WITH CHECK ADD FOREIGN KEY([SeatID])
REFERENCES [dbo].[Seat] ([SeatID])
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id_country])
GO
ALTER TABLE [dbo].[City_Airport]  WITH CHECK ADD FOREIGN KEY([id_airport])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[City_Airport]  WITH CHECK ADD FOREIGN KEY([id_city])
REFERENCES [dbo].[City] ([id_city])
GO
ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD FOREIGN KEY([AvailableSeatID])
REFERENCES [dbo].[AvailableSeat] ([AvailableSeatID])
GO
ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD FOREIGN KEY([FlightID])
REFERENCES [dbo].[Flight] ([FlightID])
GO
ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD FOREIGN KEY([TicketID])
REFERENCES [dbo].[Ticket] ([TicketID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([FFCNumber])
REFERENCES [dbo].[FrequentFlyerCard] ([FFCNumber])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([id_document])
REFERENCES [dbo].[Document] ([id_document])
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD FOREIGN KEY([FlightNumberID])
REFERENCES [dbo].[FlightNumber] ([FlightNumberID])
GO
ALTER TABLE [dbo].[FlightNumber]  WITH CHECK ADD FOREIGN KEY([GoalAirportID])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[FlightNumber]  WITH CHECK ADD FOREIGN KEY([StartAirportID])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[PiecesOfLuggage]  WITH CHECK ADD FOREIGN KEY([CouponID])
REFERENCES [dbo].[Coupon] ([CouponID])
GO
ALTER TABLE [dbo].[PlaneModel]  WITH CHECK ADD FOREIGN KEY([RegistrationNumber])
REFERENCES [dbo].[Airplane] ([RegistrationNumber])
GO
ALTER TABLE [dbo].[Seat]  WITH CHECK ADD FOREIGN KEY([PlaneModelID])
REFERENCES [dbo].[PlaneModel] ([PlaneModelID])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
USE [master]
GO
ALTER DATABASE [Aeropuerto] SET  READ_WRITE 
GO
