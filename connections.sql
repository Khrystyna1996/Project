/*
   10 травня 2016 р.0:24:15
   User: 
   Server: Я-ПК\SQLEXPRESS
   Database: DB
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Genres SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Singers ADD CONSTRAINT
	FK_Singers_Genres FOREIGN KEY
	(
	Genres_id
	) REFERENCES dbo.Genres
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Singers SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Authors SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Supported_languages SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Albums ADD CONSTRAINT
	FK_Albums_Singers FOREIGN KEY
	(
	Singer_id
	) REFERENCES dbo.Singers
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Albums SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Translations ADD CONSTRAINT
	FK_Translations_Supported_languages FOREIGN KEY
	(
	Language_id
	) REFERENCES dbo.Supported_languages
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Translations ADD CONSTRAINT
	FK_Translations_Authors FOREIGN KEY
	(
	Author_id
	) REFERENCES dbo.Authors
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Translations SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Songs ADD CONSTRAINT
	FK_Songs_Albums FOREIGN KEY
	(
	Album_id
	) REFERENCES dbo.Albums
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Songs ADD CONSTRAINT
	FK_Songs_Translations FOREIGN KEY
	(
	Translation_id
	) REFERENCES dbo.Translations
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Songs SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Idioms ADD CONSTRAINT
	FK_Idioms_Songs FOREIGN KEY
	(
	Song_id
	) REFERENCES dbo.Songs
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Idioms SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
