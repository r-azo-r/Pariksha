/****** Object:  ForeignKey [FK__questionBri__qid__37A5467C]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionBri__qid__37A5467C]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionBrief]'))
ALTER TABLE [dbo].[questionBrief] DROP CONSTRAINT [FK__questionBri__qid__37A5467C]
GO
/****** Object:  ForeignKey [FK__questionCho__qid__3B75D760]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionCho__qid__3B75D760]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionChoice]'))
ALTER TABLE [dbo].[questionChoice] DROP CONSTRAINT [FK__questionCho__qid__3B75D760]
GO
/****** Object:  ForeignKey [FK__questionCus__qid__3C69FB99]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionCus__qid__3C69FB99]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionCustom]'))
ALTER TABLE [dbo].[questionCustom] DROP CONSTRAINT [FK__questionCus__qid__3C69FB99]
GO
/****** Object:  ForeignKey [FK__questionD__creat__300424B4]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionD__creat__300424B4]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor] DROP CONSTRAINT [FK__questionD__creat__300424B4]
GO
/****** Object:  ForeignKey [FK__questionD__quest__30F848ED]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionD__quest__30F848ED]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor] DROP CONSTRAINT [FK__questionD__quest__30F848ED]
GO
/****** Object:  ForeignKey [FK__questionD__stand__31EC6D26]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionD__stand__31EC6D26]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor] DROP CONSTRAINT [FK__questionD__stand__31EC6D26]
GO
/****** Object:  ForeignKey [FK__questionDes__sid__0AD2A005]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionDes__sid__0AD2A005]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor] DROP CONSTRAINT [FK__questionDes__sid__0AD2A005]
GO
/****** Object:  ForeignKey [FK__questionFil__qid__398D8EEE]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionFil__qid__398D8EEE]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionFill]'))
ALTER TABLE [dbo].[questionFill] DROP CONSTRAINT [FK__questionFil__qid__398D8EEE]
GO
/****** Object:  ForeignKey [FK__questionMat__qid__3A81B327]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionMat__qid__3A81B327]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionMatch]'))
ALTER TABLE [dbo].[questionMatch] DROP CONSTRAINT [FK__questionMat__qid__3A81B327]
GO
/****** Object:  ForeignKey [FK_subject_standard]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_subject_standard]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject]'))
ALTER TABLE [dbo].[subject] DROP CONSTRAINT [FK_subject_standard]
GO
/****** Object:  ForeignKey [FK__test__creator__34C8D9D1]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__test__creator__34C8D9D1]') AND parent_object_id = OBJECT_ID(N'[dbo].[test]'))
ALTER TABLE [dbo].[test] DROP CONSTRAINT [FK__test__creator__34C8D9D1]
GO
/****** Object:  ForeignKey [FK__test_ques__testi__35BCFE0A]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__test_ques__testi__35BCFE0A]') AND parent_object_id = OBJECT_ID(N'[dbo].[test_question]'))
ALTER TABLE [dbo].[test_question] DROP CONSTRAINT [FK__test_ques__testi__35BCFE0A]
GO
/****** Object:  ForeignKey [FK__test_questi__qid__36B12243]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__test_questi__qid__36B12243]') AND parent_object_id = OBJECT_ID(N'[dbo].[test_question]'))
ALTER TABLE [dbo].[test_question] DROP CONSTRAINT [FK__test_questi__qid__36B12243]
GO
/****** Object:  Check [CK__questionB__short__38996AB5]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__questionB__short__38996AB5]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionBrief]'))
BEGIN
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__questionB__short__38996AB5]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionBrief]'))
ALTER TABLE [dbo].[questionBrief] DROP CONSTRAINT [CK__questionB__short__38996AB5]

END
GO
/****** Object:  Check [CK__questionD__ratin__33D4B598]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__questionD__ratin__33D4B598]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
BEGIN
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__questionD__ratin__33D4B598]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor] DROP CONSTRAINT [CK__questionD__ratin__33D4B598]

END
GO
/****** Object:  StoredProcedure [dbo].[setActive]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[setActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[setActive]
GO
/****** Object:  StoredProcedure [dbo].[deleteUser]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[deleteUser]
GO
/****** Object:  StoredProcedure [dbo].[changePassword]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[changePassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[changePassword]
GO
/****** Object:  StoredProcedure [dbo].[checkUser]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[checkUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[checkUser]
GO
/****** Object:  StoredProcedure [dbo].[createUser]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[createUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[createUser]
GO
/****** Object:  StoredProcedure [dbo].[loginUser]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[loginUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[loginUser]
GO
/****** Object:  StoredProcedure [dbo].[getStandardID]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getStandardID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getStandardID]
GO
/****** Object:  StoredProcedure [dbo].[insertquestionCustom]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertquestionCustom]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[insertquestionCustom]
GO
/****** Object:  StoredProcedure [dbo].[insertQuestionChoice]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertQuestionChoice]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[insertQuestionChoice]
GO
/****** Object:  StoredProcedure [dbo].[insertQuestionMatching]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertQuestionMatching]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[insertQuestionMatching]
GO
/****** Object:  StoredProcedure [dbo].[insertQuestionFill]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertQuestionFill]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[insertQuestionFill]
GO
/****** Object:  StoredProcedure [dbo].[selectQuestion2]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[selectQuestion2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[selectQuestion2]
GO
/****** Object:  StoredProcedure [dbo].[insertQuestionBrief]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertQuestionBrief]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[insertQuestionBrief]
GO
/****** Object:  StoredProcedure [dbo].[addQuestionToTest]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addQuestionToTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[addQuestionToTest]
GO
/****** Object:  StoredProcedure [dbo].[getTestQuestion]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getTestQuestion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getTestQuestion]
GO
/****** Object:  StoredProcedure [dbo].[addToLog]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addToLog]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[addToLog]
GO
/****** Object:  StoredProcedure [dbo].[getTest]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getTest]
GO
/****** Object:  StoredProcedure [dbo].[deleteQuestion]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteQuestion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[deleteQuestion]
GO
/****** Object:  StoredProcedure [dbo].[getQtype]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getQtype]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getQtype]
GO
/****** Object:  StoredProcedure [dbo].[undoInsertQuestion]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[undoInsertQuestion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[undoInsertQuestion]
GO
/****** Object:  StoredProcedure [dbo].[getQuestion]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getQuestion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getQuestion]
GO
/****** Object:  StoredProcedure [dbo].[getSubjectCategory]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getSubjectCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getSubjectCategory]
GO
/****** Object:  StoredProcedure [dbo].[addSubjectCategory]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addSubjectCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[addSubjectCategory]
GO
/****** Object:  StoredProcedure [dbo].[insertQuestionDescriptor]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertQuestionDescriptor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[insertQuestionDescriptor]
GO
/****** Object:  Table [dbo].[questionCustom]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questionCustom]') AND type in (N'U'))
DROP TABLE [dbo].[questionCustom]
GO
/****** Object:  Table [dbo].[questionChoice]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questionChoice]') AND type in (N'U'))
DROP TABLE [dbo].[questionChoice]
GO
/****** Object:  Table [dbo].[questionMatch]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questionMatch]') AND type in (N'U'))
DROP TABLE [dbo].[questionMatch]
GO
/****** Object:  Table [dbo].[questionFill]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questionFill]') AND type in (N'U'))
DROP TABLE [dbo].[questionFill]
GO
/****** Object:  Table [dbo].[questionBrief]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questionBrief]') AND type in (N'U'))
DROP TABLE [dbo].[questionBrief]
GO
/****** Object:  Table [dbo].[test_question]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[test_question]') AND type in (N'U'))
DROP TABLE [dbo].[test_question]
GO
/****** Object:  Table [dbo].[test]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[test]') AND type in (N'U'))
DROP TABLE [dbo].[test]
GO
/****** Object:  Table [dbo].[questionDescriptor]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questionDescriptor]') AND type in (N'U'))
DROP TABLE [dbo].[questionDescriptor]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[subject]') AND type in (N'U'))
DROP TABLE [dbo].[subject]
GO
/****** Object:  Table [dbo].[userDetail]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[userDetail]') AND type in (N'U'))
DROP TABLE [dbo].[userDetail]
GO
/****** Object:  Table [dbo].[standard]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[standard]') AND type in (N'U'))
DROP TABLE [dbo].[standard]
GO
/****** Object:  Table [dbo].[questionDetail]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questionDetail]') AND type in (N'U'))
DROP TABLE [dbo].[questionDetail]
GO
/****** Object:  StoredProcedure [dbo].[getSubjectID]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getSubjectID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getSubjectID]
GO
/****** Object:  Default [DF__questionD__diffi__0AD2A005]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__questionD__diffi__0AD2A005]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__questionD__diffi__0AD2A005]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[questionDescriptor] DROP CONSTRAINT [DF__questionD__diffi__0AD2A005]
END


End
GO
/****** Object:  Default [DF_userDetail_active]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_userDetail_active]') AND parent_object_id = OBJECT_ID(N'[dbo].[userDetail]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_userDetail_active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[userDetail] DROP CONSTRAINT [DF_userDetail_active]
END


End
GO
/****** Object:  Default [DF_userDetail_deleted]    Script Date: 11/12/2010 20:05:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_userDetail_deleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[userDetail]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_userDetail_deleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[userDetail] DROP CONSTRAINT [DF_userDetail_deleted]
END


End
GO
/****** Object:  StoredProcedure [dbo].[getSubjectID]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getSubjectID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[getSubjectID]
(
@sid int output ,
@subjectName varchar(50),
@subjectCategory varchar(50),
@subjectLevel varchar(50)

)
as
select @sid = sid from subject where 
subjectName=@subjectName and subjectCategory=@subjectCategory and subjectLevel=@subjectLevel 
return

' 
END
GO
/****** Object:  Table [dbo].[questionDetail]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questionDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[questionDetail](
	[qtid] [int] NOT NULL,
	[questionType] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
 CONSTRAINT [PK__questionDetail__0519C6AF] PRIMARY KEY CLUSTERED 
(
	[qtid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON),
 CONSTRAINT [UQ__questionDetail__060DEAE8] UNIQUE NONCLUSTERED 
(
	[questionType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[questionDetail] ([qtid], [questionType]) VALUES (1, N'brief')
INSERT [dbo].[questionDetail] ([qtid], [questionType]) VALUES (2, N'choice')
INSERT [dbo].[questionDetail] ([qtid], [questionType]) VALUES (3, N'custom')
INSERT [dbo].[questionDetail] ([qtid], [questionType]) VALUES (4, N'fill')
INSERT [dbo].[questionDetail] ([qtid], [questionType]) VALUES (5, N'match')
/****** Object:  Table [dbo].[standard]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[standard]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[standard](
	[stdid] [int] NOT NULL,
	[standardName] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
 CONSTRAINT [PK__standard__7C8480AE] PRIMARY KEY CLUSTERED 
(
	[stdid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON),
 CONSTRAINT [UQ__standard__7D78A4E7] UNIQUE NONCLUSTERED 
(
	[standardName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[standard] ([stdid], [standardName]) VALUES (5, N'fifth')
INSERT [dbo].[standard] ([stdid], [standardName]) VALUES (1, N'first')
INSERT [dbo].[standard] ([stdid], [standardName]) VALUES (4, N'fourth')
INSERT [dbo].[standard] ([stdid], [standardName]) VALUES (0, N'kg')
INSERT [dbo].[standard] ([stdid], [standardName]) VALUES (2, N'second')
INSERT [dbo].[standard] ([stdid], [standardName]) VALUES (3, N'third')
/****** Object:  Table [dbo].[userDetail]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[userDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[userDetail](
	[uid] [int] IDENTITY(1000,100) NOT NULL,
	[userName] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
	[userType] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
	[password] [varchar](100) COLLATE Latin1_General_CI_AI NULL,
	[dateOfCreation] [datetime] NULL,
	[active] [int] NOT NULL,
	[deleted] [int] NOT NULL,
 CONSTRAINT [PK__userDetail__7F60ED59] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON),
 CONSTRAINT [UQ__userDetail__00551192] UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[userDetail] ON
INSERT [dbo].[userDetail] ([uid], [userName], [userType], [password], [dateOfCreation], [active], [deleted]) VALUES (1000, N'a', N'admin', N'a', CAST(0x00009D1800000000 AS DateTime), 0, 0)
INSERT [dbo].[userDetail] ([uid], [userName], [userType], [password], [dateOfCreation], [active], [deleted]) VALUES (1100, N'fellow ', N'fellow', N'fellow', CAST(0x00009D1100000000 AS DateTime), 0, 0)
INSERT [dbo].[userDetail] ([uid], [userName], [userType], [password], [dateOfCreation], [active], [deleted]) VALUES (1200, N'ruchi.jain', N'admin', N'a', CAST(0x00009E2C01016A56 AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[userDetail] OFF
/****** Object:  Table [dbo].[subject]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[subject]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[subject](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[subjectName] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
	[subjectCategory] [varchar](50) COLLATE Latin1_General_CI_AI NULL,
	[subjectLevel] [nvarchar](50) COLLATE Latin1_General_CI_AI NULL,
	[description] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[stdid] [int] NULL,
 CONSTRAINT [PK__subject__00551192] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[subject] ON
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (1, N'mathematics', N'algebra', N'1.1', N'Basic Operations on Numbers', 1)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (2, N'mathematics', N'geometry', N'2.1', N'Identification of Shapes', 1)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (3, N'mathematics', N'algebra', N'1.2', N'Multiple Operations', 1)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (4, N'mathematics', N'algebra', N'1.3', N'3 digit Addition', 1)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (5, N'mathematics', N'algebra', N'1.4', N'Subtractioin', 1)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (6, N'mathematics', N'algebra', N'1.5', N'Multiplication', 1)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (7, N'mathematics', N'algebra', N'1.2', N'Simulataneous Equations', 2)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (8, N'mathematics', N'algebra', N'1.3', N'LCM of 2 numbers', 2)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (9, N'mathematics', N'algebra', N'1.4', N'GCD of 2numbers', 2)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (10, N'mathematics', N'algebra', N'1.5', N'Factorising equations', 2)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (11, N'mathematics', N'algebra', N'1.2', N'Fractions', 3)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (12, N'mathematics', N'algebra', N'1.3', N'Recurring Decimal numbers', 3)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (13, N'mathematics', N'algebra', N'1.4', N'Rational Numbers', 3)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (14, N'mathematics', N'algebra', N'1.5', N'Irrational Numbers', 3)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (15, N'mathematics', N'algebra', N'1.2', N'Multiple Operations', 4)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (16, N'mathematics', N'algebra', N'1.3', N'3 digit Addition', 4)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (17, N'mathematics', N'algebra', N'1.4', N'Subtractioin', 4)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (18, N'mathematics', N'algebra', N'1.5', N'Multiplication', 4)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (19, N'mathematics', N'geometry', N'2.2', N'Lines and Curves', 1)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (20, N'mathematics', N'geometry', N'2.3', N'Circles', 1)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (21, N'writing', N'alphabets', N'3.1', N'writing         cdddapital alphabets.', 0)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (24, N'Mathematics', N'Geometry', N'1.1', N'asdg', 0)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (26, N'mathematics', N'geometry', N'1.2', N'safsfgccc', 1)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (27, N'mathematics', N'algebra', N'1.1', N'hey', 4)
INSERT [dbo].[subject] ([sid], [subjectName], [subjectCategory], [subjectLevel], [description], [stdid]) VALUES (28, N'mathematics', N'algebra', N'1.1', N'der?', 3)
SET IDENTITY_INSERT [dbo].[subject] OFF
/****** Object:  Table [dbo].[questionDescriptor]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questionDescriptor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[questionDescriptor](
	[qid] [int] IDENTITY(100,1) NOT NULL,
	[questionType] [varchar](50) COLLATE Latin1_General_CI_AI NULL,
	[standard] [varchar](50) COLLATE Latin1_General_CI_AI NULL,
	[sid] [int] NULL,
	[rating] [int] NULL,
	[difficulty] [varchar](50) COLLATE Latin1_General_CI_AI NULL,
	[creator] [int] NULL,
	[dateOfCreation] [datetime] NOT NULL,
 CONSTRAINT [PK__questionDescript__09DE7BCC] PRIMARY KEY CLUSTERED 
(
	[qid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[questionDescriptor] ON
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (100, N'brief', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFE01688AF4 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (101, N'custom', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFE0169AA1F AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (117, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (118, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (119, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (120, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (121, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (122, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (123, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (124, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (125, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (126, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (127, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (128, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (129, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (130, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (131, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (132, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (133, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (134, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (135, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (136, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (137, N'custom', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF002553C7 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (138, N'brief', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF00AA0E05 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (140, N'custom', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF00B21BB0 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (141, N'custom', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF00B249E5 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (142, N'custom', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF00B27E23 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (143, N'fill', N'first', 1, 1, N'easy', 1000, CAST(0x00009DFF00B472A9 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (144, N'fill', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF00B550FF AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (145, N'match', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF00B643F2 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (146, N'match', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF00B6BF2A AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (147, N'fill', N'first', 16, 1, N'hard', 1000, CAST(0x00009DFF00B6FEA7 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (148, N'fill', N'first', 16, 1, N'hard', 1000, CAST(0x00009DFF00B744AD AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (149, N'brief', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF00B7EF9D AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (150, N'brief', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF00B83442 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (151, N'fill', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF00B96E5E AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (152, N'fill', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF00B9A522 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (153, N'brief', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF00BA5450 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (154, N'fill', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF00BA997A AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (155, N'choice', N'first', 16, 1, N'easy', 1000, CAST(0x00009DFF00BAE210 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (156, N'brief', N'first', 16, 3, N'hard', 1000, CAST(0x00009DFF00BB687E AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (157, N'choice', N'first', 16, 3, N'hard', 1000, CAST(0x00009DFF00BBB723 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (268, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (269, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (270, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (271, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (277, N'match', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (278, N'match', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (279, N'match', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (280, N'match', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (291, N'choice', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (292, N'choice', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (295, N'choice', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (296, N'choice', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (297, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (298, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (299, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (300, N'brief', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (306, N'match', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (307, N'match', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (308, N'match', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (309, N'match', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (310, N'choice', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (311, N'choice', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (314, N'choice', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
INSERT [dbo].[questionDescriptor] ([qid], [questionType], [standard], [sid], [rating], [difficulty], [creator], [dateOfCreation]) VALUES (315, N'choice', N'first', 1, 1, N'easy', 1000, CAST(0x00009E2A00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[questionDescriptor] OFF
/****** Object:  Table [dbo].[test]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[test]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[test](
	[testid] [int] IDENTITY(1,1) NOT NULL,
	[dateOfCreation] [datetime] NOT NULL,
	[standard] [varchar](50) COLLATE Latin1_General_CI_AI NULL,
	[subjectName] [varchar](50) COLLATE Latin1_General_CI_AI NULL,
	[subjectCategory] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[creator] [int] NULL,
 CONSTRAINT [PK__test__0CBAE877] PRIMARY KEY CLUSTERED 
(
	[testid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[test] ON
INSERT [dbo].[test] ([testid], [dateOfCreation], [standard], [subjectName], [subjectCategory], [creator]) VALUES (1, CAST(0x00009DFE016A1048 AS DateTime), N'FIRST', N'MATHEMATICS', N'algebra', 1000)
INSERT [dbo].[test] ([testid], [dateOfCreation], [standard], [subjectName], [subjectCategory], [creator]) VALUES (2, CAST(0x00009DFF00258960 AS DateTime), N'FIRST', N'MATHEMATICS', N'algebra', 1000)
INSERT [dbo].[test] ([testid], [dateOfCreation], [standard], [subjectName], [subjectCategory], [creator]) VALUES (3, CAST(0x00009DFF00AB9D98 AS DateTime), N'FIRST', N'MATHEMATICS', N'Algebra', 1000)
INSERT [dbo].[test] ([testid], [dateOfCreation], [standard], [subjectName], [subjectCategory], [creator]) VALUES (4, CAST(0x00009DFF00BCC244 AS DateTime), N'FIRST', N'MATHEMATICS', N'algebra,Algebra', 1000)
INSERT [dbo].[test] ([testid], [dateOfCreation], [standard], [subjectName], [subjectCategory], [creator]) VALUES (5, CAST(0x00009DFF00BD02B8 AS DateTime), N'FIRST', N'MATHEMATICS', N'algebra,Algebra', 1000)
INSERT [dbo].[test] ([testid], [dateOfCreation], [standard], [subjectName], [subjectCategory], [creator]) VALUES (6, CAST(0x00009DFF00BD40D4 AS DateTime), N'FIRST', N'MATHEMATICS', N'algebra,Algebra', 1000)
INSERT [dbo].[test] ([testid], [dateOfCreation], [standard], [subjectName], [subjectCategory], [creator]) VALUES (7, CAST(0x00009DFF00DAA570 AS DateTime), N'FIRST', N'MATHEMATICS', N'algebra,Algebra', 1000)
INSERT [dbo].[test] ([testid], [dateOfCreation], [standard], [subjectName], [subjectCategory], [creator]) VALUES (8, CAST(0x00009DFF00DB3C9C AS DateTime), N'FIRST', N'MATHEMATICS', N'algebra,Algebra', 1000)
SET IDENTITY_INSERT [dbo].[test] OFF
/****** Object:  Table [dbo].[test_question]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[test_question]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[test_question](
	[testid] [int] NOT NULL,
	[qid] [int] NOT NULL,
 CONSTRAINT [PK__test_question__0EA330E9] PRIMARY KEY CLUSTERED 
(
	[testid] ASC,
	[qid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (1, 100)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (1, 101)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (2, 101)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (2, 137)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (3, 119)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (3, 120)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (3, 121)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (3, 123)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (3, 124)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (3, 125)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (3, 126)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (4, 137)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (4, 138)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (4, 143)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (4, 145)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (4, 146)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (4, 148)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (4, 150)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (4, 151)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (4, 152)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (4, 153)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (4, 155)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (4, 157)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (5, 101)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (5, 143)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (5, 145)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (5, 146)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (5, 148)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (5, 149)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (5, 150)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (5, 151)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (5, 152)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (5, 153)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (5, 155)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (5, 157)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (6, 101)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (6, 143)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (6, 145)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (6, 146)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (6, 147)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (6, 148)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (7, 101)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (7, 119)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (7, 138)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (7, 143)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (7, 145)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (7, 150)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (8, 101)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (8, 118)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (8, 119)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (8, 138)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (8, 143)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (8, 145)
INSERT [dbo].[test_question] ([testid], [qid]) VALUES (8, 150)
/****** Object:  Table [dbo].[questionBrief]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questionBrief]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[questionBrief](
	[qid] [int] NOT NULL,
	[questionText] [nvarchar](max) COLLATE Latin1_General_CI_AI NOT NULL,
	[shortLong] [int] NULL,
	[answer] [nvarchar](max) COLLATE Latin1_General_CI_AI NOT NULL,
 CONSTRAINT [PK__questionBrief__108B795B] PRIMARY KEY CLUSTERED 
(
	[qid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (100, N'&nbsp; 333<br />
+222', 1, N'555')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (117, N'1+1', 1, N'2')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (118, N'2+3', 1, N'5')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (119, N'4+4', 1, N'8')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (120, N'5+5', 1, N'10')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (121, N'1+1', 1, N'2')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (122, N'2+3', 1, N'5')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (123, N'4+4', 1, N'8')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (124, N'5+5', 1, N'10')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (125, N'1+1', 1, N'2')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (126, N'2+3', 1, N'5')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (127, N'4+4', 1, N'8')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (128, N'5+5', 1, N'10')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (129, N'1+1', 1, N'2')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (130, N'2+3', 1, N'5')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (131, N'4+4', 1, N'8')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (132, N'5+5', 1, N'10')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (133, N'1+1', 1, N'2')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (134, N'2+3', 1, N'5')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (135, N'4+4', 1, N'8')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (136, N'5+5', 1, N'10')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (138, N'Calulate the sum of&nbsp; five hundred and sixty nine and three hundred and twenty one .<br />
<p style="text-align: center; margin: 0px"><span style="font-weight: bold">Write the answer in words.</span></p>', 1, N'nine hundred .')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (149, N'100<br />
+100<br />
<span style="text-decoration: underline">+200</span>', 1, N'400')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (150, N'There are 500 workers in total.Out of them there are 250 men.How many women workers are there?', 1, N'250')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (153, N'Enter numbers divisble by 20 between 400 and 500', 1, N'420 440 460 480')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (156, N'What would be total number of cricketers required to&nbsp; make 3 teams ?', 1, N'thirty three.')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (268, N'1+1', 1, N'2')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (269, N'2+3', 1, N'5')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (270, N'4+4', 1, N'8')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (271, N'5+5', 1, N'10')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (297, N'what is brief', 1, N'2')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (298, N'why do u use brief', 1, N'5')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (299, N'are brief ques necessary', 1, N'8')
INSERT [dbo].[questionBrief] ([qid], [questionText], [shortLong], [answer]) VALUES (300, N'hey brief is imp', 1, N'10')
/****** Object:  Table [dbo].[questionFill]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questionFill]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[questionFill](
	[qid] [int] NOT NULL,
	[questionText] [nvarchar](max) COLLATE Latin1_General_CI_AI NOT NULL,
	[answer] [nvarchar](max) COLLATE Latin1_General_CI_AI NOT NULL,
 CONSTRAINT [PK__questionFill__1273C1CD] PRIMARY KEY CLUSTERED 
(
	[qid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[questionFill] ([qid], [questionText], [answer]) VALUES (143, N'What is sum total number of toys if there are 3 shps and 4 aeroplanes ?', N'there are 7 typees.')
INSERT [dbo].[questionFill] ([qid], [questionText], [answer]) VALUES (144, N'How many cats are&nbsp; left in the den if 5 escape .The den had 18 cats&nbsp; .<br />
Write your answer in words.', N'thirteen ')
INSERT [dbo].[questionFill] ([qid], [questionText], [answer]) VALUES (147, N'There are five sahoo''s , and three shah''s .How many anuwal''s are there ?', N'ZERO')
INSERT [dbo].[questionFill] ([qid], [questionText], [answer]) VALUES (148, N'There are fifteen bats and thirty balls.How many pairs of bats are there ?', N'<p style="text-align: left; margin: 0px"><span style="background-color: #ffff00; font-style: italic; color: #ff0000; font-size: 12pt; font-weight: bold; text-decoration: underline">seven</span></p>')
INSERT [dbo].[questionFill] ([qid], [questionText], [answer]) VALUES (151, N'Enter the missing digit such that the number wil be largest 9_9', N'9')
INSERT [dbo].[questionFill] ([qid], [questionText], [answer]) VALUES (152, N'Difference between 777 and 333&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;', N'444')
INSERT [dbo].[questionFill] ([qid], [questionText], [answer]) VALUES (154, N'Enter the largest 3 Digit no.', N'999')
/****** Object:  Table [dbo].[questionMatch]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questionMatch]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[questionMatch](
	[qid] [int] NOT NULL,
	[questionText] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[leftChoice1] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[rightChoice1] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[leftChoice2] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[rightChoice2] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[leftChoice3] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[rightChoice3] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[leftChoice4] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[rightChoice4] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[leftChoice5] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[rightChoice5] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[leftChoice6] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[rightChoice6] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[answer] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
 CONSTRAINT [PK__questionMatch__145C0A3F] PRIMARY KEY CLUSTERED 
(
	[qid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[questionMatch] ([qid], [questionText], [leftChoice1], [rightChoice1], [leftChoice2], [rightChoice2], [leftChoice3], [rightChoice3], [leftChoice4], [rightChoice4], [leftChoice5], [rightChoice5], [leftChoice6], [rightChoice6], [answer]) VALUES (145, N'Match the following correctly.', N'23+35', N'58', N'34+45', N'79', N'50+50', N'100', N'345-100', N'245', N'350-200', N'150', N'250+90', N'340', N'Matching Pairs are give alongside each other')
INSERT [dbo].[questionMatch] ([qid], [questionText], [leftChoice1], [rightChoice1], [leftChoice2], [rightChoice2], [leftChoice3], [rightChoice3], [leftChoice4], [rightChoice4], [leftChoice5], [rightChoice5], [leftChoice6], [rightChoice6], [answer]) VALUES (146, N'Match the words with numbers.', N'three forty three', N'343', N'five sixty nine', N'569', N'twenty six', N'026', N'seven', N'07', N'three fifty three', N'353', N'nine thirty two', N'932', N'Matching Pairs are give alongside each other')
INSERT [dbo].[questionMatch] ([qid], [questionText], [leftChoice1], [rightChoice1], [leftChoice2], [rightChoice2], [leftChoice3], [rightChoice3], [leftChoice4], [rightChoice4], [leftChoice5], [rightChoice5], [leftChoice6], [rightChoice6], [answer]) VALUES (277, N'fe', N'vv', N'vvv', N'vv', N'vvv', N'vv', N'vvv', N'vv', N'vvv', N'vvv', N'vvv', N'vv', N'vv', N'')
INSERT [dbo].[questionMatch] ([qid], [questionText], [leftChoice1], [rightChoice1], [leftChoice2], [rightChoice2], [leftChoice3], [rightChoice3], [leftChoice4], [rightChoice4], [leftChoice5], [rightChoice5], [leftChoice6], [rightChoice6], [answer]) VALUES (278, N'be', N'ssd', N'fds', N'hh', N'kj', N'gth', N'uk', N'bg', N'ki', N'yh', N'tg', N'bb', N'b', N'')
INSERT [dbo].[questionMatch] ([qid], [questionText], [leftChoice1], [rightChoice1], [leftChoice2], [rightChoice2], [leftChoice3], [rightChoice3], [leftChoice4], [rightChoice4], [leftChoice5], [rightChoice5], [leftChoice6], [rightChoice6], [answer]) VALUES (279, N'fe', N'vv', N'vvv', N'vv', N'vvv', N'vv', N'vvv', N'vv', N'vvv', N'vvv', N'vvv', N'vv', N'vv', N'')
INSERT [dbo].[questionMatch] ([qid], [questionText], [leftChoice1], [rightChoice1], [leftChoice2], [rightChoice2], [leftChoice3], [rightChoice3], [leftChoice4], [rightChoice4], [leftChoice5], [rightChoice5], [leftChoice6], [rightChoice6], [answer]) VALUES (280, N'be', N'ssd', N'fds', N'hh', N'kj', N'gth', N'uk', N'bg', N'ki', N'yh', N'tg', N'bb', N'b', N'')
INSERT [dbo].[questionMatch] ([qid], [questionText], [leftChoice1], [rightChoice1], [leftChoice2], [rightChoice2], [leftChoice3], [rightChoice3], [leftChoice4], [rightChoice4], [leftChoice5], [rightChoice5], [leftChoice6], [rightChoice6], [answer]) VALUES (306, N'fe', N'vv', N'vvv', N'vv', N'vvv', N'vv', N'vvv', N'vv', N'vvv', N'vvv', N'vvv', N'vv', N'vv', N'')
INSERT [dbo].[questionMatch] ([qid], [questionText], [leftChoice1], [rightChoice1], [leftChoice2], [rightChoice2], [leftChoice3], [rightChoice3], [leftChoice4], [rightChoice4], [leftChoice5], [rightChoice5], [leftChoice6], [rightChoice6], [answer]) VALUES (307, N'be', N'ssd', N'fds', N'hh', N'kj', N'gth', N'uk', N'bg', N'ki', N'yh', N'tg', N'bb', N'b', N'')
INSERT [dbo].[questionMatch] ([qid], [questionText], [leftChoice1], [rightChoice1], [leftChoice2], [rightChoice2], [leftChoice3], [rightChoice3], [leftChoice4], [rightChoice4], [leftChoice5], [rightChoice5], [leftChoice6], [rightChoice6], [answer]) VALUES (308, N'fe', N'vv', N'vvv', N'vv', N'vvv', N'vv', N'vvv', N'vv', N'vvv', N'vvv', N'vvv', N'vv', N'vv', N'')
INSERT [dbo].[questionMatch] ([qid], [questionText], [leftChoice1], [rightChoice1], [leftChoice2], [rightChoice2], [leftChoice3], [rightChoice3], [leftChoice4], [rightChoice4], [leftChoice5], [rightChoice5], [leftChoice6], [rightChoice6], [answer]) VALUES (309, N'be', N'ssd', N'fds', N'hh', N'kj', N'gth', N'uk', N'bg', N'ki', N'yh', N'tg', N'bb', N'b', N'')
/****** Object:  Table [dbo].[questionChoice]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questionChoice]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[questionChoice](
	[qid] [int] NOT NULL,
	[questionText] [nvarchar](max) COLLATE Latin1_General_CI_AI NOT NULL,
	[choiceA] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[choiceB] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[choiceC] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[choiceD] [nvarchar](max) COLLATE Latin1_General_CI_AI NULL,
	[answer] [nvarchar](max) COLLATE Latin1_General_CI_AI NOT NULL,
 CONSTRAINT [PK__questionChoice__164452B1] PRIMARY KEY CLUSTERED 
(
	[qid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[questionChoice] ([qid], [questionText], [choiceA], [choiceB], [choiceC], [choiceD], [answer]) VALUES (155, N'fre', N'23', N'as', N'23', N'wef', N'ABC')
INSERT [dbo].[questionChoice] ([qid], [questionText], [choiceA], [choiceB], [choiceC], [choiceD], [answer]) VALUES (157, N'bvbb', N'3', N'5', N'43', N'6', N'3')
INSERT [dbo].[questionChoice] ([qid], [questionText], [choiceA], [choiceB], [choiceC], [choiceD], [answer]) VALUES (291, N'hhh', N'hello', N'another day', N'die', N'pain', N'ABC')
INSERT [dbo].[questionChoice] ([qid], [questionText], [choiceA], [choiceB], [choiceC], [choiceD], [answer]) VALUES (292, N'hhh', N'dsf', N'sdf', N'fds', N'fsd', N'ABC')
INSERT [dbo].[questionChoice] ([qid], [questionText], [choiceA], [choiceB], [choiceC], [choiceD], [answer]) VALUES (295, N'hhh', N'hello', N'another day', N'die', N'pain', N'ABC')
INSERT [dbo].[questionChoice] ([qid], [questionText], [choiceA], [choiceB], [choiceC], [choiceD], [answer]) VALUES (296, N'hhh', N'dsf', N'sdf', N'fds', N'fsd', N'ABC')
INSERT [dbo].[questionChoice] ([qid], [questionText], [choiceA], [choiceB], [choiceC], [choiceD], [answer]) VALUES (310, N'choice is ', N'its upto u', N'no', N'I get to decide', N'hey', N'ABC')
INSERT [dbo].[questionChoice] ([qid], [questionText], [choiceA], [choiceB], [choiceC], [choiceD], [answer]) VALUES (311, N'to be or not', N'dats cheating', N'why', N'its fair ', N'no way', N'ABC')
INSERT [dbo].[questionChoice] ([qid], [questionText], [choiceA], [choiceB], [choiceC], [choiceD], [answer]) VALUES (314, N'good', N'assume', N'I do believe', N'die', N'peace', N'ABC')
INSERT [dbo].[questionChoice] ([qid], [questionText], [choiceA], [choiceB], [choiceC], [choiceD], [answer]) VALUES (315, N'not', N'rest ', N'inflames', N'fds', N'fsd', N'ABC')
/****** Object:  Table [dbo].[questionCustom]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[questionCustom]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[questionCustom](
	[qid] [int] NOT NULL,
	[questionText] [nvarchar](max) COLLATE Latin1_General_CI_AI NOT NULL,
	[answer] [nvarchar](max) COLLATE Latin1_General_CI_AI NOT NULL,
	[questionImage] [varchar](max) COLLATE Latin1_General_CI_AI NULL,
 CONSTRAINT [PK__questionCustom__182C9B23] PRIMARY KEY CLUSTERED 
(
	[qid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[questionCustom] ([qid], [questionText], [answer], [questionImage]) VALUES (101, N'Hello World!', N'hiiii', N'ImageStorage/Koala.jpg')
INSERT [dbo].[questionCustom] ([qid], [questionText], [answer], [questionImage]) VALUES (137, N'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;777&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-decoration: underline">&nbsp;&nbsp;+222</span><br />', N'999', N'ImageStorage/Penguins.jpg')
INSERT [dbo].[questionCustom] ([qid], [questionText], [answer], [questionImage]) VALUES (140, N'Find the sum of the numbers given in the picture..', N'5', N'ImageStorage/pic1.jpg')
INSERT [dbo].[questionCustom] ([qid], [questionText], [answer], [questionImage]) VALUES (141, N'<span style="font-size: 14pt">count the total number of stars .</span>', N'10', N'ImageStorage/pic2.jpg')
INSERT [dbo].[questionCustom] ([qid], [questionText], [answer], [questionImage]) VALUES (142, N'Identify the highest number in the figure .', N'250', N'ImageStorage/chart.jpg')
/****** Object:  StoredProcedure [dbo].[insertQuestionDescriptor]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertQuestionDescriptor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[insertQuestionDescriptor]
	
	(
	@qtype varchar(50),
	@standard varchar(50),
	@subject varchar(50),
	@rating int,
	@difficulty varchar(50),
	@creator varchar(50),
	@qtid int output,
	@dateOfCreation datetime,
	@qid int output
	)
	
AS
	/* SET NOCOUNT ON */
	insert into 
	questionDescriptor(questionType,standard,sid,rating,difficulty,creator,dateOfCreation)
	 values ( @qtype, @standard, @subject, @rating,@difficulty, @creator, @dateOfCreation)

	select  @qid=@@identity
	
	select @qtid = qtid from questionDetail where questionType = @qtype

	RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[addSubjectCategory]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addSubjectCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[addSubjectCategory]
	
	(
	@subjectName varchar(50),
	@subjectCategory varchar(50),
	@subjectLevel varchar(50),
	@description varchar(MAX),
	@stdid int
	)
	
