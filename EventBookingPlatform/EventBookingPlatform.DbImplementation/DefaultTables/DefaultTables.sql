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
CREATE TABLE [dbo].[VenueCertificate](
	[Pk_CertificateId] [int] IDENTITY(1,1) NOT NULL,
	[Fk_VenueId] [int] NOT NULL,
	[BusinessCert] [varchar](MAX) NULL,
	[BusinessCertStatus] [bit] NOT NULL,
	[TermsConditionsCert] [varchar](MAX) NULL,
	[TermsConditionsCertStatus] [bit] NOT NULL,
	[BusinessLicCert] [varchar](MAX) NULL,
	[BusinessLicCertStatus] [bit] NOT NULL,
	[PoliceAuthCert] [varchar](MAX) NULL,
	[PoliceAuthCertStatus] [bit] NOT NULL,
	[FireDeptCert] [varchar](MAX) NULL,
	[FireDeptCertStatus] [bit] NOT NULL,
	[SanitationCert] [varchar](MAX) NULL,
	[SanitationCertStatus] [bit] NOT NULL,
	[ThirdPtInsuranceCert] [varchar](MAX) NULL,
	[ThirdPtInsuranceCertStatus] [bit] NOT NULL,
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
	[OptionName] [varchar](200) NOT NULL,
	[OptionValue] [varchar](MAX) NOT NULL,
	[OptionImageLocation] [varchar](100) NOT NULL,
	[OptionSize] [int] NOT NULL,
	[OpenAreasImage] [varchar](MAX) NOT NULL
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
	[Id] [nvarchar](128) NOT NULL,
	[Status] [int] NOT NULL, -- 1 - Approved, 2 - Deny, 3 - Suspend
	[Name] [varchar](100) NOT NULL,
	[Type] [varchar](100) NOT NULL,
	[FoundationYr] [varchar](4) NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
	[RenovationYr] [varchar](20) NOT NULL,
	[Area] [varchar](10) NOT NULL,
	[OpenSpace] [varchar](10) NOT NULL,
	[Service] [varchar](100) NOT NULL,
	[SeasonActs] [varchar](50) NOT NULL,
	[Country] [varchar](100) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[Street] [varchar](100) NOT NULL,
	[ZipCode] [varchar](5) NOT NULL
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
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e43b4071-fc52-47e5-97ad-4bdb9ce100b7', N'ec1b809e-bbaa-4969-95b2-9857093bae5c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'782fc72d-145c-4013-8078-3a6835ba9db1', N'host1@gmail.com', 0, N'AHw0FCC6N31nwFvcLpS0PVHJUyjPwW+fHZXaJ7jyBWXrKTJTuqf6BTII05OOdAeQWQ==', N'c15a15ee-5e97-41fe-b4a7-a5f869220d71', NULL, 0, 0, NULL, 0, 0, N'host1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9ce5e6e7-aa8f-428f-ba62-d611b0a6e02f', N'admin@gmail.com', 1, N'AI4Ao/pCQkQMjPT8XrqRwUecN+ZMAqL4PcJ28pJlca8QbE5q+OhiWlvEoV9qFpkoLg==', N'c29d32e7-5a55-46c2-b9f8-c894ebca3260', NULL, 0, 0, NULL, 0, 0, N'admin@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b8be8661-f868-4ea9-ac13-45aa200690e2', N'renter1@gmail.com', 0, N'AHB0NVa4unzV7wMMSI/BOLxJ3/TTu/gcCbHIIBNGHjaKUkYnDfC34yUnLtpGJnTD4Q==', N'6a7df1d5-5141-4c20-afd7-b878a8a30bb5', NULL, 0, 0, NULL, 0, 0, N'renter1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e43b4071-fc52-47e5-97ad-4bdb9ce100b7', N'developer.lorenz@gmail.com', 1, N'AHcuif2wkbUSzRh5+6F9nZFCR/VADb/0SeC/W9HeoDNk/AtSevj21i98Yd+kZeyzVw==', N'0a3a384d-5c29-47a1-8371-dc4ac9881a8f', NULL, 0, 0, NULL, 0, 0, N'developer.lorenz@gmail.com')

