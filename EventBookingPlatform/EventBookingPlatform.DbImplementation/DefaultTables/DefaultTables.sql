/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Catering]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catering](
	[Pk_CateringId] [int] IDENTITY(1,1) NOT NULL,
	[Catering] [varchar](50) NULL,
 CONSTRAINT [PK_Catering] PRIMARY KEY CLUSTERED 
(
	[Pk_CateringId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[CateringValue]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CateringValue](
	[Pk_CateringValId] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](50) NULL,
 CONSTRAINT [PK_CateringValue] PRIMARY KEY CLUSTERED 
(
	[Pk_CateringValId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Certificate](
	[Pk_CertificateId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NOT NULL,
	[BusinessName] [varchar](50) NULL,
	[BusinessCert] [varchar](50) NULL,
	[TermsName] [varchar](50) NULL,
	[TermsConditionsCert] [varchar](50) NULL,
	[BusinessLicName] [varchar](50) NULL,
	[BusinessLicCert] [varchar](50) NULL,
	[PoliceAuthName] [varchar](50) NULL,
	[PoliceAuthCert] [varchar](50) NULL,
	[FireDeptName] [varchar](50) NULL,
	[FireDeptCert] [varchar](50) NULL,
	[SanitationName] [varchar](50) NULL,
	[SanitationCert] [varchar](50) NULL,
	[ThirdPtInsuranceName] [varchar](50) NULL,
	[ThirdPtInsuranceCert] [varchar](50) NULL,
 CONSTRAINT [PK_Certificate] PRIMARY KEY CLUSTERED 
(
	[Pk_CertificateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Chef]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chef](
	[Pk_VenueChefId] [int] IDENTITY(1,1) NOT NULL,
	[ChefForEvent] [varchar](50) NULL,
	[Experience] [varchar](50) NULL,
	[MeetChef] [varchar](50) NULL,
	[Note] [text] NULL,
 CONSTRAINT [PK_Chef] PRIMARY KEY CLUSTERED 
(
	[Pk_VenueChefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[ChefSpokenLanguage]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChefSpokenLanguage](
	[Pk_LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueChefId] [int] NULL,
	[Language] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SpokenLanguage] PRIMARY KEY CLUSTERED 
(
	[Pk_LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[ChildrenOption]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChildrenOption](
	[Pk_ChildrenOptId] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Approved] [bit] NULL,
 CONSTRAINT [PK_ChildrenOption] PRIMARY KEY CLUSTERED 
(
	[Pk_ChildrenOptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[ChildrenOptionComment]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChildrenOptionComment](
	[Pk_ChildrenOptCommentId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NULL,
	[Comment] [text] NULL,
 CONSTRAINT [PK_ChildrenOptionComment] PRIMARY KEY CLUSTERED 
(
	[Pk_ChildrenOptCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChildrenOptionValue]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChildrenOptionValue](
	[Pk_ChildrenOptValId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_ChildrenOptId] [int] NOT NULL,
	[Value] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ChildrenOptionValue] PRIMARY KEY CLUSTERED 
(
	[Pk_ChildrenOptValId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[DisabledOption]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DisabledOption](
	[Pk_DisabledOptionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Approved] [bit] NULL,
 CONSTRAINT [PK_DisabledOption] PRIMARY KEY CLUSTERED 
(
	[Pk_DisabledOptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[DisabledOptionComment]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisabledOptionComment](
	[Pk_DisabledOptCommentId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NULL,
	[Comment] [text] NULL,
 CONSTRAINT [PK_DisabledOptionComment] PRIMARY KEY CLUSTERED 
(
	[Pk_DisabledOptCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DisabledOptionValue]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DisabledOptionValue](
	[Pk_DisabledOptValId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_DisabledOptionId] [int] NOT NULL,
	[Value] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DisabledOptionValue] PRIMARY KEY CLUSTERED 
(
	[Pk_DisabledOptValId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Events]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Events](
	[Pk_EventId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Pk_EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[FacilityOption]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FacilityOption](
	[Pk_FacilityId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Approved] [bit] NULL,
 CONSTRAINT [PK_Facility] PRIMARY KEY CLUSTERED 
(
	[Pk_FacilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[FacilityOptionValue]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FacilityOptionValue](
	[Pk_OptValId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_FacilityId] [int] NOT NULL,
	[Value] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FacilityOptionValue] PRIMARY KEY CLUSTERED 
(
	[Pk_OptValId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Hall]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hall](
	[Pk_HallId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NOT NULL,
	[HallNo] [varchar](5) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Structure] [varchar](5) NOT NULL,
	[MinEveCap] [int] NOT NULL,
	[MinAftCap] [int] NOT NULL,
	[TableSeatCap] [int] NOT NULL,
	[StandingCap] [int] NOT NULL,
	[EventTime] [varchar](20) NOT NULL,
	[MaxEvtPerDay] [int] NOT NULL,
 CONSTRAINT [PK_Hall] PRIMARY KEY CLUSTERED 
(
	[Pk_HallId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Kitchen]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kitchen](
	[Pk_KitchenId] [int] IDENTITY(1,1) NOT NULL,
	[Kitchen] [varchar](50) NULL,
 CONSTRAINT [PK_Kitchen] PRIMARY KEY CLUSTERED 
(
	[Pk_KitchenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[KitchenValue]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KitchenValue](
	[Pk_KitchenValId] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](50) NULL,
 CONSTRAINT [PK_KitchenValue] PRIMARY KEY CLUSTERED 
(
	[Pk_KitchenValId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[KosherSupervision]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KosherSupervision](
	[Pk_KosherId] [int] IDENTITY(1,1) NOT NULL,
	[Kosher] [varchar](50) NOT NULL,
 CONSTRAINT [PK_KosherSupervision] PRIMARY KEY CLUSTERED 
(
	[Pk_KosherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[KosherSupervisionComment]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KosherSupervisionComment](
	[Pk_KosherCommentId] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [text] NULL,
 CONSTRAINT [PK_KosherSupervisionComment] PRIMARY KEY CLUSTERED 
(
	[Pk_KosherCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KosherSuperVisionValue]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KosherSuperVisionValue](
	[Pk_KosherValId] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](50) NULL,
	[ImgFileName] [varchar](50) NULL,
	[ImgFileLoc] [varchar](50) NULL,
 CONSTRAINT [PK_KosherSuperVisionValue] PRIMARY KEY CLUSTERED 
(
	[Pk_KosherValId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[ParkingOption]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParkingOption](
	[Pk_ParkingOptId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Approved] [bit] NULL,
 CONSTRAINT [PK_ParkingOption] PRIMARY KEY CLUSTERED 
(
	[Pk_ParkingOptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[ParkingOptionComment]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParkingOptionComment](
	[Pk_ParkingOptCommentId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NOT NULL,
	[Comment] [text] NOT NULL,
 CONSTRAINT [PK_ParkingOptionComment] PRIMARY KEY CLUSTERED 
(
	[Pk_ParkingOptCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParkingOptionValue]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParkingOptionValue](
	[Pk_ParkingOptValId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_ParkingOptId] [int] NOT NULL,
	[Value] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ParkingOptionValue] PRIMARY KEY CLUSTERED 
(
	[Pk_ParkingOptValId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[PrivateEvents]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrivateEvents](
	[Pk_EventId] [int] IDENTITY(1,1) NOT NULL,
	[Event] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pk_EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Pk_EquipSupplierId] [int] IDENTITY(1,1) NOT NULL,
	[OutsideSupplier] [varchar](50) NOT NULL,
	[PaSupplier] [varchar](50) NOT NULL,
	[StageLighting] [varchar](50) NOT NULL,
	[DessertsBar] [varchar](50) NOT NULL,
	[LiquorBarSupplier] [varchar](50) NOT NULL,
	[SecurityCheckSupplier] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Pk_EquipSupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[VenueCharacterization]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VenueCharacterization](
	[Pk_VenueCharId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NOT NULL,
	[TypeOfConstruction] [varchar](100) NOT NULL,
	[OpenAreas] [varchar](100) NOT NULL,
	[AView] [varchar](100) NOT NULL,
	[MaxNoRoomsAreas] [varchar](100) NOT NULL,
	[Parking] [varchar](100) NOT NULL,
	[Privacy] [varchar](100) NOT NULL,
	[PagesIn] [varchar](100) NOT NULL,
 CONSTRAINT [PK_VenueCharacterization] PRIMARY KEY CLUSTERED 
(
	[Pk_VenueCharId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[VenueChildrenOption]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VenueChildrenOption](
	[Pk_VenueWaitingRoomOptId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NOT NULL,
	[OptionName] [varchar](50) NOT NULL,
	[OptionValue] [varchar](50) NOT NULL,
	[ImgFileName] [varchar](50) NOT NULL,
	[ImgLocation] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pk_VenueWaitingRoomOptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[VenueContact]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VenueContact](
	[Pk_VenueContactId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NOT NULL,
	[Phone] [varchar](20) NULL,
	[Phone2] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Position] [varchar](50) NULL,
	[ExtManCompanyName] [varchar](50) NULL,
 CONSTRAINT [PK_VenueContact] PRIMARY KEY CLUSTERED 
(
	[Pk_VenueContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[VenueDescription]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VenueDescription](
	[Pk_VenueDesc] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NOT NULL,
	[Description] [text] NOT NULL,
	[DistAdvantage] [text] NOT NULL,
	[DistAdvantageIn] [text] NOT NULL,
 CONSTRAINT [PK_VenueDescription] PRIMARY KEY CLUSTERED 
(
	[Pk_VenueDesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VenueDisabledOption]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VenueDisabledOption](
	[Pk_VenueDisabledOptId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NOT NULL,
	[OptionName] [varchar](50) NOT NULL,
	[OptionValue] [varchar](50) NOT NULL,
	[ImgFileName] [varchar](50) NOT NULL,
	[ImgLocation] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pk_VenueDisabledOptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[VenueEvents]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VenueEvents](
	[Pk_VenueEventId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NOT NULL,
	[Events] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pk_VenueEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[VenueFacility]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VenueFacility](
	[Pk_VenueFacilityId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NOT NULL,
	[OptionName] [varchar](50) NOT NULL,
	[OptionValue] [varchar](50) NOT NULL,
	[ImgFileName] [varchar](50) NOT NULL,
	[ImgLocation] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pk_VenueFacilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[VenueInfo]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VenueInfo](
	[Pk_VenueId] [int] IDENTITY(1,1) NOT NULL,
	[Approved] [bit] NOT NULL,
	[Id] [nvarchar](128) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Type] [varchar](100) NOT NULL,
	[FoundationYr] [varchar](4) NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
	[RenovationYr] [varchar](20) NOT NULL,
	[Area] [varchar](10) NOT NULL,
	[OpenSpace] [varchar](10) NOT NULL,
	[Service] [varchar](100) NOT NULL,
	[SeasonActs] [varchar](50) NOT NULL,
	[Location] [varchar](100) NOT NULL,
	[Settlement] [varchar](100) NOT NULL,
 CONSTRAINT [PK_VenueInfo] PRIMARY KEY CLUSTERED 
(
	[Pk_VenueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[VenueParkingOption]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VenueParkingOption](
	[Pk_VenueParkingOptId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NOT NULL,
	[OptionName] [varchar](50) NOT NULL,
	[OptionValue] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pk_VenueParkingOptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[VenueType]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VenueType](
	[Pk_VenueTypeId] [int] IDENTITY(1,1) NOT NULL,
	[VenueType] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pk_VenueTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[VenueWaitingRoomOption]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VenueWaitingRoomOption](
	[Pk_VenueWaitingRoomOptId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NOT NULL,
	[OptionName] [varchar](50) NOT NULL,
	[OptionValue] [varchar](50) NOT NULL,
	[ImgFileName] [varchar](50) NOT NULL,
	[ImgLocation] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pk_VenueWaitingRoomOptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[WaitingRoomOption]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WaitingRoomOption](
	[Pk_WaitingRoomOptId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Approved] [bit] NULL,
 CONSTRAINT [PK_WaitingRoomOption] PRIMARY KEY CLUSTERED 
(
	[Pk_WaitingRoomOptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[WaitingRoomOptionComment]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WaitingRoomOptionComment](
	[Pk_WaitingRoomOptCommentId] [int] NOT NULL,
	[Fk_VenueId] [int] NOT NULL,
	[Comment] [text] NOT NULL,
 CONSTRAINT [PK_WaitingRoomOptionComment] PRIMARY KEY CLUSTERED 
(
	[Pk_WaitingRoomOptCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WaitingRoomOptionValue]    Script Date: 5/25/2016 7:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WaitingRoomOptionValue](
	[Pk_WaitingRoomOptValId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_WaitingRoomOptId] [int] NOT NULL,
	[Value] [varchar](50) NOT NULL,
 CONSTRAINT [PK_WaitingRoomOptionValue] PRIMARY KEY CLUSTERED 
(
	[Pk_WaitingRoomOptValId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'4134a323-fd0f-4ac3-85fa-19f68244a70d', N'User')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'96f271a7-f116-4ef1-94a0-a23d5ab23d76', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'ec1b809e-bbaa-4969-95b2-9857093bae5c', N'Host')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'782fc72d-145c-4013-8078-3a6835ba9db1', N'ec1b809e-bbaa-4969-95b2-9857093bae5c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9ce5e6e7-aa8f-428f-ba62-d611b0a6e02f', N'96f271a7-f116-4ef1-94a0-a23d5ab23d76')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b8be8661-f868-4ea9-ac13-45aa200690e2', N'4134a323-fd0f-4ac3-85fa-19f68244a70d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bd474cf1-3dbf-48a7-9ba2-af6ff1d7604d', N'ec1b809e-bbaa-4969-95b2-9857093bae5c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'782fc72d-145c-4013-8078-3a6835ba9db1', N'host1@gmail.com', 0, N'AHw0FCC6N31nwFvcLpS0PVHJUyjPwW+fHZXaJ7jyBWXrKTJTuqf6BTII05OOdAeQWQ==', N'c15a15ee-5e97-41fe-b4a7-a5f869220d71', NULL, 0, 0, NULL, 0, 0, N'host1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9ce5e6e7-aa8f-428f-ba62-d611b0a6e02f', N'admin@gmail.com', 1, N'AI4Ao/pCQkQMjPT8XrqRwUecN+ZMAqL4PcJ28pJlca8QbE5q+OhiWlvEoV9qFpkoLg==', N'c29d32e7-5a55-46c2-b9f8-c894ebca3260', NULL, 0, 0, NULL, 0, 0, N'admin@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b8be8661-f868-4ea9-ac13-45aa200690e2', N'renter1@gmail.com', 0, N'AHB0NVa4unzV7wMMSI/BOLxJ3/TTu/gcCbHIIBNGHjaKUkYnDfC34yUnLtpGJnTD4Q==', N'6a7df1d5-5141-4c20-afd7-b878a8a30bb5', NULL, 0, 0, NULL, 0, 0, N'renter1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bd474cf1-3dbf-48a7-9ba2-af6ff1d7604d', N'developer.lorenz@gmail.com', 1, N'AH1z4jQRpQeJeQ3D5kzk442VnlRwu2g+ZXV5aaHkWK3iuZsn16LImyBei0i1ysBAwA==', N'd17b43d7-95ed-4b01-9eed-6d16e13f7179', NULL, 0, 0, NULL, 1, 0, N'developer.lorenz@gmail.com')
SET IDENTITY_INSERT [dbo].[VenueInfo] ON 

INSERT [dbo].[VenueInfo] ([Pk_VenueId], [Approved], [Id], [Name], [Type], [FoundationYr], [RegNo], [RenovationYr], [Area], [OpenSpace], [Service], [SeasonActs], [Location], [Settlement]) VALUES (1, 1, N'bd474cf1-3dbf-48a7-9ba2-af6ff1d7604d', N'DCG Resort', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[VenueInfo] OFF
SET IDENTITY_INSERT [dbo].[VenueType] ON 

INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (1, N'Hotel')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (2, N'Conference Center')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (3, N'Hotel')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (4, N'Meeting Room')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (5, N'Restaurant')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (6, N'Convention Center')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (7, N'Hall')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (8, N'Hall & Garden')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (9, N'Theater')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (10, N'Stadium')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (11, N'Yacht')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (12, N'Rooftop')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (13, N'Ballroom')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (14, N'Garden')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (15, N'University')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (16, N'Mansion')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (17, N'Museum')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (18, N'Loft')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (19, N'Open Space')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (20, N'Outdoors')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (21, N'One-Stop Venue')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (22, N'Catering Hall')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (23, N'Church')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (24, N'Mosque')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (25, N'Synagouge')
SET IDENTITY_INSERT [dbo].[VenueType] OFF
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_VenueInfo_Certificate] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_VenueInfo_Certificate]
GO
ALTER TABLE [dbo].[ChefSpokenLanguage]  WITH CHECK ADD  CONSTRAINT [FK_Chef_ChefSpokenLanguage] FOREIGN KEY([Fk_VenueChefId])
REFERENCES [dbo].[Chef] ([Pk_VenueChefId])
GO
ALTER TABLE [dbo].[ChefSpokenLanguage] CHECK CONSTRAINT [FK_Chef_ChefSpokenLanguage]
GO
ALTER TABLE [dbo].[ChildrenOptionComment]  WITH CHECK ADD  CONSTRAINT [FK_VenueInfo_ChildrenOptionComment] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[ChildrenOptionComment] CHECK CONSTRAINT [FK_VenueInfo_ChildrenOptionComment]
GO
ALTER TABLE [dbo].[ChildrenOptionValue]  WITH CHECK ADD  CONSTRAINT [FK_ChildrenOption_ChildrenOptionValue] FOREIGN KEY([Fk_ChildrenOptId])
REFERENCES [dbo].[ChildrenOption] ([Pk_ChildrenOptId])
GO
ALTER TABLE [dbo].[ChildrenOptionValue] CHECK CONSTRAINT [FK_ChildrenOption_ChildrenOptionValue]
GO
ALTER TABLE [dbo].[DisabledOptionComment]  WITH CHECK ADD  CONSTRAINT [FK_VenueInfo_DisabledOptionComment] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[DisabledOptionComment] CHECK CONSTRAINT [FK_VenueInfo_DisabledOptionComment]
GO
ALTER TABLE [dbo].[DisabledOptionValue]  WITH CHECK ADD  CONSTRAINT [FK_DisabledOption_DisabledOptionValue] FOREIGN KEY([Fk_DisabledOptionId])
REFERENCES [dbo].[DisabledOption] ([Pk_DisabledOptionId])
GO
ALTER TABLE [dbo].[DisabledOptionValue] CHECK CONSTRAINT [FK_DisabledOption_DisabledOptionValue]
GO
ALTER TABLE [dbo].[FacilityOptionValue]  WITH CHECK ADD  CONSTRAINT [FK_FacilityOption_FacilityOptionValue] FOREIGN KEY([Fk_FacilityId])
REFERENCES [dbo].[FacilityOption] ([Pk_FacilityId])
GO
ALTER TABLE [dbo].[FacilityOptionValue] CHECK CONSTRAINT [FK_FacilityOption_FacilityOptionValue]
GO
ALTER TABLE [dbo].[Hall]  WITH CHECK ADD  CONSTRAINT [FK_VenueInfo_Hall] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[Hall] CHECK CONSTRAINT [FK_VenueInfo_Hall]
GO
ALTER TABLE [dbo].[ParkingOptionComment]  WITH CHECK ADD  CONSTRAINT [FK_VenueInfo_ParkingOptionComment] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[ParkingOptionComment] CHECK CONSTRAINT [FK_VenueInfo_ParkingOptionComment]
GO
ALTER TABLE [dbo].[ParkingOptionValue]  WITH CHECK ADD  CONSTRAINT [FK_ParkingOption_ParkingOptionValue] FOREIGN KEY([Fk_ParkingOptId])
REFERENCES [dbo].[ParkingOption] ([Pk_ParkingOptId])
GO
ALTER TABLE [dbo].[ParkingOptionValue] CHECK CONSTRAINT [FK_ParkingOption_ParkingOptionValue]
GO
ALTER TABLE [dbo].[VenueCharacterization]  WITH CHECK ADD  CONSTRAINT [FK_VenueInfo_VenueCharacterization] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[VenueCharacterization] CHECK CONSTRAINT [FK_VenueInfo_VenueCharacterization]
GO
ALTER TABLE [dbo].[VenueChildrenOption]  WITH CHECK ADD  CONSTRAINT [Fk_VenueInfo_VenueChildrenOption] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[VenueChildrenOption] CHECK CONSTRAINT [Fk_VenueInfo_VenueChildrenOption]
GO
ALTER TABLE [dbo].[VenueContact]  WITH CHECK ADD  CONSTRAINT [FK_VenueInfo_VenueContact] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[VenueContact] CHECK CONSTRAINT [FK_VenueInfo_VenueContact]
GO
ALTER TABLE [dbo].[VenueDescription]  WITH CHECK ADD  CONSTRAINT [FK_VenueInfo_VenueDescription] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[VenueDescription] CHECK CONSTRAINT [FK_VenueInfo_VenueDescription]
GO
ALTER TABLE [dbo].[VenueDisabledOption]  WITH CHECK ADD  CONSTRAINT [Fk_VenueInfo_VenueDisabledOption] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[VenueDisabledOption] CHECK CONSTRAINT [Fk_VenueInfo_VenueDisabledOption]
GO
ALTER TABLE [dbo].[VenueEvents]  WITH CHECK ADD  CONSTRAINT [Fk_VenueInfo_VenueEvents] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[VenueEvents] CHECK CONSTRAINT [Fk_VenueInfo_VenueEvents]
GO
ALTER TABLE [dbo].[VenueFacility]  WITH CHECK ADD  CONSTRAINT [FK_VenueInfo_VenueFacility] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[VenueFacility] CHECK CONSTRAINT [FK_VenueInfo_VenueFacility]
GO
ALTER TABLE [dbo].[VenueInfo]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_VenueInfo] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[VenueInfo] CHECK CONSTRAINT [FK_AspNetUsers_VenueInfo]
GO
ALTER TABLE [dbo].[VenueParkingOption]  WITH CHECK ADD  CONSTRAINT [Fk_VenueInfo_VenueParkingOption] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[VenueParkingOption] CHECK CONSTRAINT [Fk_VenueInfo_VenueParkingOption]
GO
ALTER TABLE [dbo].[VenueWaitingRoomOption]  WITH CHECK ADD  CONSTRAINT [Fk_VenueInfo_VenueWaitingRoomOption] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[VenueWaitingRoomOption] CHECK CONSTRAINT [Fk_VenueInfo_VenueWaitingRoomOption]
GO
ALTER TABLE [dbo].[WaitingRoomOptionComment]  WITH CHECK ADD  CONSTRAINT [FK_VenueInfo_WaitingRoomOptionComment] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[WaitingRoomOptionComment] CHECK CONSTRAINT [FK_VenueInfo_WaitingRoomOptionComment]
GO
ALTER TABLE [dbo].[WaitingRoomOptionValue]  WITH CHECK ADD  CONSTRAINT [FK_WaitingRoomOption_WaitingRoomOptionValue] FOREIGN KEY([Fk_WaitingRoomOptId])
REFERENCES [dbo].[WaitingRoomOption] ([Pk_WaitingRoomOptId])
GO
ALTER TABLE [dbo].[WaitingRoomOptionValue] CHECK CONSTRAINT [FK_WaitingRoomOption_WaitingRoomOptionValue]
GO