AS
	/* SET NOCOUNT ON */
	insert into subject values(@subjectName,@subjectCategory,@subjectLevel,@description,@stdid)
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getSubjectCategory]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getSubjectCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getSubjectCategory]
	
	(
	@qid int,
	@subjectCategory varchar(50) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	select @subjectCategory = subjectCategory from subject where sid = (select sid from questionDescriptor  where qid = @qid) 
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getQuestion]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getQuestion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE procedure [dbo].[getQuestion]
(
@questionType varchar(50),
@standard varchar(50),
@subjectName varchar(50),
@subjectCategory varchar(50),
@subjectLevel varchar(50),
@rating int
)
as
declare @sid int

 select @sid = sid from subject
			 where subjectName=@subjectName and subjectCategory=@subjectCategory and subjectLevel=@subjectLevel

	if(@questionType=''brief'')
		SELECT     questionBrief.*, questionDescriptor.difficulty
FROM         questionBrief INNER JOIN
                      questionDescriptor ON questionBrief.qid = questionDescriptor.qid
where questionBrief.qid in 
(select qid from questionDescriptor where (sid= @sid )and (standard=@standard) and (rating >=@rating))
	
	if(@questionType=''custom'')
		SELECT     questionCustom.qid, questionCustom.questionText, questionCustom.answer, questionCustom.questionImage, questionDescriptor.difficulty