SET IDENTITY_INSERT [dbo].[VenueType] ON 

INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (1, N'Hotel')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (2, N'Conference Center')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (3, N'Meeting Room')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (4, N'Restaurant')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (5, N'Convention Center')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (6, N'Hall')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (7, N'Hall & Garden')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (8, N'Theater')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (9, N'Stadium')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (10, N'Yacht')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (11, N'Rooftop')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (12, N'Ballroom')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (13, N'Garden')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (14, N'University')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (15, N'Mansion')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (16, N'Museum')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (17, N'Loft')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (18, N'Open Space')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (19, N'Outdoors')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (20, N'One-Stop Venue')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (21, N'Catering Hall')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (22, N'Church')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (23, N'Mosque')
INSERT [dbo].[VenueType] ([Pk_VenueTypeId], [VenueType]) VALUES (24, N'Synagouge')
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
ALTER TABLE [dbo].[VenueCertificate]  WITH CHECK ADD  CONSTRAINT [FK_VenueInfo_VenueCertificate] FOREIGN KEY([Fk_VenueId])
REFERENCES [dbo].[VenueInfo] ([Pk_VenueId])
GO
ALTER TABLE [dbo].[VenueCertificate] CHECK CONSTRAINT [FK_VenueInfo_VenueCertificate]
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

