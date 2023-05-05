--create database FinalProjectDW

USE [FinalProjectDW]
GO

CREATE TABLE [dbo].[AnaemiaDW](
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


CREATE TABLE [dbo].[DiagnosisDW](
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


CREATE TABLE [dbo].[HabbitDW](
	[HabbitID] [int] primary key,
	[HabbitName] [varchar](50) NULL,
	[SMOKING] [bit] NULL,
	[ALCOHO] [bit] NULL
)
GO

CREATE TABLE [dbo].[PersonalHealthDW](
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

CREATE TABLE [dbo].[PersonDW](
	[AGE] [int] NULL,
	[GENDER] [nvarchar](255) NULL,
	[RURAL] [nvarchar](255) NULL,
	[PersonID] [int] primary key,
)
GO


CREATE TABLE [dbo].[AdmissionTimeDW](
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

CREATE TABLE [dbo].[AdmissionReportFact](
	[SNO] [int] primary key,
	[MRD No#] [int],
	[TimeID] [int] references AdmissionTimeDW(TimeID),
	[PersonID] [int] references PersonDW(PersonID) ,
	[HealthID] [int] references PersonalHealthDW(HealthID),
	[AmneID] [int] references AnaemiaDW(AmneID),
	[HabbitID] [int] references HabbitDW(HabbitID)
)
GO
CREATE TABLE [dbo].[DeathPersonDW](
	[AGE] [int] NULL,
	[GENDER] [nvarchar](255) NULL,
	[RURAL] [nvarchar](255) NULL,
	[DeathPersonID] [int] primary key,
)
GO
CREATE TABLE [dbo].[DeathReportFact](
	[SNO] [int] primary key,
	[MRD No#] [int],
	[DeathTime] [datetime],
	[DeathPersonID] [int] references DeathPersonDW(DeathPersonID) 
)

GO
CREATE TABLE [dbo].[DiagnosisReportFact](
	[SNO] [int] primary key,
	[MRD No#] [int],
	[TimeID] [int] references AdmissionTimeDW(TimeID),
	[PersonID] [int] references PersonDW(PersonID) ,
	[AmneID] [int] references AnaemiaDW(AmneID),
	[DiagnosisID] [int] references DiagnosisDW(DiagID)
)