FROM         questionCustom INNER JOIN
                      questionDescriptor ON questionCustom.qid = questionDescriptor.qid
WHERE     (questionCustom.qid IN
                          (SELECT     qid
                            FROM          questionDescriptor AS questionDescriptor_1
                            WHERE      (standard = @standard) AND (sid = @sid) AND (rating >= @rating)))
    
    if(@questionType=''fill'')
				select questionFill.* ,questionDescriptor.difficulty 
		FROM questionFill INNER JOIN 
		questionDescriptor on questionFill.qid = questionDescriptor.qid 
		where questionFill.qid in
			(
				select qid from questionDescriptor where standard=@standard and sid=@sid and rating>=@rating
			 )
    
    if(@questionType=''choice'')
				select questionChoice.* ,questionDescriptor.difficulty 
		FROM questionChoice INNER JOIN questionDescriptor on questionChoice.qid = questionDescriptor.qid 
		where questionChoice.qid in
			(
				select qid from questionDescriptor where standard=@standard and sid=@sid and rating>=@rating
			 )
    
    if(@questionType=''matching'')
				select questionMatch.* ,questionDescriptor.difficulty 
		FROM questionMatch INNER JOIN questionDescriptor on questionMatch.qid = questionDescriptor.qid 
		where questionMatch.qid in
			(
				select qid from questionDescriptor where standard=@standard and sid=@sid and rating>=@rating
			 )