-- Create table "country"
CREATE TABLE [dbo].[Country](
	[Pk_CountryId] [int] IDENTITY(1,1) NOT NULL,
	[cc_fips] nvarchar(2) NOT NULL,
	[cc_iso] nvarchar(2) NOT NULL,
	[tld] nvarchar(3) NOT NULL,
	[country_name] nvarchar(100) NOT NULL,
	CONSTRAINT [PK_CountryId] PRIMARY KEY CLUSTERED 
(
	[Pk_CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Insert country data
INSERT INTO [dbo].[Country] VALUES
	('AA', 'AW', '.aw', 'Aruba'),
	('AC', 'AG', '.ag', 'Antigua and Barbuda'),
	('AE', 'AE', '.ae', 'United Arab Emirates'),
	('AF', 'AF', '.af', 'Afghanistan'),
	('AG', 'DZ', '.dz', 'Algeria'),
	('AJ', 'AZ', '.az', 'Azerbaijan'),
	('AL', 'AL', '.al', 'Albania'),
	('AM', 'AM', '.am', 'Armenia'),
	('AN', 'AD', '.ad', 'Andorra'),
	('AO', 'AO', '.ao', 'Angola'),
	('AQ', 'AS', '.as', 'American Samoa'),
	('AR', 'AR', '.ar', 'Argentina'),
	('AS', 'AU', '.au', 'Australia'),
	('AT', '-', '-', 'Ashmore and Cartier Islands'),
	('AU', 'AT', '.at', 'Austria'),
	('AV', 'AI', '.ai', 'Anguilla'),
	('AX', 'AX', '.ax', 'Åland Islands'),
	('AY', 'AQ', '.aq', 'Antarctica'),
	('BA', 'BH', '.bh', 'Bahrain'),
	('BB', 'BB', '.bb', 'Barbados'),
	('BC', 'BW', '.bw', 'Botswana'),
	('BD', 'BM', '.bm', 'Bermuda'),
	('BE', 'BE', '.be', 'Belgium'),
	('BF', 'BS', '.bs', 'Bahamas, The'),
	('BG', 'BD', '.bd', 'Bangladesh'),
	('BH', 'BZ', '.bz', 'Belize'),
	('BK', 'BA', '.ba', 'Bosnia and Herzegovina'),
	('BL', 'BO', '.bo', 'Bolivia'),
	('BM', 'MM', '.mm', 'Myanmar'),
	('BN', 'BJ', '.bj', 'Benin'),
	('BO', 'BY', '.by', 'Belarus'),
	('BP', 'SB', '.sb', 'Solomon Islands'),
	('BQ', '-', '-', 'Navassa Island'),
	('BR', 'BR', '.br', 'Brazil'),
	('BS', '-', '-', 'Bassas da India'),
	('BT', 'BT', '.bt', 'Bhutan'),
	('BU', 'BG', '.bg', 'Bulgaria'),
	('BV', 'BV', '.bv', 'Bouvet Island'),
	('BX', 'BN', '.bn', 'Brunei'),
	('BY', 'BI', '.bi', 'Burundi'),
	('CA', 'CA', '.ca', 'Canada'),
	('CB', 'KH', '.kh', 'Cambodia'),
	('CD', 'TD', '.td', 'Chad'),
	('CE', 'LK', '.lk', 'Sri Lanka'),
	('CF', 'CG', '.cg', 'Congo, Republic of the'),
	('CG', 'CD', '.cd', 'Congo, Democratic Republic of the'),
	('CH', 'CN', '.cn', 'China'),
	('CI', 'CL', '.cl', 'Chile'),
	('CJ', 'KY', '.ky', 'Cayman Islands'),
	('CK', 'CC', '.cc', 'Cocos (Keeling) Islands'),
	('CM', 'CM', '.cm', 'Cameroon'),
	('CN', 'KM', '.km', 'Comoros'),
	('CO', 'CO', '.co', 'Colombia'),
	('CQ', 'MP', '.mp', 'Northern Mariana Islands'),
	('CR', '-', '-', 'Coral Sea Islands'),
	('CS', 'CR', '.cr', 'Costa Rica'),
	('CT', 'CF', '.cf', 'Central African Republic'),
	('CU', 'CU', '.cu', 'Cuba'),
	('CV', 'CV', '.cv', 'Cape Verde'),
	('CW', 'CK', '.ck', 'Cook Islands'),
	('CY', 'CY', '.cy', 'Cyprus'),
	('DA', 'DK', '.dk', 'Denmark'),
	('DJ', 'DJ', '.dj', 'Djibouti'),
	('DO', 'DM', '.dm', 'Dominica'),
	('DQ', 'UM', '-', 'Jarvis Island'),
	('DR', 'DO', '.do', 'Dominican Republic'),
	('DX', '-', '-', 'Dhekelia Sovereign Base Area'),
	('EC', 'EC', '.ec', 'Ecuador'),
	('EG', 'EG', '.eg', 'Egypt'),
	('EI', 'IE', '.ie', 'Ireland'),
	('EK', 'GQ', '.gq', 'Equatorial Guinea'),
	('EN', 'EE', '.ee', 'Estonia'),
	('ER', 'ER', '.er', 'Eritrea'),
	('ES', 'SV', '.sv', 'El Salvador'),
	('ET', 'ET', '.et', 'Ethiopia'),
	('EU', '-', '-', 'Europa Island'),
	('EZ', 'CZ', '.cz', 'Czech Republic'),
	('FG', 'GF', '.gf', 'French Guiana'),
	('FI', 'FI', '.fi', 'Finland'),
	('FJ', 'FJ', '.fj', 'Fiji'),
	('FK', 'FK', '.fk', 'Falkland Islands (Islas Malvinas)'),
	('FM', 'FM', '.fm', 'Micronesia, Federated States of'),
	('FO', 'FO', '.fo', 'Faroe Islands'),
	('FP', 'PF', '.pf', 'French Polynesia'),
	('FQ', 'UM', '-', 'Baker Island'),
	('FR', 'FR', '.fr', 'France'),
	('FS', 'TF', '.tf', 'French Southern and Antarctic Lands'),
	('GA', 'GM', '.gm', 'Gambia, The'),
	('GB', 'GA', '.ga', 'Gabon'),
	('GG', 'GE', '.ge', 'Georgia'),
	('GH', 'GH', '.gh', 'Ghana'),
	('GI', 'GI', '.gi', 'Gibraltar'),
	('GJ', 'GD', '.gd', 'Grenada'),
	('GK', '-', '.gg', 'Guernsey'),
	('GL', 'GL', '.gl', 'Greenland'),
	('GM', 'DE', '.de', 'Germany'),
	('GO', '-', '-', 'Glorioso Islands'),
	('GP', 'GP', '.gp', 'Guadeloupe'),
	('GQ', 'GU', '.gu', 'Guam'),
	('GR', 'GR', '.gr', 'Greece'),
	('GT', 'GT', '.gt', 'Guatemala'),
	('GV', 'GN', '.gn', 'Guinea'),
	('GY', 'GY', '.gy', 'Guyana'),
	('GZ', '-', '-', 'Gaza Strip'),
	('HA', 'HT', '.ht', 'Haiti'),
	('HK', 'HK', '.hk', 'Hong Kong'),
	('HM', 'HM', '.hm', 'Heard Island and McDonald Islands'),
	('HO', 'HN', '.hn', 'Honduras'),
	('HQ', 'UM', '-', 'Howland Island'),
	('HR', 'HR', '.hr', 'Croatia'),
	('HU', 'HU', '.hu', 'Hungary'),
	('IC', 'IS', '.is', 'Iceland'),
	('ID', 'ID', '.id', 'Indonesia'),
	('IM', 'IM', '.im', 'Isle of Man'),
	('IN', 'IN', '.in', 'India'),
	('IO', 'IO', '.io', 'British Indian Ocean Territory'),
	('IP', '-', '-', 'Clipperton Island'),
	('IR', 'IR', '.ir', 'Iran'),
	('IS', 'IL', '.il', 'Israel'),
	('IT', 'IT', '.it', 'Italy'),
	('IV', 'CI', '.ci', 'Cote d''Ivoire'),
	('IZ', 'IQ', '.iq', 'Iraq'),
	('JA', 'JP', '.jp', 'Japan'),
	('JE', 'JE', '.je', 'Jersey'),
	('JM', 'JM', '.jm', 'Jamaica'),
	('JN', 'SJ', '-', 'Jan Mayen'),
	('JO', 'JO', '.jo', 'Jordan'),
	('JQ', 'UM', '-', 'Johnston Atoll'),
	('JU', '-', '-', 'Juan de Nova Island'),
	('KE', 'KE', '.ke', 'Kenya'),
	('KG', 'KG', '.kg', 'Kyrgyzstan'),
	('KN', 'KP', '.kp', 'Korea, North'),
	('KQ', 'UM', '-', 'Kingman Reef'),
	('KR', 'KI', '.ki', 'Kiribati'),
	('KS', 'KR', '.kr', 'Korea, South'),
	('KT', 'CX', '.cx', 'Christmas Island'),
	('KU', 'KW', '.kw', 'Kuwait'),
	('KV', 'KV', '-', 'Kosovo'),
	('KZ', 'KZ', '.kz', 'Kazakhstan'),
	('LA', 'LA', '.la', 'Laos'),
	('LE', 'LB', '.lb', 'Lebanon'),
	('LG', 'LV', '.lv', 'Latvia'),
	('LH', 'LT', '.lt', 'Lithuania'),
	('LI', 'LR', '.lr', 'Liberia'),
	('LO', 'SK', '.sk', 'Slovakia'),
	('LQ', 'UM', '-', 'Palmyra Atoll'),
	('LS', 'LI', '.li', 'Liechtenstein'),
	('LT', 'LS', '.ls', 'Lesotho'),
	('LU', 'LU', '.lu', 'Luxembourg'),
	('LY', 'LY', '.ly', 'Libyan Arab'),
	('MA', 'MG', '.mg', 'Madagascar'),
	('MB', 'MQ', '.mq', 'Martinique'),
	('MC', 'MO', '.mo', 'Macau'),
	('MD', 'MD', '.md', 'Moldova, Republic of'),
	('MF', 'YT', '.yt', 'Mayotte'),
	('MG', 'MN', '.mn', 'Mongolia'),
	('MH', 'MS', '.ms', 'Montserrat'),
	('MI', 'MW', '.mw', 'Malawi'),
	('MJ', 'ME', '.me', 'Montenegro'),
	('MK', 'MK', '.mk', 'The Former Yugoslav Republic of Macedonia'),
	('ML', 'ML', '.ml', 'Mali'),
	('MN', 'MC', '.mc', 'Monaco'),
	('MO', 'MA', '.ma', 'Morocco'),
	('MP', 'MU', '.mu', 'Mauritius'),
	('MQ', 'UM', '-', 'Midway Islands'),
	('MR', 'MR', '.mr', 'Mauritania'),
	('MT', 'MT', '.mt', 'Malta'),
	('MU', 'OM', '.om', 'Oman'),
	('MV', 'MV', '.mv', 'Maldives'),
	('MX', 'MX', '.mx', 'Mexico'),
	('MY', 'MY', '.my', 'Malaysia'),
	('MZ', 'MZ', '.mz', 'Mozambique'),
	('NC', 'NC', '.nc', 'New Caledonia'),
	('NE', 'NU', '.nu', 'Niue'),
	('NF', 'NF', '.nf', 'Norfolk Island'),
	('NG', 'NE', '.ne', 'Niger'),
	('NH', 'VU', '.vu', 'Vanuatu'),
	('NI', 'NG', '.ng', 'Nigeria'),
	('NL', 'NL', '.nl', 'Netherlands'),
	('NM', '', '', 'No Man''s Land'),
	('NO', 'NO', '.no', 'Norway'),
	('NP', 'NP', '.np', 'Nepal'),
	('NR', 'NR', '.nr', 'Nauru'),
	('NS', 'SR', '.sr', 'Suriname'),
	('NT', 'AN', '.an', 'Netherlands Antilles'),
	('NU', 'NI', '.ni', 'Nicaragua'),
	('NZ', 'NZ', '.nz', 'New Zealand'),
	('PA', 'PY', '.py', 'Paraguay'),
	('PC', 'PN', '.pn', 'Pitcairn Islands'),
	('PE', 'PE', '.pe', 'Peru'),
	('PF', '-', '-', 'Paracel Islands'),
	('PG', '-', '-', 'Spratly Islands'),
	('PK', 'PK', '.pk', 'Pakistan'),
	('PL', 'PL', '.pl', 'Poland'),
	('PM', 'PA', '.pa', 'Panama'),
	('PO', 'PT', '.pt', 'Portugal'),
	('PP', 'PG', '.pg', 'Papua New Guinea'),
	('PS', 'PW', '.pw', 'Palau'),
	('PU', 'GW', '.gw', 'Guinea-Bissau'),
	('QA', 'QA', '.qa', 'Qatar'),
	('RE', 'RE', '.re', 'Reunion'),
	('RI', 'RS', '.rs', 'Serbia'),
	('RM', 'MH', '.mh', 'Marshall Islands'),
	('RN', 'MF', '-', 'Saint Martin'),
	('RO', 'RO', '.ro', 'Romania'),
	('RP', 'PH', '.ph', 'Philippines'),
	('RQ', 'PR', '.pr', 'Puerto Rico'),
	('RS', 'RU', '.ru', 'Russia'),
	('RW', 'RW', '.rw', 'Rwanda'),
	('SA', 'SA', '.sa', 'Saudi Arabia'),
	('SB', 'PM', '.pm', 'Saint Pierre and Miquelon'),
	('SC', 'KN', '.kn', 'Saint Kitts and Nevis'),
	('SE', 'SC', '.sc', 'Seychelles'),
	('SF', 'ZA', '.za', 'South Africa'),
	('SG', 'SN', '.sn', 'Senegal'),
	('SH', 'SH', '.sh', 'Saint Helena'),
	('SI', 'SI', '.si', 'Slovenia'),
	('SL', 'SL', '.sl', 'Sierra Leone'),
	('SM', 'SM', '.sm', 'San Marino'),
	('SN', 'SG', '.sg', 'Singapore'),
	('SO', 'SO', '.so', 'Somalia'),
	('SP', 'ES', '.es', 'Spain'),
	('ST', 'LC', '.lc', 'Saint Lucia'),
	('SU', 'SD', '.sd', 'Sudan'),
	('SV', 'SJ', '.sj', 'Svalbard'),
	('SW', 'SE', '.se', 'Sweden'),
	('SX', 'GS', '.gs', 'South Georgia and the Islands'),
	('SY', 'SY', '.sy', 'Syrian Arab Republic'),
	('SZ', 'CH', '.ch', 'Switzerland'),
	('TD', 'TT', '.tt', 'Trinidad and Tobago'),
	('TE', '-', '-', 'Tromelin Island'),
	('TH', 'TH', '.th', 'Thailand'),
	('TI', 'TJ', '.tj', 'Tajikistan'),
	('TK', 'TC', '.tc', 'Turks and Caicos Islands'),
	('TL', 'TK', '.tk', 'Tokelau'),
	('TN', 'TO', '.to', 'Tonga'),
	('TO', 'TG', '.tg', 'Togo'),
	('TP', 'ST', '.st', 'Sao Tome and Principe'),
	('TS', 'TN', '.tn', 'Tunisia'),
	('TT', 'TL', '.tl', 'East Timor'),
	('TU', 'TR', '.tr', 'Turkey'),
	('TV', 'TV', '.tv', 'Tuvalu'),
	('TW', 'TW', '.tw', 'Taiwan'),
	('TX', 'TM', '.tm', 'Turkmenistan'),
	('TZ', 'TZ', '.tz', 'Tanzania, United Republic of'),
	('UG', 'UG', '.ug', 'Uganda'),
	('UK', 'GB', '.uk', 'United Kingdom'),
	('UP', 'UA', '.ua', 'Ukraine'),
	('US', 'US', '.us', 'United States'),
	('UV', 'BF', '.bf', 'Burkina Faso'),
	('UY', 'UY', '.uy', 'Uruguay'),
	('UZ', 'UZ', '.uz', 'Uzbekistan'),
	('VC', 'VC', '.vc', 'Saint Vincent and the Grenadines'),
	('VE', 'VE', '.ve', 'Venezuela'),
	('VI', 'VG', '.vg', 'British Virgin Islands'),
	('VM', 'VN', '.vn', 'Vietnam'),
	('VQ', 'VI', '.vi', 'Virgin Islands (US)'),
	('VT', 'VA', '.va', 'Holy See (Vatican City)'),
	('WA', 'NA', '.na', 'Namibia'),
	('WE', '-', '-', 'West Bank'),
	('WF', 'WF', '.wf', 'Wallis and Futuna'),
	('WI', 'EH', '.eh', 'Western Sahara'),
	('WQ', 'UM', '-', 'Wake Island'),
	('WS', 'WS', '.ws', 'Samoa'),
	('WZ', 'SZ', '.sz', 'Swaziland'),
	('YI', 'CS', '.yu', 'Serbia and Montenegro'),
	('YM', 'YE', '.ye', 'Yemen'),
	('ZA', 'ZM', '.zm', 'Zambia'),
	('ZI', 'ZW', '.zw', 'Zimbabwe');
GO

-- Insert Private Events
INSERT INTO PrivateEvents VALUES
	('Birthday Parties'),
	('Theme Parties'),
	('Holiday Parties'),
	('Anniversaries'),
	('Retirements'),
	('Sweet Sixteen'),
	('Family Reunions'),
	('Fundraisers'),
	('Bachelor/Bachelorette Parties'),
	('Bridal Showers'),
	('Baby Showers'),
	('Cocktail Parties'),
	('Casino Party'),
	('Weddings'),
	('Sleep Overs'),
	('Pool Parties'),
	('Bar mizvah party'),
	('Brit'),
	('Henna'),
	('other');
GO

-- Insert Business/Corporate Events
INSERT INTO BusinessEvents VALUES
	('Conferences'),
	('Seminars'),
	('Team Building'),
	('Trade Show'),
	('Business Dinner'),
	('Golf'),
	('Press Conference'),
	('Networking Event'),
	('Incentive Travel'),
	('Opening Ceremony'),
	('Product Launch'),
	('Theme Party'),
	('VIP Events'),
	('Trade Fair'),
	('Shareholder Meeting'),
	('Award Ceremony'),
	('Incentive Event'),
	('Board Meeting'),
	('Executive Retreat');
GO