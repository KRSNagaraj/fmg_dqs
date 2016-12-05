USE [FMG_DQ_Services]
GO
/****** Object:  Table [dbo].[DQ_CALENDAR_DIM]    Script Date: 12/5/2016 3:47:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DQ_CALENDAR_DIM](
	[DATE_KEY] [int] NULL,
	[CAL_MONTH_DAY_NUM] [varchar](50) NULL,
	[CAL_YEAR_DAY_NUM] [varchar](50) NULL,
	[CAL_DAY_DT] [date] NULL,
	[CAL_YEAR_MONTH_NUM] [varchar](50) NULL,
	[CAL_MONTH_STR] [varchar](50) NULL,
	[CAL_MONTH_START_DT] [date] NULL,
	[CAL_MONTH_END_DT] [date] NULL,
	[CAL_MONTH_END_FLAG] [varchar](50) NULL,
	[CAL_YEAR_QTR_NUM] [varchar](50) NULL,
	[CAL_QTR_STR] [varchar](50) NULL,
	[CAL_QTR_START_DT] [date] NULL,
	[CAL_QTR_END_DT] [date] NULL,
	[CAL_QTR_BEGIN_FLAG] [varchar](50) NULL,
	[CAL_QTR_END_FLAG] [varchar](50) NULL,
	[CAL_YEAR_WEEK_NUM] [varchar](50) NULL,
	[CAL_WEEK_STR] [varchar](50) NULL,
	[CAL_WEEK_START_DT] [date] NULL,
	[CAL_WEEK_END_DT] [date] NULL,
	[CAL_YEAR_STR] [varchar](50) NULL,
	[CAL_YEAR_START_DT] [date] NULL,
	[CAL_YEAR_END_DT] [date] NULL,
	[CAL_DAY_OF_WEEK] [varchar](50) NULL,
	[SEASON_TEXT] [varchar](50) NULL,
	[IA_INSERT_DT] [date] NULL,
	[IA_UPDATE_DT] [date] NULL,
	[KEY_ID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DQ_CDE_DIM]    Script Date: 12/5/2016 3:47:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DQ_CDE_DIM](
	[DQ_CDE_KEY] [int] NOT NULL,
	[DQ_CDE_NAME] [varchar](200) NULL,
	[DQ_CDE_DESC] [varchar](200) NULL,
	[DQ_CDE_DATABASE_NAME] [varchar](100) NULL,
	[DQ_CDE_SCHEMA_NAME] [varchar](100) NULL,
	[DQ_CDE_TABLE_NAME] [varchar](100) NULL,
	[DQ_CDE_FIELD_NAME] [varchar](100) NULL,
	[DQ_CDE_CREATE_DTTM] [date] NULL,
	[DQ_CDE_UPDATE_DTTM] [date] NULL,
	[DQ_CDE_CREATE_USER] [varchar](50) NULL,
	[DQ_CDE_UPDATE_USER] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DQ_PACKAGE]    Script Date: 12/5/2016 3:47:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DQ_PACKAGE](
	[DQ_PACKAGE_KEY] [int] IDENTITY(1,1) NOT NULL,
	[PACKAGE_NAME] [varchar](255) NULL,
	[PACKAGE_PATH] [varchar](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[DQ_PACKAGE_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DQ_PROFILE_RUN_FACT]    Script Date: 12/5/2016 3:47:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DQ_PROFILE_RUN_FACT](
	[DQ_PROFILE_RUN_KEY] [int] IDENTITY(1,1) NOT NULL,
	[DQ_CAL_KEY] [int] NULL,
	[DQ_RUN_StartDate] [datetime] NULL,
	[DQ_RUN_EndDate] [datetime] NULL,
	[DQ_RUN_User] [varchar](200) NULL,
	[DQ_RUN_Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DQ_PROFILE_RUN_FACT] PRIMARY KEY CLUSTERED 
(
	[DQ_PROFILE_RUN_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DQ_RULE_CDE_BRIDGE]    Script Date: 12/5/2016 3:47:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DQ_RULE_CDE_BRIDGE](
	[DQ_RULCDE_BRIDGE_KEY] [int] NOT NULL,
	[DQ_RULE_KEY] [int] NULL,
	[DQ_CDE_KEY] [int] NULL,
	[DQ_PACKAGE_KEY] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DQ_RULE_DIM]    Script Date: 12/5/2016 3:47:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DQ_RULE_DIM](
	[DQ_RULE_KEY] [int] IDENTITY(1,1) NOT NULL,
	[DQ_RULE_ID] [varchar](100) NULL,
	[DQ_RULE_NAME] [varchar](200) NULL,
	[DQ_RULE_SHORT_DESC] [varchar](200) NULL,
	[DQ_RULE_LONG_DESC] [varchar](200) NULL,
	[DQ_RULE_EXPRESSION] [varchar](400) NULL,
	[DQ_RULE_EFF_START_DTTM] [date] NULL,
	[DQ_RULE_EFF_END_DTTM] [date] NULL,
	[DQ_RULE_ACTIVE_FLAG] [int] NULL,
	[DQ_RULE_CREATE_DTTM] [date] NULL,
	[DQ_RULE_UPDATE_DTTM] [date] NULL,
	[DQ_RULE_CREATE_USER] [varchar](50) NULL,
	[DQ_RULE_UPDATE_USER] [varchar](50) NULL,
	[DQ_PROFILE_NAME] [varchar](100) NULL,
	[DQ_RULE_DIMENSION_TYPE] [varchar](100) NULL,
	[DQ_PACKAGE_KEY] [int] NULL,
 CONSTRAINT [PK_DQ_RULE_DIM] PRIMARY KEY CLUSTERED 
(
	[DQ_RULE_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DQ_RULE_DIMENSION_TYPE_LKP]    Script Date: 12/5/2016 3:47:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DQ_RULE_DIMENSION_TYPE_LKP](
	[DQ_RULE_ID] [varchar](100) NULL,
	[DQ_RULE_NAME] [varchar](200) NULL,
	[DQ_RULE_DIMENSION_TYPE] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DQ_RULE_EXECUTION_FACT]    Script Date: 12/5/2016 3:47:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DQ_RULE_EXECUTION_FACT](
	[DQ_RULE_EXECUTION_KEY] [int] IDENTITY(1,1) NOT NULL,
	[DQ_RULE_KEY] [int] NULL,
	[DQ_PROFILE_RUN_KEY] [int] NULL,
	[DQ_CAL_KEY] [int] NULL,
	[DQ_EXECUTION_START_DTTM] [datetime] NULL,
	[DQ_EXECUTION_END_DTTM] [datetime] NULL,
	[DQ_RUN_BY] [varchar](100) NULL,
	[DQ_EXEC_STATUS] [varchar](30) NULL,
	[DQ_TOTAL_RECS] [int] NULL,
	[DQ_RECS_PASSED] [int] NULL,
	[DQ_RECS_FAILED] [int] NULL,
	[DQ_PERCENT_PASSED] [int] NULL,
	[DQ_PERCENT_FAILED] [numeric](5, 2) NULL,
	[DQ_RESULT_STATUS] [varchar](30) NULL,
 CONSTRAINT [PK_DQ_RULE_EXECUTION_FACT] PRIMARY KEY CLUSTERED 
(
	[DQ_RULE_EXECUTION_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DQ_RULE_PACKAGE]    Script Date: 12/5/2016 3:47:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DQ_RULE_PACKAGE](
	[DQ_RULE_PACKAGE_KEY] [int] IDENTITY(1,1) NOT NULL,
	[PACKAGE_NAME] [varchar](255) NULL,
	[PACKAGE_PATH] [varchar](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[DQ_RULE_PACKAGE_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DQ_THRESHOLD_DIM]    Script Date: 12/5/2016 3:47:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DQ_THRESHOLD_DIM](
	[DQ_THRESHOLD_KEY] [int] NOT NULL,
	[DQ_THRESHOLD_RULE_ID] [int] NULL,
	[DQ_THRESHOLD_REC_MIN_COUNT] [numeric](18, 0) NULL,
	[DQ_THRESHOLD_REC_MAX_COUNT] [numeric](18, 0) NULL,
	[DQ_THRESHOLD_MIN_PERCENTAGE] [numeric](5, 2) NULL,
	[DQ_THRESHOLD_MAX_PERCENTAGE] [numeric](5, 2) NULL,
	[DQ_THRESHOLD_CREATE_DTTM] [date] NULL,
	[DQ_THRESHOLD_UPDATE_DTTM] [date] NULL,
	[DQ_THRESHOLD_EFF_START_DTTM] [date] NULL,
	[DQ_THRESHOLD_EFF_END_DTTM] [date] NULL,
	[DQ_THRESHOLD_ACTIVE_FLAG] [numeric](18, 0) NULL,
	[DQ_THRESHOLD_CREATE_USER] [varchar](50) NULL,
	[DQ_THRESHOLD_UPDATE_USER] [varchar](50) NULL,
	[DQ_1PERCENT_IMPACT_DOLLAR] [varchar](20) NULL
) ON [PRIMARY]

GO
