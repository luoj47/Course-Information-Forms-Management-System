USE [CourseInfoForms]
GO

/****** Object:  Table [dbo].[courses]    Script Date: 12/17/2018 4:39:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[courses](
	[coursePrefix] [nvarchar](50) NOT NULL,
	[catalogNumber] [nvarchar](5) NOT NULL,
	[lastUpdated] [datetime] NOT NULL,
	[institution] [nvarchar](50) NOT NULL,
	[campus] [nvarchar](50) NOT NULL,
	[academicCareer] [nvarchar](50) NOT NULL,
	[academicGroups] [nvarchar](50) NOT NULL,
	[adminUnit] [nvarchar](50) NOT NULL,
	[academicOrg] [nvarchar](50) NOT NULL,
	[effectiveQuarter] [nvarchar](50) NOT NULL,
	[subject] [nvarchar](50) NOT NULL,
	[courseName] [nvarchar](50) NOT NULL,
	[courseDesc] [nvarchar](240) NOT NULL,
	[gradingScheme] [nvarchar](50) NOT NULL,
	[componentsLecture] [bit] NOT NULL,
	[componentsLab] [bit] NOT NULL,
	[componentHoursLecture] [float] NOT NULL,
	[componentHoursLab] [float] NOT NULL,
	[facultyWorkload]  AS ([componentHoursLecture]/(150)+[componentHoursLab]/(200)),
	[units] [int] NOT NULL,
	[faUnits] [int] NOT NULL,
	[courseChallenge] [bit] NOT NULL,
	[repeatableCredit] [bit] NOT NULL,
	[CIP] [float] NOT NULL,
	[attributes] [int] NOT NULL,
	[enrollReq] [nvarchar](500) NOT NULL,
	[courseTopic] [nvarchar](500) NOT NULL,
	[courseFee] [decimal](18, 2) NOT NULL,
	[studentLrnObj] [nvarchar](500) NOT NULL,
	[coreLrnObj] [nvarchar](500) NOT NULL,
	[prgrmSpecOutcomes] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[coursePrefix] ASC,
	[catalogNumber] ASC,
	[lastUpdated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [DF_courses_lastUpdated]  DEFAULT (getdate()) FOR [lastUpdated]
GO


