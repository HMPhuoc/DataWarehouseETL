create database FinalProject

USE [FinalProject]
GO
/****** Object:  Table [dbo].[AnamDim]    Script Date: 25-Apr-23 5:23:28 PM ******/
CREATE TABLE [dbo].[AnaemiaData](
	[RAISED CARDIAC ENZYMES] [bit] NULL,
	[SEVERE ANAEMIA] [bit] NULL,
	[ANAEMIA] [bit] NULL,
	[DM] [bit] NULL,
	[CAD] [bit] NULL,
	[HTN] [bit] NULL,
	[PRIOR CMP] [bit] NULL,
	[CKD] [bit] NULL,
	[AmneID] [int] primary key,
)
GO
/****** Object:  Table [dbo].[DiagDim]    Script Date: 25-Apr-23 5:23:28 PM ******/

CREATE TABLE [dbo].[DiagnosisData](
	[STABLE ANGINA] [bit] NULL,
	[ACS] [bit] NULL,
	[STEMI] [bit] NULL,
	[ATYPICAL CHEST PAIN] [bit] NULL,
	[HEART FAILURE] [bit] NULL,
	[HFREF] [bit] NULL,
	[HFNEF] [bit] NULL,
	[VALVULAR] [bit] NULL,
	[CHB] [bit] NULL,
	[SSS] [bit] NULL,
	[AKI] [bit] NULL,
	[CVA INFRACT] [bit] NULL,
	[CVA BLEED] [bit] NULL,
	[AF] [bit] NULL,
	[VT] [bit] NULL,
	[PSVT] [bit] NULL,
	[CONGENITAL] [bit] NULL,
	[UTI] [bit] NULL,
	[NEURO CARDIOGENIC SYNCOPE] [bit] NULL,
	[ORTHOSTATIC] [bit] NULL,
	[INFECTIVE ENDOCARDITIS] [bit] NULL,
	[DVT] [bit] NULL,
	[CARDIOGENIC SHOCK] [bit] NULL,
	[SHOCK] [bit] NULL,
	[PULMONARY EMBOLISM] [bit] NULL,
	[CHEST INFECTION] [bit] NULL,
	[DiagID] [int] primary key,
)
GO
/****** Object:  Table [dbo].[HabbitDim]    Script Date: 25-Apr-23 5:23:28 PM ******/

CREATE TABLE [dbo].[HabbitData](
	[HabbitID] [int] primary key,
	[HabbitName] [varchar](50) NULL,
	[SMOKING] [bit] NULL,
	[ALCOHO] [bit] NULL
)
GO
/****** Object:  Table [dbo].[PersonalHealthDim] 
							  PersonalHealthDim    Script Date: 25-Apr-23 5:23:28 PM ******/
CREATE TABLE [dbo].[PersonalHealthData](
	[HB] decimal(7,2) NULL,
	[TLC] decimal(7,2) NULL,
	[PLATELETS] decimal(7,2) NULL,
	[GLUCOSE] decimal(7,2) NULL,
	[UREA] decimal(7,2) NULL,
	[CREATININE] decimal(7,2) NULL,
	[BNP] integer NULL,
	[EF] integer NULL,
	[HealthID] [int] primary key,
)
GO
/****** Object:  Table [dbo].[PersonDim]    Script Date: 25-Apr-23 5:23:28 PM ******/
CREATE TABLE [dbo].[PersonData](
	[AGE] [int] NULL,
	[GENDER] [nvarchar](255) NULL,
	[RURAL] [nvarchar](255) NULL,
	[PersonID] [int] primary key,
)
GO
/****** Object:  Table [dbo].[TimeDim]    Script Date: 25-Apr-23 5:23:28 PM ******/

CREATE TABLE [dbo].[AdmissionTimeData](
	[DischargeDay] [int] NULL,
	[DischargeMonth] [int] NULL,
	[DischargeQuarter] [int] NULL,
	[DischargeYear] [int] NULL,
	[AdmissionDay] [int] NULL,
	[AdmissionMonth] [int] NULL,
	[AdmissionQuarter] [int] NULL,
	[AdmissionYear] [int] NULL,
	[TimeID] [int] primary key,
)
GO

CREATE TABLE [dbo].[AdmissionReport](
	[SNO] [int] primary key,
	[MRD No#] [int],
	[TimeID] [int],
	[PersonID] [int],
	[HealthID] [int],
	[AmneID] [int],
	[HabbitID] [int]
)
GO
CREATE TABLE [dbo].[DeathPersonData](
	[AGE] [int] NULL,
	[GENDER] [nvarchar](255) NULL,
	[RURAL] [nvarchar](255) NULL,
	[DeathPersonID] [int] primary key,
)
GO
CREATE TABLE [dbo].[DeathReport](
	[SNO] [int] primary key,
	[MRD No#] [int],
	[DeathTime] [datetime],
	[DeathPersonID] [int] references DeathPersonData(DeathPersonID)
)

GO
CREATE TABLE [dbo].[DiagnosisReport](
	[SNO] [int] primary key,
	[MRD No#] [int],
	[TimeID] [int] references AdmissionTimeData(TimeID),
	[PersonID] [int] references PersonData(PersonID) ,
	[AmneID] [int] references AnaemiaData(AmneID),
	[DiagnosisID] [int]
)