return' 
END
GO
/****** Object:  StoredProcedure [dbo].[undoInsertQuestion]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[undoInsertQuestion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[undoInsertQuestion]
	
	(
	@qid int 
	)
	
AS
	/* SET NOCOUNT ON */
	delete from  questionDescriptor where qid = @qid
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[getQtype]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getQtype]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getQtype]
	
	(
	@qid int,
	@qtype varchar(50) OUTPUT
	)

AS
	/* SET NOCOUNT ON */
	select @qtype = questionType from questionDescriptor where qid=@qid
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[deleteQuestion]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteQuestion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[deleteQuestion]
(
@qid int,
@qtype varchar(50)
)
as begin 

if(@qtype=''brief'')
delete from questionBrief where qid=@qid

if(@qtype=''choice'')
delete from questionChoice where qid=@qid

if(@qtype=''fill'')
delete from questionFill where qid=@qid

if(@qtype=''match'')
delete from questionMatch where qid=@qid

if(@qtype=''custom'')
delete from questionCustom where qid=@qid

delete from test_question where qid=@qid

delete from questionDescriptor where qid=@qid

end' 
END
GO
/****** Object:  StoredProcedure [dbo].[getTest]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[getTest]
	(
	@testid int,
	@standard varchar(50) output,
	@subjectName varchar(50) output,
	@subjectCategory varchar(MAX) output 
	)
	
AS
	/* SET NOCOUNT ON */
	select @standard=standard,@subjectName=subjectName,@subjectCategory=subjectCategory from test  where test.testid=@testid ;
	RETURN
 ' 
END
GO
/****** Object:  StoredProcedure [dbo].[addToLog]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addToLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[addToLog]
	(
	@dateofCreation datetime,
	@creator int,
	@testid int output,
	@standard varchar(50),
	@subjectName varchar(50),
	@subjectCategory varchar(50)
	
	)
	
AS
	/* SET NOCOUNT ON */
	insert into test values (@dateofcreation,@standard,@subjectName,@subjectCategory,@creator)
	
	set @testid = @@identity
	RETURN' 
END
GO
/****** Object:  StoredProcedure [dbo].[getTestQuestion]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getTestQuestion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getTestQuestion]
	
	(
	@testid int
	)
	
AS
	/* SET NOCOUNT ON */
	select  qid from test_question where testid=@testid
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[addQuestionToTest]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addQuestionToTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[addQuestionToTest]
	
	(
	@testid int ,
	@qid int
	)
	
AS
	/* SET NOCOUNT ON */
	insert into test_question  values (@testid,@qid)
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[insertQuestionBrief]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertQuestionBrief]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[insertQuestionBrief]
(
	@qid int ,
	@qtext nvarchar(MAX),
	@flag int,
	@answer nvarchar(MAX)
	)
	
AS
	/* SET NOCOUNT ON */
	insert into questionBrief values (@qid, @qtext, @flag, @answer)
	RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[selectQuestion2]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[selectQuestion2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[selectQuestion2]
(
@questionType varchar(50),
@qid int
)
as

	if(@questionType=''brief'')
		select * from questionBrief where qid =@qid 
else if(@questionType=''fill'')
		select * from questionFill where qid =@qid 
	
else if(@questionType=''match'')
		select * from questionMatch where qid =@qid 
	
else if(@questionType=''custom'')
		select * from questionCustom where qid =@qid 
	
else if(@questionType=''choice'')
		select * from questionChoice where qid =@qid 
	
			return
' 
END
GO
/****** Object:  StoredProcedure [dbo].[insertQuestionFill]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertQuestionFill]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[insertQuestionFill]
	
	(
	@qid int ,
	@qtext varchar(MAX) ,
	@answer varchar(MAX)
	)
	
AS
	/* SET NOCOUNT ON */
	insert into questionFill values (@qid,@qtext,@answer)
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[insertQuestionMatching]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertQuestionMatching]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[insertQuestionMatching]
	
	(
	@qid int ,
	@qtext varchar(MAX),
	@lchoice1 varchar(50),
	@rchoice1 varchar(50),
	@lchoice2 varchar(50),
	@rchoice2 varchar(50),
	@lchoice3 varchar(50),
	@rchoice3 varchar(50),
	@lchoice4 varchar(50),
	@rchoice4 varchar(50),
	@lchoice5 varchar(50),
	@rchoice5 varchar(50),
	@lchoice6 varchar(50),
	@rchoice6 varchar(50),
	@answer varchar(MAX)
	)
	
AS
	/* SET NOCOUNT ON */
	insert into questionMatch values(@qid,@qtext,@lchoice1,@rchoice1,@lchoice2,@rchoice2,@lchoice3,@rchoice3,@lchoice4,@rchoice4,@lchoice5,@rchoice5,@lchoice6,@rchoice6,@answer)
	RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[insertQuestionChoice]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertQuestionChoice]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[insertQuestionChoice]
	
	(
	@qid int = 5,
	@qtext varchar(MAX),
	@choiceA varchar(MAX),
	@choiceB varchar(MAX),
	@choiceC varchar(MAX),
	@choiceD varchar(MAX),
	@answer varchar(MAX)
	)
	
AS
	/* SET NOCOUNT ON */
	insert into questionChoice values 
(@qid, @qtext, @choiceA, @choiceB, @choiceC, @choiceD, @answer)
	RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[insertquestionCustom]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertquestionCustom]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[insertquestionCustom]
	(
	@qid int,
	@qtext varchar(MAX),
	@answer varchar(MAX),
	@qimage varchar(MAX)
	)
AS
	/* SET NOCOUNT ON */
	insert into questionCustom values (@qid, @qtext ,@answer, @qimage)
	RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[getStandardID]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getStandardID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[getStandardID]
(
@stdid int output ,
@stdName varchar(50)
)
as
select @stdid = stdid from standard where 
standardName=@stdName
return
' 
END
GO
/****** Object:  StoredProcedure [dbo].[loginUser]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[loginUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[loginUser]
(
@uname varchar(50),
@pwd varchar(50)
)
as 
select uid,userType,active
from userDetail
where userName=@uname and password=@pwd and deleted=0
return

' 
END
GO
/****** Object:  StoredProcedure [dbo].[createUser]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[createUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[createUser]
	
	(
	
	@uname varchar(50),
	@password varchar(50),
	@utype varchar(50),
	@datetime datetime
	)
	
AS
	 SET NOCOUNT OFF
 		insert into userDetail values (@uname, @utype, @password, @datetime,0,0)
	RETURN' 
END
GO
/****** Object:  StoredProcedure [dbo].[checkUser]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[checkUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[checkUser]
	(
	@userName varchar(50),
	@uid int OUTPUT
	)
	
AS
	
	select @uid = uid from userDetail where userName = @userName
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[changePassword]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[changePassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[changePassword]
	(
	@userName varchar(50),
	@password varchar(50)
	)
	
AS
	/* SET NOCOUNT ON */
	update userDetail set password=@password where userName= @userName
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[deleteUser]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[deleteUser]
	
	(
	@userName varchar(50)
	
	)
	
AS
	/* SET NOCOUNT ON */
	update userDetail set deleted=1 where userName = @userName
	RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[setActive]    Script Date: 11/12/2010 20:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[setActive]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[setActive]
	
	(
	@userId int ,
	@flag int 
	)
	
AS
	/* SET NOCOUNT ON */
	if(@flag=1)
	update userDetail set active=1 where uid = @userId;
	else
	update userDetail set active=0 where uid=@userId;
	RETURN
' 
END
GO
/****** Object:  Default [DF__questionD__diffi__0AD2A005]    Script Date: 11/12/2010 20:05:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__questionD__diffi__0AD2A005]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__questionD__diffi__0AD2A005]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[questionDescriptor] ADD  CONSTRAINT [DF__questionD__diffi__0AD2A005]  DEFAULT ('medium') FOR [difficulty]
END


End
GO
/****** Object:  Default [DF_userDetail_active]    Script Date: 11/12/2010 20:05:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_userDetail_active]') AND parent_object_id = OBJECT_ID(N'[dbo].[userDetail]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_userDetail_active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[userDetail] ADD  CONSTRAINT [DF_userDetail_active]  DEFAULT ((0)) FOR [active]
END


End
GO
/****** Object:  Default [DF_userDetail_deleted]    Script Date: 11/12/2010 20:05:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_userDetail_deleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[userDetail]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_userDetail_deleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[userDetail] ADD  CONSTRAINT [DF_userDetail_deleted]  DEFAULT ((0)) FOR [deleted]
END


End
GO
/****** Object:  Check [CK__questionB__short__38996AB5]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__questionB__short__38996AB5]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionBrief]'))
ALTER TABLE [dbo].[questionBrief]  WITH CHECK ADD  CONSTRAINT [CK__questionB__short__38996AB5] CHECK  (([shortLong]<(2) OR [shortLong]>(-1)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__questionB__short__38996AB5]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionBrief]'))
ALTER TABLE [dbo].[questionBrief] CHECK CONSTRAINT [CK__questionB__short__38996AB5]
GO
/****** Object:  Check [CK__questionD__ratin__33D4B598]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__questionD__ratin__33D4B598]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor]  WITH CHECK ADD  CONSTRAINT [CK__questionD__ratin__33D4B598] CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__questionD__ratin__33D4B598]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor] CHECK CONSTRAINT [CK__questionD__ratin__33D4B598]
GO
/****** Object:  ForeignKey [FK__questionBri__qid__37A5467C]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionBri__qid__37A5467C]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionBrief]'))
ALTER TABLE [dbo].[questionBrief]  WITH CHECK ADD  CONSTRAINT [FK__questionBri__qid__37A5467C] FOREIGN KEY([qid])
REFERENCES [dbo].[questionDescriptor] ([qid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionBri__qid__37A5467C]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionBrief]'))
ALTER TABLE [dbo].[questionBrief] CHECK CONSTRAINT [FK__questionBri__qid__37A5467C]
GO
/****** Object:  ForeignKey [FK__questionCho__qid__3B75D760]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionCho__qid__3B75D760]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionChoice]'))
ALTER TABLE [dbo].[questionChoice]  WITH CHECK ADD  CONSTRAINT [FK__questionCho__qid__3B75D760] FOREIGN KEY([qid])
REFERENCES [dbo].[questionDescriptor] ([qid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionCho__qid__3B75D760]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionChoice]'))
ALTER TABLE [dbo].[questionChoice] CHECK CONSTRAINT [FK__questionCho__qid__3B75D760]
GO
/****** Object:  ForeignKey [FK__questionCus__qid__3C69FB99]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionCus__qid__3C69FB99]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionCustom]'))
ALTER TABLE [dbo].[questionCustom]  WITH CHECK ADD  CONSTRAINT [FK__questionCus__qid__3C69FB99] FOREIGN KEY([qid])
REFERENCES [dbo].[questionDescriptor] ([qid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionCus__qid__3C69FB99]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionCustom]'))
ALTER TABLE [dbo].[questionCustom] CHECK CONSTRAINT [FK__questionCus__qid__3C69FB99]
GO
/****** Object:  ForeignKey [FK__questionD__creat__300424B4]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionD__creat__300424B4]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor]  WITH CHECK ADD  CONSTRAINT [FK__questionD__creat__300424B4] FOREIGN KEY([creator])
REFERENCES [dbo].[userDetail] ([uid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionD__creat__300424B4]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor] CHECK CONSTRAINT [FK__questionD__creat__300424B4]
GO
/****** Object:  ForeignKey [FK__questionD__quest__30F848ED]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionD__quest__30F848ED]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor]  WITH CHECK ADD  CONSTRAINT [FK__questionD__quest__30F848ED] FOREIGN KEY([questionType])
REFERENCES [dbo].[questionDetail] ([questionType])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionD__quest__30F848ED]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor] CHECK CONSTRAINT [FK__questionD__quest__30F848ED]
GO
/****** Object:  ForeignKey [FK__questionD__stand__31EC6D26]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionD__stand__31EC6D26]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor]  WITH CHECK ADD  CONSTRAINT [FK__questionD__stand__31EC6D26] FOREIGN KEY([standard])
REFERENCES [dbo].[standard] ([standardName])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionD__stand__31EC6D26]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor] CHECK CONSTRAINT [FK__questionD__stand__31EC6D26]
GO
/****** Object:  ForeignKey [FK__questionDes__sid__0AD2A005]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionDes__sid__0AD2A005]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor]  WITH CHECK ADD  CONSTRAINT [FK__questionDes__sid__0AD2A005] FOREIGN KEY([sid])
REFERENCES [dbo].[subject] ([sid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionDes__sid__0AD2A005]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionDescriptor]'))
ALTER TABLE [dbo].[questionDescriptor] CHECK CONSTRAINT [FK__questionDes__sid__0AD2A005]
GO
/****** Object:  ForeignKey [FK__questionFil__qid__398D8EEE]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionFil__qid__398D8EEE]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionFill]'))
ALTER TABLE [dbo].[questionFill]  WITH CHECK ADD  CONSTRAINT [FK__questionFil__qid__398D8EEE] FOREIGN KEY([qid])
REFERENCES [dbo].[questionDescriptor] ([qid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionFil__qid__398D8EEE]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionFill]'))
ALTER TABLE [dbo].[questionFill] CHECK CONSTRAINT [FK__questionFil__qid__398D8EEE]
GO
/****** Object:  ForeignKey [FK__questionMat__qid__3A81B327]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionMat__qid__3A81B327]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionMatch]'))
ALTER TABLE [dbo].[questionMatch]  WITH CHECK ADD  CONSTRAINT [FK__questionMat__qid__3A81B327] FOREIGN KEY([qid])
REFERENCES [dbo].[questionDescriptor] ([qid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__questionMat__qid__3A81B327]') AND parent_object_id = OBJECT_ID(N'[dbo].[questionMatch]'))
ALTER TABLE [dbo].[questionMatch] CHECK CONSTRAINT [FK__questionMat__qid__3A81B327]
GO
/****** Object:  ForeignKey [FK_subject_standard]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_subject_standard]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject]'))
ALTER TABLE [dbo].[subject]  WITH CHECK ADD  CONSTRAINT [FK_subject_standard] FOREIGN KEY([stdid])
REFERENCES [dbo].[standard] ([stdid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_subject_standard]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject]'))
ALTER TABLE [dbo].[subject] CHECK CONSTRAINT [FK_subject_standard]
GO
/****** Object:  ForeignKey [FK__test__creator__34C8D9D1]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__test__creator__34C8D9D1]') AND parent_object_id = OBJECT_ID(N'[dbo].[test]'))
ALTER TABLE [dbo].[test]  WITH CHECK ADD  CONSTRAINT [FK__test__creator__34C8D9D1] FOREIGN KEY([creator])
REFERENCES [dbo].[userDetail] ([uid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__test__creator__34C8D9D1]') AND parent_object_id = OBJECT_ID(N'[dbo].[test]'))
ALTER TABLE [dbo].[test] CHECK CONSTRAINT [FK__test__creator__34C8D9D1]
GO
/****** Object:  ForeignKey [FK__test_ques__testi__35BCFE0A]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__test_ques__testi__35BCFE0A]') AND parent_object_id = OBJECT_ID(N'[dbo].[test_question]'))
ALTER TABLE [dbo].[test_question]  WITH CHECK ADD  CONSTRAINT [FK__test_ques__testi__35BCFE0A] FOREIGN KEY([testid])
REFERENCES [dbo].[test] ([testid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__test_ques__testi__35BCFE0A]') AND parent_object_id = OBJECT_ID(N'[dbo].[test_question]'))
ALTER TABLE [dbo].[test_question] CHECK CONSTRAINT [FK__test_ques__testi__35BCFE0A]
GO
/****** Object:  ForeignKey [FK__test_questi__qid__36B12243]    Script Date: 11/12/2010 20:05:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__test_questi__qid__36B12243]') AND parent_object_id = OBJECT_ID(N'[dbo].[test_question]'))
ALTER TABLE [dbo].[test_question]  WITH CHECK ADD  CONSTRAINT [FK__test_questi__qid__36B12243] FOREIGN KEY([qid])
REFERENCES [dbo].[questionDescriptor] ([qid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__test_questi__qid__36B12243]') AND parent_object_id = OBJECT_ID(N'[dbo].[test_question]'))
ALTER TABLE [dbo].[test_question] CHECK CONSTRAINT [FK__test_questi__qid__36B12243]
GO
