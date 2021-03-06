/**********************************************************************/
/* InstallGalleryServerProSql2005.sql                              

** Copyright Tech Info Systems, LLC 2010. All Rights Reserved.
																		 
 Installs the tables, stored procedures, user-defined functions, and roles necessary for  
 core Gallery Server Pro operation. This script runs on SQL Server 2005 and later.
 
 There are several sections:
 1. Delete database role, tables, stored procedures, and user-defined functions related to 
		Gallery Server Pro. Does not delete ASP.NET Membership, Role, or Profile objects. 
 
 2. Create role, tables, stored procedures, and user-defined functions.
 
 3. Configure permissions for the database role gs_GalleryServerProRole
 
 4. Add ASP.NET Membership, Role, or Profile database roles to GSP role (gs_GalleryServerProRole).

 5. Populate with initial data.
 
 NOTES:
 1. To manually execute this script you must perform a search and replace operation
		for {schema} and {objectQualifier}.
		{schema} - This is the schema that the database objects belong to. If you are not
		sure what to use, use "[dbo]." (without the quotes).
		{objectQualifier} - This is a prefix that is prepended to each database object name.
		May be replaced with an empty string, in which case all objects will begin with "gs_", "FK_", "PK_", or "UC_".
		
	2. (Note to DotNetNuke developer) When porting this script to the DotNetNuke module:
		a) Do not include section 4.
		b) Replace the text {schema} with {databaseOwner}.
		c) Section 1 can be used for the uninstall script.

*/
/**********************************************************************/

/**********************************************************************/
/*                             BEGIN SECTION 1                        */
/*                                                                    */
/* Drop role, tables, stored procedures, and user-defined functions.  */
/**********************************************************************/
/****** Object:  ForeignKey [{objectQualifier}FK_gs_MediaQueue_gs_MediaObject]   ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MediaQueue_gs_MediaObject]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaQueue]'))
ALTER TABLE {schema}[{objectQualifier}gs_MediaQueue] DROP CONSTRAINT [{objectQualifier}FK_gs_MediaQueue_gs_MediaObject]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_Album_gs_Gallery]    Script Date: 09/26/2010 19:02:29 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Album_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Album]'))
ALTER TABLE {schema}[{objectQualifier}gs_Album] DROP CONSTRAINT [{objectQualifier}FK_gs_Album_gs_Gallery]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_AppError_gs_Gallery]    Script Date: 09/26/2010 19:02:29 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_AppError_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppError]'))
ALTER TABLE {schema}[{objectQualifier}gs_AppError] DROP CONSTRAINT [{objectQualifier}FK_gs_AppError_gs_Gallery]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_GallerySetting_gs_Gallery]    Script Date: 09/26/2010 19:02:29 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_GallerySetting_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GallerySetting]'))
ALTER TABLE {schema}[{objectQualifier}gs_GallerySetting] DROP CONSTRAINT [{objectQualifier}FK_gs_GallerySetting_gs_Gallery]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_MediaObject_gs_Album]    Script Date: 09/26/2010 19:02:29 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MediaObject_gs_Album]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObject]'))
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] DROP CONSTRAINT [{objectQualifier}FK_gs_MediaObject_gs_Album]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_MediaObjectMetadata_gs_MediaObject]    Script Date: 09/26/2010 19:02:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MediaObjectMetadata_gs_MediaObject]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadata]'))
ALTER TABLE {schema}[{objectQualifier}gs_MediaObjectMetadata] DROP CONSTRAINT [{objectQualifier}FK_gs_MediaObjectMetadata_gs_MediaObject]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_MimeTypeGallery_gs_Gallery]    Script Date: 09/26/2010 19:02:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MimeTypeGallery_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeGallery]'))
ALTER TABLE {schema}[{objectQualifier}gs_MimeTypeGallery] DROP CONSTRAINT [{objectQualifier}FK_gs_MimeTypeGallery_gs_Gallery]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_MimeTypeGallery_gs_MimeType]    Script Date: 09/26/2010 19:02:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MimeTypeGallery_gs_MimeType]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeGallery]'))
ALTER TABLE {schema}[{objectQualifier}gs_MimeTypeGallery] DROP CONSTRAINT [{objectQualifier}FK_gs_MimeTypeGallery_gs_MimeType]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_Role_Album_gs_Album]    Script Date: 09/26/2010 19:02:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Role_Album_gs_Album]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_Album]'))
ALTER TABLE {schema}[{objectQualifier}gs_Role_Album] DROP CONSTRAINT [{objectQualifier}FK_gs_Role_Album_gs_Album]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_Role_Album_gs_Role]    Script Date: 09/26/2010 19:02:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Role_Album_gs_Role]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_Album]'))
ALTER TABLE {schema}[{objectQualifier}gs_Role_Album] DROP CONSTRAINT [{objectQualifier}FK_gs_Role_Album_gs_Role]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_Synchronize_gs_Gallery]    Script Date: 09/26/2010 19:02:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Synchronize_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Synchronize]'))
ALTER TABLE {schema}[{objectQualifier}gs_Synchronize] DROP CONSTRAINT [{objectQualifier}FK_gs_Synchronize_gs_Gallery]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_UserGalleryProfile_gs_Gallery]    Script Date: 09/26/2010 19:02:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_UserGalleryProfile_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_UserGalleryProfile]'))
ALTER TABLE {schema}[{objectQualifier}gs_UserGalleryProfile] DROP CONSTRAINT [{objectQualifier}FK_gs_UserGalleryProfile_gs_Gallery]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_DeleteData]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_DeleteData]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_DeleteData]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_ExportGalleryData]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_ExportGalleryData]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_ExportGalleryData]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GalleryDelete]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GalleryDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_GalleryDelete]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectMetadataDelete]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadataDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MediaObjectMetadataDelete]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectMetadataDeleteByMediaObjectId]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadataDeleteByMediaObjectId]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MediaObjectMetadataDeleteByMediaObjectId]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectMetadataInsert]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadataInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MediaObjectMetadataInsert]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectMetadataSelect]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadataSelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MediaObjectMetadataSelect]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectMetadataUpdate]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadataUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MediaObjectMetadataUpdate]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AlbumSelectAll]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AlbumSelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_AlbumSelectAll]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_SearchGallery]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_SearchGallery]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_SearchGallery]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_SelectChildMediaObjects]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_SelectChildMediaObjects]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_SelectChildMediaObjects]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_Role_AlbumDelete]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_AlbumDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_Role_AlbumDelete]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_Role_AlbumInsert]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_AlbumInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_Role_AlbumInsert]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_Role_AlbumSelectRootAlbumsByRoleName]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_AlbumSelectRootAlbumsByRoleName]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_Role_AlbumSelectRootAlbumsByRoleName]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_RoleDelete]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_RoleDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_RoleDelete]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectSelect]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectSelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MediaObjectSelect]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectSelectHashKeys]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectSelectHashKeys]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MediaObjectSelectHashKeys]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectUpdate]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MediaObjectUpdate]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GalleryConfig]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GalleryConfig]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_GalleryConfig]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectDelete]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MediaObjectDelete]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectInsert]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MediaObjectInsert]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_MediaObjectMetadata]    Script Date: 09/26/2010 19:02:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MediaObjectMetadata_gs_MediaObject]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadata]'))
ALTER TABLE {schema}[{objectQualifier}gs_MediaObjectMetadata] DROP CONSTRAINT [{objectQualifier}FK_gs_MediaObjectMetadata_gs_MediaObject]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadata]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_MediaObjectMetadata]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_ExportMembership]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_ExportMembership]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_ExportMembership]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AlbumDelete]    Script Date: 09/26/2010 19:02:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AlbumDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_AlbumDelete]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AlbumInsert]    Script Date: 09/26/2010 19:02:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AlbumInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_AlbumInsert]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AlbumSelect]    Script Date: 09/26/2010 19:02:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AlbumSelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_AlbumSelect]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AlbumUpdate]    Script Date: 09/26/2010 19:02:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AlbumUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_AlbumUpdate]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AppErrorDelete]    Script Date: 09/26/2010 19:02:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppErrorDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_AppErrorDelete]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AppErrorDeleteAll]    Script Date: 09/26/2010 19:02:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppErrorDeleteAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_AppErrorDeleteAll]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AppErrorInsert]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppErrorInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_AppErrorInsert]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AppErrorSelect]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppErrorSelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_AppErrorSelect]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaQueueDelete]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaQueueDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MediaQueueDelete]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaQueueInsert]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaQueueInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MediaQueueInsert]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaQueueSelect]    ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaQueueSelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MediaQueueSelect]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaQueueUpdate]    ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaQueueUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MediaQueueUpdate]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_MediaObject]    Script Date: 09/26/2010 19:02:29 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MediaObject_gs_Album]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObject]'))
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] DROP CONSTRAINT [{objectQualifier}FK_gs_MediaObject_gs_Album]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_MediaObject_Title]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] DROP CONSTRAINT [DF_gs_MediaObject_Title]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_MediaObject_HashKey]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] DROP CONSTRAINT [DF_gs_MediaObject_HashKey]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_MediaObject_ThumbnailFilename]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] DROP CONSTRAINT [DF_gs_MediaObject_ThumbnailFilename]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_MediaObject_ThumbnailWidth]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] DROP CONSTRAINT [DF_gs_MediaObject_ThumbnailWidth]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_MediaObject_ThumbnailHeight]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] DROP CONSTRAINT [DF_gs_MediaObject_ThumbnailHeight]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_MediaObject_OptimizedFilename]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] DROP CONSTRAINT [DF_gs_MediaObject_OptimizedFilename]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_MediaObject_OptimizedWidth]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] DROP CONSTRAINT [DF_gs_MediaObject_OptimizedWidth]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_MediaObject_OptimizedHeight]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] DROP CONSTRAINT [DF_gs_MediaObject_OptimizedHeight]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_MediaObject_OriginalFilename]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] DROP CONSTRAINT [DF_gs_MediaObject_OriginalFilename]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_MediaObject_OriginalWidth]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] DROP CONSTRAINT [DF_gs_MediaObject_OriginalWidth]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_MediaObject_OriginalHeight]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] DROP CONSTRAINT [DF_gs_MediaObject_OriginalHeight]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_MediaObject_IsPrivate]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] DROP CONSTRAINT [DF_gs_MediaObject_IsPrivate]
END
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaQueue]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_MediaQueue]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObject]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_MediaObject]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GallerySettingSelect]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GallerySettingSelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_GallerySettingSelect]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GallerySettingUpdate]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GallerySettingUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_GallerySettingUpdate]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MimeTypeGallerySelect]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeGallerySelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MimeTypeGallerySelect]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MimeTypeGalleryUpdate]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeGalleryUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MimeTypeGalleryUpdate]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_Role_Album]    Script Date: 09/26/2010 19:02:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Role_Album_gs_Album]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_Album]'))
ALTER TABLE {schema}[{objectQualifier}gs_Role_Album] DROP CONSTRAINT [{objectQualifier}FK_gs_Role_Album_gs_Album]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Role_Album_gs_Role]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_Album]'))
ALTER TABLE {schema}[{objectQualifier}gs_Role_Album] DROP CONSTRAINT [{objectQualifier}FK_gs_Role_Album_gs_Role]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_Album]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_Role_Album]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_RoleUpdate]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_RoleUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_RoleUpdate]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_SelectChildAlbums]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_SelectChildAlbums]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_SelectChildAlbums]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_SynchronizeSave]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_SynchronizeSave]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_SynchronizeSave]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_SynchronizeSelect]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_SynchronizeSelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_SynchronizeSelect]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_UserGalleryProfileDeleteForGallery]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_UserGalleryProfileDeleteForGallery]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_UserGalleryProfileDeleteForGallery]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_UserGalleryProfileDeleteForUser]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_UserGalleryProfileDeleteForUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_UserGalleryProfileDeleteForUser]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_UserGalleryProfileSave]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_UserGalleryProfileSave]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_UserGalleryProfileSave]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_UserGalleryProfileSelect]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_UserGalleryProfileSelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_UserGalleryProfileSelect]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_UserGalleryProfile]    Script Date: 09/26/2010 19:02:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_UserGalleryProfile_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_UserGalleryProfile]'))
ALTER TABLE {schema}[{objectQualifier}gs_UserGalleryProfile] DROP CONSTRAINT [{objectQualifier}FK_gs_UserGalleryProfile_gs_Gallery]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_UserGalleryProfile]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_UserGalleryProfile]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_BrowserTemplateSelect]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_BrowserTemplateSelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_BrowserTemplateSelect]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GalleryControlSettingSelect]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GalleryControlSettingSelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_GalleryControlSettingSelect]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GalleryControlSettingUpdate]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GalleryControlSettingUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_GalleryControlSettingUpdate]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_Synchronize]    Script Date: 09/26/2010 19:02:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Synchronize_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Synchronize]'))
ALTER TABLE {schema}[{objectQualifier}gs_Synchronize] DROP CONSTRAINT [{objectQualifier}FK_gs_Synchronize_gs_Gallery]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Synchronize]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_Synchronize]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_RoleInsert]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_RoleInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_RoleInsert]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_RoleSelect]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_RoleSelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_RoleSelect]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MimeTypeSelect]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeSelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_MimeTypeSelect]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GalleryUpdate]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GalleryUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_GalleryUpdate]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_MimeTypeGallery]    Script Date: 09/26/2010 19:02:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MimeTypeGallery_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeGallery]'))
ALTER TABLE {schema}[{objectQualifier}gs_MimeTypeGallery] DROP CONSTRAINT [{objectQualifier}FK_gs_MimeTypeGallery_gs_Gallery]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MimeTypeGallery_gs_MimeType]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeGallery]'))
ALTER TABLE {schema}[{objectQualifier}gs_MimeTypeGallery] DROP CONSTRAINT [{objectQualifier}FK_gs_MimeTypeGallery_gs_MimeType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeGallery]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_MimeTypeGallery]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GalleryInsert]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GalleryInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_GalleryInsert]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GallerySelect]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GallerySelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_GallerySelect]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_GallerySetting]    Script Date: 09/26/2010 19:02:29 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_GallerySetting_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GallerySetting]'))
ALTER TABLE {schema}[{objectQualifier}gs_GallerySetting] DROP CONSTRAINT [{objectQualifier}FK_gs_GallerySetting_gs_Gallery]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GallerySetting]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_GallerySetting]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AppSettingSelect]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppSettingSelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_AppSettingSelect]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AppSettingUpdate]    Script Date: 09/26/2010 19:02:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppSettingUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE {schema}[{objectQualifier}gs_AppSettingUpdate]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Album_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Album]'))
ALTER TABLE {schema}[{objectQualifier}gs_Album] DROP CONSTRAINT [{objectQualifier}FK_gs_Album_gs_Gallery]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_Album_Title]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_Album] DROP CONSTRAINT [DF_gs_Album_Title]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_Album_DirectoryName]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_Album] DROP CONSTRAINT [DF_gs_Album_DirectoryName]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_Album_Summary]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_Album] DROP CONSTRAINT [DF_gs_Album_Summary]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_Album_ThumbnailMediaObjectId]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_Album] DROP CONSTRAINT [DF_gs_Album_ThumbnailMediaObjectId]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_gs_Album_IsPrivate]') AND type = 'D')
BEGIN
ALTER TABLE {schema}[{objectQualifier}gs_Album] DROP CONSTRAINT [DF_gs_Album_IsPrivate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Album]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_Album]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_AppError]    Script Date: 09/26/2010 19:02:29 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_AppError_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppError]'))
ALTER TABLE {schema}[{objectQualifier}gs_AppError] DROP CONSTRAINT [{objectQualifier}FK_gs_AppError_gs_Gallery]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppError]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_AppError]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_BrowserTemplate]    Script Date: 09/26/2010 19:02:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_BrowserTemplate]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_BrowserTemplate]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_AppSetting]    Script Date: 09/26/2010 19:02:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppSetting]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_AppSetting]
GO
/****** Object:  UserDefinedFunction {schema}[{objectQualifier}gs_func_convert_string_array_to_table]    Script Date: 09/26/2010 19:02:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_func_convert_string_array_to_table]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION {schema}[{objectQualifier}gs_func_convert_string_array_to_table]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_Gallery]    Script Date: 09/26/2010 19:02:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Gallery]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_Gallery]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_GalleryControlSetting]    Script Date: 09/26/2010 19:02:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GalleryControlSetting]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_GalleryControlSetting]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_MimeType]    Script Date: 09/26/2010 19:02:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeType]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_MimeType]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_Role]    Script Date: 09/26/2010 19:02:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role]') AND type in (N'U'))
DROP TABLE {schema}[{objectQualifier}gs_Role]
GO
/****** Object:  Role [{objectQualifier}gs_GalleryServerProRole]    Script Date: 09/26/2010 19:02:34 ******/
DECLARE @RoleName sysname
set @RoleName = N'{objectQualifier}gs_GalleryServerProRole'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'{objectQualifier}gs_GalleryServerProRole' AND type = 'R')
DROP ROLE [{objectQualifier}gs_GalleryServerProRole]
GO

/**********************************************************************/
/*                             END SECTION 1                          */
/**********************************************************************/

/**********************************************************************/
/*                             BEGIN SECTION 2                        */
/*                                                                    */
/* Create role, tables, stored procedures, and user-defined functions.*/
/**********************************************************************/

/****** Object:  Role [{objectQualifier}gs_GalleryServerProRole]    Script Date: 09/26/2010 19:02:34 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'{objectQualifier}gs_GalleryServerProRole' AND type = 'R')
CREATE ROLE [{objectQualifier}gs_GalleryServerProRole]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_Role]    Script Date: 09/26/2010 19:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaQueue]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_MediaQueue] (
	[MediaQueueId] [int] IDENTITY(1, 1), 
	[FKMediaObjectId] [int] NOT NULL,
	[Status] [nvarchar](256) NOT NULL,
	[StatusDetail] [ntext] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[DateConversionStarted] [datetime] NULL,
	[DateConversionCompleted] [datetime] NULL,
 CONSTRAINT [{objectQualifier}PK_gs_MediaQueue] PRIMARY KEY CLUSTERED 
(
	[MediaQueueId] ASC
) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table {schema}[{objectQualifier}gs_Role]    Script Date: 09/26/2010 19:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_Role](
	[RoleName] [nvarchar](256) NOT NULL,
	[AllowViewAlbumsAndObjects] [bit] NOT NULL,
	[AllowViewOriginalImage] [bit] NOT NULL,
	[AllowAddChildAlbum] [bit] NOT NULL,
	[AllowAddMediaObject] [bit] NOT NULL,
	[AllowEditAlbum] [bit] NOT NULL,
	[AllowEditMediaObject] [bit] NOT NULL,
	[AllowDeleteChildAlbum] [bit] NOT NULL,
	[AllowDeleteMediaObject] [bit] NOT NULL,
	[AllowSynchronize] [bit] NOT NULL,
	[HideWatermark] [bit] NOT NULL,
	[AllowAdministerGallery] [bit] NOT NULL,
	[AllowAdministerSite] [bit] NOT NULL,
 CONSTRAINT [{objectQualifier}PK_gs_Role] PRIMARY KEY CLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table {schema}[{objectQualifier}gs_MimeType]    Script Date: 09/26/2010 19:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeType]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_MimeType](
	[MimeTypeId] [int] IDENTITY(1,1) NOT NULL,
	[FileExtension] [nvarchar](10) NOT NULL,
	[MimeTypeValue] [nvarchar](200) NOT NULL,
	[BrowserMimeTypeValue] [nvarchar](200) NOT NULL,
 CONSTRAINT [{objectQualifier}PK_gs_MimeType] PRIMARY KEY CLUSTERED 
(
	[MimeTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [{objectQualifier}UC_gs_MimeType_FileExtension] UNIQUE NONCLUSTERED 
(
	[FileExtension] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table {schema}[{objectQualifier}gs_GalleryControlSetting]    Script Date: 09/26/2010 19:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GalleryControlSetting]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_GalleryControlSetting](
	[GalleryControlSettingId] [int] IDENTITY(1,1) NOT NULL,
	[ControlId] [nvarchar](350) NOT NULL,
	[SettingName] [varchar](200) NOT NULL,
	[SettingValue] [nvarchar](max) NOT NULL,
 CONSTRAINT [{objectQualifier}PK_gs_GalleryControlSetting] PRIMARY KEY CLUSTERED 
(
	[GalleryControlSettingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [{objectQualifier}UC_gs_GalleryControlSetting_ControlId_SettingName] UNIQUE NONCLUSTERED 
(
	[ControlId] ASC,
	[SettingName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table {schema}[{objectQualifier}gs_Gallery]    Script Date: 09/26/2010 19:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Gallery]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_Gallery](
	[GalleryId] [int] IDENTITY(0,1) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [{objectQualifier}PK_gs_Gallery] PRIMARY KEY CLUSTERED 
(
	[GalleryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  UserDefinedFunction {schema}[{objectQualifier}gs_func_convert_string_array_to_table]    Script Date: 09/26/2010 19:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_func_convert_string_array_to_table]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION {schema}[{objectQualifier}gs_func_convert_string_array_to_table]
								 (@list      nvarchar(MAX),
									@delimiter nchar(1) = N'','')
			RETURNS @tbl TABLE (listpos int IDENTITY(1, 1) NOT NULL,
													str     varchar(4000) COLLATE database_default NOT NULL,
													nstr    nvarchar(2000) COLLATE database_default NOT NULL) AS

BEGIN
	 DECLARE @endpos   int,
					 @startpos int,
					 @textpos  int,
					 @chunklen smallint,
					 @tmpstr   nvarchar(4000),
					 @leftover nvarchar(4000),
					 @tmpval   nvarchar(4000)

	 SET @textpos = 1
	 SET @leftover = ''''
	 WHILE @textpos <= datalength(@list) / 2
	 BEGIN
			SET @chunklen = 4000 - datalength(@leftover) / 2
			SET @tmpstr = @leftover + substring(@list, @textpos, @chunklen)
			SET @textpos = @textpos + @chunklen

			SET @startpos = 0
			SET @endpos = charindex(@delimiter, @tmpstr)

			WHILE @endpos > 0
			BEGIN
				 SET @tmpval = ltrim(rtrim(substring(@tmpstr, @startpos + 1,
																						 @endpos - @startpos - 1)))
				 INSERT @tbl (str, nstr) VALUES(@tmpval, @tmpval)
				 SET @startpos = @endpos
				 SET @endpos = charindex(@delimiter,
																 @tmpstr, @startpos + 1)
			END

			SET @leftover = right(@tmpstr, datalength(@tmpstr) / 2 - @startpos)
	 END

	 INSERT @tbl(str, nstr)
			VALUES (ltrim(rtrim(@leftover)), ltrim(rtrim(@leftover)))
	 RETURN
END' 
END
GO
/****** Object:  Table {schema}[{objectQualifier}gs_AppSetting]    Script Date: 09/26/2010 19:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppSetting]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_AppSetting](
	[AppSettingId] [int] IDENTITY(1,1) NOT NULL,
	[SettingName] [varchar](200) NOT NULL,
	[SettingValue] [nvarchar](max) NOT NULL,
 CONSTRAINT [{objectQualifier}PK_gs_AppSetting] PRIMARY KEY CLUSTERED 
(
	[AppSettingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table {schema}[{objectQualifier}gs_BrowserTemplate]    Script Date: 09/26/2010 19:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_BrowserTemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_BrowserTemplate](
	[BrowserTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[MimeType] [nvarchar](200) NOT NULL,
	[BrowserId] [nvarchar](50) NOT NULL,
	[HtmlTemplate] [nvarchar](max) NOT NULL,
	[ScriptTemplate] [nvarchar](max) NOT NULL,
 CONSTRAINT [{objectQualifier}PK_gs_BrowserTemplate] PRIMARY KEY CLUSTERED 
(
	[BrowserTemplateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [{objectQualifier}UC_gs_BrowserTemplate_MimeType_BrowserId] UNIQUE NONCLUSTERED 
(
	[MimeType] ASC,
	[BrowserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table {schema}[{objectQualifier}gs_AppError]    Script Date: 09/26/2010 19:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppError]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_AppError](
	[AppErrorId] [int] IDENTITY(1,1) NOT NULL,
	[FKGalleryId] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[ExceptionType] [nvarchar](1000) NOT NULL,
	[Message] [nvarchar](4000) NOT NULL,
	[Source] [nvarchar](1000) NOT NULL,
	[TargetSite] [nvarchar](max) NOT NULL,
	[StackTrace] [nvarchar](max) NOT NULL,
	[ExceptionData] [nvarchar](max) NOT NULL,
	[InnerExType] [nvarchar](1000) NOT NULL,
	[InnerExMessage] [nvarchar](4000) NOT NULL,
	[InnerExSource] [nvarchar](1000) NOT NULL,
	[InnerExTargetSite] [nvarchar](max) NOT NULL,
	[InnerExStackTrace] [nvarchar](max) NOT NULL,
	[InnerExData] [nvarchar](max) NOT NULL,
	[Url] [nvarchar](1000) NOT NULL,
	[FormVariables] [nvarchar](max) NOT NULL,
	[Cookies] [nvarchar](max) NOT NULL,
	[SessionVariables] [nvarchar](max) NOT NULL,
	[ServerVariables] [nvarchar](max) NOT NULL,
 CONSTRAINT [{objectQualifier}PK_gs_AppError] PRIMARY KEY CLUSTERED 
(
	[AppErrorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppError]') AND name = N'IDX_gs_AppError_FKGalleryId')
CREATE NONCLUSTERED INDEX [IDX_gs_AppError_FKGalleryId] ON {schema}[{objectQualifier}gs_AppError] 
(
	[FKGalleryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table {schema}[{objectQualifier}gs_Album]    Script Date: 09/26/2010 19:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Album]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_Album](
	[AlbumId] [int] IDENTITY(1,1) NOT NULL,
	[FKGalleryId] [int] NOT NULL,
	[AlbumParentId] [int] NOT NULL,
	[Title] [nvarchar](1000) NOT NULL CONSTRAINT [DF_gs_Album_Title]  DEFAULT (''),
	[DirectoryName] [nvarchar](255) NOT NULL CONSTRAINT [DF_gs_Album_DirectoryName]  DEFAULT (''),
	[Summary] [nvarchar](max) NOT NULL CONSTRAINT [DF_gs_Album_Summary]  DEFAULT (''),
	[ThumbnailMediaObjectId] [int] NOT NULL CONSTRAINT [DF_gs_Album_ThumbnailMediaObjectId]  DEFAULT ((0)),
	[Seq] [int] NOT NULL,
	[DateStart] [datetime] NULL,
	[DateEnd] [datetime] NULL,
	[DateAdded] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[LastModifiedBy] [nvarchar](256) NOT NULL,
	[DateLastModified] [datetime] NOT NULL,
	[OwnedBy] [nvarchar](256) NOT NULL,
	[OwnerRoleName] [nvarchar](256) NOT NULL,
	[IsPrivate] [bit] NOT NULL CONSTRAINT [DF_gs_Album_IsPrivate]  DEFAULT ((0)),
 CONSTRAINT [{objectQualifier}PK_gs_Album] PRIMARY KEY CLUSTERED 
(
	[AlbumId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Album]') AND name = N'IDX_gs_Album_AlbumParentId_FKGalleryId')
CREATE NONCLUSTERED INDEX [IDX_gs_Album_AlbumParentId_FKGalleryId] ON {schema}[{objectQualifier}gs_Album] 
(
	[AlbumParentId] ASC,
	[FKGalleryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Album]') AND name = N'IDX_gs_Album_AlbumId')
CREATE NONCLUSTERED INDEX [IDX_gs_Album_AlbumId] ON {schema}[{objectQualifier}gs_Album] 
(
	[AlbumId] ASC
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaQueueDelete]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaQueueDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MediaQueueDelete]
( @MediaQueueId int )
AS

DELETE FROM {schema}[{objectQualifier}gs_MediaQueue]
WHERE MediaQueueId = @MediaQueueId' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaQueueInsert]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaQueueInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MediaQueueInsert]
(@FKMediaObjectId int,@Status nvarchar(256),@StatusDetail nvarchar(max),
 @DateAdded datetime,@DateConversionStarted datetime,@DateConversionCompleted datetime,
 @Identity int OUT)
AS
SET NOCOUNT ON

INSERT INTO {schema}[{objectQualifier}gs_MediaQueue]
 ([FKMediaObjectId],[Status],[StatusDetail],[DateAdded],[DateConversionStarted],[DateConversionCompleted])
VALUES
 (@FKMediaObjectId,@Status,@StatusDetail,@DateAdded,@DateConversionStarted,@DateConversionCompleted)

SET @Identity = SCOPE_IDENTITY()

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaQueueSelect]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaQueueSelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MediaQueueSelect]
AS
SET NOCOUNT ON

SELECT
 [MediaQueueId],[FKMediaObjectId],[Status],[StatusDetail],
 [DateAdded],[DateConversionStarted],[DateConversionCompleted]
FROM {schema}[{objectQualifier}gs_MediaQueue]
ORDER BY DateAdded;

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaQueueUpdate]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaQueueUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MediaQueueUpdate]
(@MediaQueueId int, @FKMediaObjectId int,@Status nvarchar(256),@StatusDetail nvarchar(max),
 @DateAdded datetime,@DateConversionStarted datetime,@DateConversionCompleted datetime)
AS
SET NOCOUNT ON

UPDATE {schema}[{objectQualifier}gs_MediaQueue]
SET
 [FKMediaObjectId] = @FKMediaObjectId,
 [Status] = @Status,
 [StatusDetail] = @StatusDetail,
 [DateAdded] = @DateAdded,
 [DateConversionStarted] = @DateConversionStarted,
 [DateConversionCompleted] = @DateConversionCompleted
WHERE MediaQueueId = @MediaQueueId' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AppSettingUpdate]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppSettingUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_AppSettingUpdate]
(@SettingName varchar(200), @SettingValue nvarchar(max))

AS

UPDATE {schema}[{objectQualifier}gs_AppSetting]
SET SettingValue = @SettingValue
WHERE SettingName = @SettingName;' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AppSettingSelect]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppSettingSelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_AppSettingSelect]

AS
SET NOCOUNT ON

SELECT
	AppSettingId, SettingName, SettingValue
FROM {schema}[{objectQualifier}gs_AppSetting];

RETURN
' 
END
GO
/****** Object:  Table {schema}[{objectQualifier}gs_GallerySetting]    Script Date: 09/26/2010 19:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GallerySetting]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_GallerySetting](
	[GallerySettingId] [int] IDENTITY(1,1) NOT NULL,
	[FKGalleryId] [int] NOT NULL,
	[IsTemplate] [bit] NOT NULL,
	[SettingName] [varchar](200) NOT NULL,
	[SettingValue] [nvarchar](max) NOT NULL,
 CONSTRAINT [{objectQualifier}PK_gs_GallerySetting] PRIMARY KEY CLUSTERED 
(
	[GallerySettingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [{objectQualifier}UC_gs_GallerySetting_FKGalleryId_SettingName] UNIQUE NONCLUSTERED 
(
	[FKGalleryId] ASC,
	[SettingName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GallerySelect]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GallerySelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_GallerySelect]

AS
SET NOCOUNT ON

SELECT GalleryId, Description, DateAdded
FROM {schema}[{objectQualifier}gs_Gallery]
WHERE GalleryId > -2147483648;

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GalleryInsert]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GalleryInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_GalleryInsert]
(
	@Description nvarchar(1000), @DateAdded datetime, @Identity int OUT
)
AS
SET NOCOUNT ON

INSERT {schema}[{objectQualifier}gs_Gallery] (Description, DateAdded)
VALUES (@Description, @DateAdded)
 
SET @Identity = SCOPE_IDENTITY()

' 
END
GO
/****** Object:  Table {schema}[{objectQualifier}gs_MimeTypeGallery]    Script Date: 09/26/2010 19:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeGallery]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_MimeTypeGallery](
	[MimeTypeGalleryId] [int] IDENTITY(1,1) NOT NULL,
	[FKGalleryId] [int] NOT NULL,
	[FKMimeTypeId] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [{objectQualifier}PK_gs_MimeTypeGallery] PRIMARY KEY CLUSTERED 
(
	[MimeTypeGalleryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [{objectQualifier}UC_gs_MimeTypeGallery_FKGalleryId_FKMimeTypeId] UNIQUE NONCLUSTERED 
(
	[FKGalleryId] ASC,
	[FKMimeTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GalleryUpdate]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GalleryUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE {schema}[{objectQualifier}gs_GalleryUpdate]
(
	@GalleryId int, @Description nvarchar(1000)
)
AS
SET NOCOUNT ON

-- Try to update the record. If no record is updated, then insert one.
UPDATE {schema}[{objectQualifier}gs_Gallery]
SET [Description] = @Description
WHERE [GalleryId] = @GalleryId
' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MimeTypeSelect]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeSelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MimeTypeSelect]

AS
SET NOCOUNT ON

SELECT
	MimeTypeId, FileExtension, MimeTypeValue, BrowserMimeTypeValue
FROM {schema}[{objectQualifier}gs_MimeType]
ORDER BY FileExtension;

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_RoleSelect]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_RoleSelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_RoleSelect]

AS
SET NOCOUNT ON

SELECT r.RoleName, r.AllowViewAlbumsAndObjects, r.AllowViewOriginalImage, r.AllowAddChildAlbum,
	r.AllowAddMediaObject, r.AllowEditAlbum, r.AllowEditMediaObject, r.AllowDeleteChildAlbum, 
	r.AllowDeleteMediaObject, r.AllowSynchronize, r.HideWatermark, r.AllowAdministerGallery, 
	r.AllowAdministerSite, ra.FKAlbumId
FROM {schema}[{objectQualifier}gs_Role] r LEFT OUTER JOIN {schema}[{objectQualifier}gs_Role_Album] ra ON r.RoleName = ra.FKRoleName
ORDER BY r.RoleName

RETURN
' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_RoleInsert]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_RoleInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_RoleInsert]
(
	@RoleName nvarchar(256), @AllowViewAlbumsAndObjects bit, @AllowViewOriginalImage bit,
	@AllowAddChildAlbum bit, @AllowAddMediaObject bit, @AllowEditAlbum bit, @AllowEditMediaObject bit,
	@AllowDeleteChildAlbum bit, @AllowDeleteMediaObject bit, @AllowSynchronize bit, @HideWatermark bit,
	@AllowAdministerGallery bit, @AllowAdministerSite bit
)
AS
SET NOCOUNT ON

INSERT {schema}[{objectQualifier}gs_Role] (RoleName, AllowViewAlbumsAndObjects, AllowViewOriginalImage, AllowAddChildAlbum,
	AllowAddMediaObject, AllowEditAlbum, AllowEditMediaObject, AllowDeleteChildAlbum, AllowDeleteMediaObject, 
	AllowSynchronize, HideWatermark, AllowAdministerGallery, AllowAdministerSite)
VALUES (@RoleName, @AllowViewAlbumsAndObjects, @AllowViewOriginalImage, @AllowAddChildAlbum,
	@AllowAddMediaObject, @AllowEditAlbum, @AllowEditMediaObject, @AllowDeleteChildAlbum, @AllowDeleteMediaObject, 
	@AllowSynchronize, @HideWatermark, @AllowAdministerGallery, @AllowAdministerSite)

RETURN
' 
END
GO
/****** Object:  Table {schema}[{objectQualifier}gs_Synchronize]    Script Date: 09/26/2010 19:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Synchronize]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_Synchronize](
	[SynchId] [nchar](50) NOT NULL,
	[FKGalleryId] [int] NOT NULL,
	[SynchState] [int] NOT NULL,
	[TotalFiles] [int] NOT NULL,
	[CurrentFileIndex] [int] NOT NULL,
 CONSTRAINT [{objectQualifier}PK_gs_Synchronize] PRIMARY KEY CLUSTERED 
(
	[SynchId] ASC,
	[FKGalleryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GalleryControlSettingUpdate]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GalleryControlSettingUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_GalleryControlSettingUpdate]
(@ControlId nvarchar(350), @SettingName varchar(200), @SettingValue nvarchar(max))

AS
SET NOCOUNT ON

IF @SettingValue IS NULL
BEGIN
	DELETE FROM {schema}[{objectQualifier}gs_GalleryControlSetting]
	WHERE (ControlId = @ControlId) AND (SettingName = @SettingName)
END
ELSE
BEGIN
	IF EXISTS (SELECT * FROM {schema}[{objectQualifier}gs_GalleryControlSetting] WITH (UPDLOCK, HOLDLOCK)
		WHERE (ControlId = @ControlId) AND (SettingName = @SettingName))
	BEGIN
		-- Record exists. If we have a value, update it; otherwise delete the record.
			UPDATE {schema}[{objectQualifier}gs_GalleryControlSetting]
			SET SettingValue = @SettingValue
			WHERE (ControlId = @ControlId) AND (SettingName = @SettingName)
	END
	ELSE
	BEGIN
		-- Existing record does not exist, so insert it (if we have something to insert)
		INSERT INTO {schema}[{objectQualifier}gs_GalleryControlSetting] (ControlId, SettingName, SettingValue)
		VALUES (@ControlId, @SettingName, @SettingValue)
	END
END' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GalleryControlSettingSelect]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GalleryControlSettingSelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_GalleryControlSettingSelect]

AS
SET NOCOUNT ON

SELECT GalleryControlSettingId, ControlId, SettingName, SettingValue
FROM {schema}[{objectQualifier}gs_GalleryControlSetting]
ORDER BY ControlId

RETURN
' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_BrowserTemplateSelect]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_BrowserTemplateSelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_BrowserTemplateSelect]

AS
SET NOCOUNT ON

SELECT BrowserTemplateId, MimeType, BrowserId, HtmlTemplate, ScriptTemplate
FROM {schema}[{objectQualifier}gs_BrowserTemplate]
ORDER BY MimeType;

RETURN
' 
END
GO
/****** Object:  Table {schema}[{objectQualifier}gs_UserGalleryProfile]    Script Date: 09/26/2010 19:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_UserGalleryProfile]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_UserGalleryProfile](
	[ProfileId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FKGalleryId] [int] NOT NULL,
	[SettingName] [varchar](200) NOT NULL,
	[SettingValue] [nvarchar](max) NOT NULL,
 CONSTRAINT [{objectQualifier}PK_gs_UserGalleryProfile] PRIMARY KEY CLUSTERED 
(
	[ProfileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [{objectQualifier}UC_gs_UserGalleryProfile_UserName_FKGalleryId_SettingName] UNIQUE NONCLUSTERED 
(
	[UserName] ASC,
	[FKGalleryId] ASC,
	[SettingName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_UserGalleryProfileSelect]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_UserGalleryProfileSelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_UserGalleryProfileSelect]
(
	@UserName nvarchar(256)
)

AS
SET NOCOUNT ON

SELECT
	ProfileId, UserName, FKGalleryId, SettingName, SettingValue
FROM {schema}[{objectQualifier}gs_UserGalleryProfile]
WHERE UserName=@UserName
ORDER BY UserName, FKGalleryId;

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_UserGalleryProfileSave]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_UserGalleryProfileSave]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_UserGalleryProfileSave]
	(@UserName nvarchar(256), @GalleryId int, @SettingName varchar(200), @SettingValue nvarchar(max))
AS
SET NOCOUNT, XACT_ABORT ON

/* INSERT or UPDATE the user gallery profile table with the specified data. */
BEGIN TRAN
IF EXISTS (SELECT * FROM {schema}[{objectQualifier}gs_UserGalleryProfile] WITH (UPDLOCK, HOLDLOCK) 
			WHERE UserName = @UserName AND FKGalleryId = @GalleryId and SettingName = @SettingName)
	UPDATE {schema}[{objectQualifier}gs_UserGalleryProfile]
	SET SettingValue = @SettingValue
	WHERE UserName = @UserName AND FKGalleryId = @GalleryId and SettingName = @SettingName
ELSE
	INSERT {schema}[{objectQualifier}gs_UserGalleryProfile] (UserName, FKGalleryId, SettingName, SettingValue)
	VALUES (@UserName, @GalleryId, @SettingName, @SettingValue)
COMMIT
	
RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_UserGalleryProfileDeleteForUser]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_UserGalleryProfileDeleteForUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE {schema}[{objectQualifier}gs_UserGalleryProfileDeleteForUser]
(
	@UserName nvarchar(256)
)
AS
SET NOCOUNT ON
	
DELETE FROM {schema}[{objectQualifier}gs_UserGalleryProfile]
WHERE [UserName] = @UserName' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_UserGalleryProfileDeleteForGallery]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_UserGalleryProfileDeleteForGallery]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE {schema}[{objectQualifier}gs_UserGalleryProfileDeleteForGallery]
(
	@GalleryId int
)
AS
SET NOCOUNT ON
	
DELETE FROM {schema}[{objectQualifier}gs_UserGalleryProfile]
WHERE [FKGalleryId] = @GalleryId' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_SynchronizeSelect]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_SynchronizeSelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_SynchronizeSelect]
(@GalleryId int)
AS
SET NOCOUNT ON

/* Return the synchronize data for the specified gallery. It should contain 1 record. */
SELECT SynchId, FKGalleryId, SynchState, TotalFiles, CurrentFileIndex
FROM {schema}[{objectQualifier}gs_Synchronize]
WHERE FKGalleryId = @GalleryId

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_SynchronizeSave]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_SynchronizeSave]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_SynchronizeSave]
	(@SynchId nchar(50), @GalleryId int, @SynchState int, @TotalFiles int, @CurrentFileIndex int)
AS
SET NOCOUNT, XACT_ABORT ON
/* UPDATE the synchronize table with the specified data. */

/* Check if another synchronization is in progress. Return with error code if it is. */
IF EXISTS (SELECT * FROM {schema}[{objectQualifier}gs_Synchronize] WHERE FKGalleryId = @GalleryId AND SynchId <> @SynchId AND (SynchState = 2 OR SynchState = 3))
BEGIN
	RETURN 250000
END

BEGIN TRAN
IF EXISTS (SELECT * FROM {schema}[{objectQualifier}gs_Synchronize] WITH (UPDLOCK, HOLDLOCK) WHERE FKGalleryId = @GalleryId)
	UPDATE {schema}[{objectQualifier}gs_Synchronize]
	SET SynchId = @SynchId,
		FKGalleryId = @GalleryId,
		SynchState = @SynchState,
		TotalFiles = @TotalFiles,
		CurrentFileIndex = @CurrentFileIndex
	WHERE FKGalleryId = @GalleryId
ELSE
	INSERT {schema}[{objectQualifier}gs_Synchronize] (SynchId, FKGalleryId, SynchState, TotalFiles, CurrentFileIndex)
	VALUES (@SynchId, @GalleryId, @SynchState, @TotalFiles, @CurrentFileIndex)
COMMIT
	
RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_SelectChildAlbums]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_SelectChildAlbums]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_SelectChildAlbums]
(
	@AlbumId int
)
AS
SET NOCOUNT ON

SELECT AlbumId
FROM {schema}[{objectQualifier}gs_Album]
WHERE AlbumParentId = @AlbumId

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_RoleUpdate]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_RoleUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_RoleUpdate] 
(
	@RoleName nvarchar(256), @AllowViewAlbumsAndObjects bit, @AllowViewOriginalImage bit,
	@AllowAddChildAlbum bit, @AllowAddMediaObject bit, @AllowEditAlbum bit, @AllowEditMediaObject bit,
	@AllowDeleteChildAlbum bit, @AllowDeleteMediaObject bit, @AllowSynchronize bit, @HideWatermark bit,
	@AllowAdministerGallery bit, @AllowAdministerSite bit
)
AS
SET NOCOUNT, XACT_ABORT ON

/* Update the specified role. If the role does not exist, assume it is new and call the insert proc. */
BEGIN TRAN
IF EXISTS (SELECT * FROM {schema}[{objectQualifier}gs_Role] WITH (UPDLOCK, HOLDLOCK) WHERE RoleName = @RoleName)
BEGIN
	UPDATE {schema}[{objectQualifier}gs_Role]
	SET AllowViewAlbumsAndObjects = @AllowViewAlbumsAndObjects,
		AllowViewOriginalImage = @AllowViewOriginalImage,
		AllowAddChildAlbum = @AllowAddChildAlbum,
		AllowAddMediaObject = @AllowAddMediaObject,
		AllowEditAlbum = @AllowEditAlbum,
		AllowEditMediaObject = @AllowEditMediaObject,
		AllowDeleteChildAlbum = @AllowDeleteChildAlbum,
		AllowDeleteMediaObject = @AllowDeleteMediaObject,
		AllowSynchronize = @AllowSynchronize,
		HideWatermark = @HideWatermark,
		AllowAdministerGallery = @AllowAdministerGallery,
		AllowAdministerSite = @AllowAdministerSite
	WHERE RoleName = @RoleName
END
ELSE
BEGIN
	EXECUTE {schema}[{objectQualifier}gs_RoleInsert] 
		@RoleName,
		@AllowViewAlbumsAndObjects,
		@AllowViewOriginalImage,
		@AllowAddChildAlbum,
		@AllowAddMediaObject,
		@AllowEditAlbum,
		@AllowEditMediaObject,
		@AllowDeleteChildAlbum,
		@AllowDeleteMediaObject,
		@AllowSynchronize,
		@HideWatermark,
		@AllowAdministerGallery,
		@AllowAdministerSite
END
COMMIT

RETURN
' 
END
GO
/****** Object:  Table {schema}[{objectQualifier}gs_Role_Album]    Script Date: 09/26/2010 19:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_Album]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_Role_Album](
	[FKRoleName] [nvarchar](256) NOT NULL,
	[FKAlbumId] [int] NOT NULL,
 CONSTRAINT [{objectQualifier}PK_gs_Role_Album] PRIMARY KEY CLUSTERED 
(
	[FKRoleName] ASC,
	[FKAlbumId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MimeTypeGalleryUpdate]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeGalleryUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MimeTypeGalleryUpdate]
(@MimeTypeGalleryId int, @IsEnabled bit)

AS

UPDATE {schema}[{objectQualifier}gs_MimeTypeGallery]
SET IsEnabled = @IsEnabled
WHERE MimeTypeGalleryId = @MimeTypeGalleryId;' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MimeTypeGallerySelect]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeGallerySelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MimeTypeGallerySelect]

AS
SET NOCOUNT ON

SELECT mtg.MimeTypeGalleryId, mtg.FKGalleryId, mtg.FKMimeTypeId, mtg.IsEnabled,
 mt.FileExtension, mt.MimeTypeValue, mt.BrowserMimeTypeValue
FROM {schema}[{objectQualifier}gs_MimeType] mt INNER JOIN {schema}[{objectQualifier}gs_MimeTypeGallery] mtg ON mt.MimeTypeId = mtg.FKMimeTypeId
ORDER BY mt.FileExtension;

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GallerySettingUpdate]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GallerySettingUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_GallerySettingUpdate]
(@GalleryId int, @SettingName varchar(200), @SettingValue nvarchar(max))

AS

UPDATE {schema}[{objectQualifier}gs_GallerySetting]
SET SettingValue = @SettingValue
WHERE FKGalleryId = @GalleryId AND SettingName = @SettingName;' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GallerySettingSelect]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GallerySettingSelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_GallerySettingSelect]

AS
SET NOCOUNT ON

SELECT GallerySettingId, FKGalleryId, IsTemplate, SettingName, SettingValue
FROM {schema}[{objectQualifier}gs_GallerySetting]
ORDER BY FKGalleryId;

RETURN
' 
END
GO
/****** Object:  Table {schema}[{objectQualifier}gs_MediaObject]    Script Date: 09/26/2010 19:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObject]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_MediaObject](
	[MediaObjectId] [int] IDENTITY(1,1) NOT NULL,
	[FKAlbumId] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL CONSTRAINT [DF_gs_MediaObject_Title]  DEFAULT (''),
	[HashKey] [nchar](47) NOT NULL CONSTRAINT [DF_gs_MediaObject_HashKey]  DEFAULT (''),
	[ThumbnailFilename] [nvarchar](255) NOT NULL CONSTRAINT [DF_gs_MediaObject_ThumbnailFilename]  DEFAULT (''),
	[ThumbnailWidth] [int] NOT NULL CONSTRAINT [DF_gs_MediaObject_ThumbnailWidth]  DEFAULT ((0)),
	[ThumbnailHeight] [int] NOT NULL CONSTRAINT [DF_gs_MediaObject_ThumbnailHeight]  DEFAULT ((0)),
	[ThumbnailSizeKB] [int] NOT NULL,
	[OptimizedFilename] [nvarchar](255) NOT NULL CONSTRAINT [DF_gs_MediaObject_OptimizedFilename]  DEFAULT (''),
	[OptimizedWidth] [int] NOT NULL CONSTRAINT [DF_gs_MediaObject_OptimizedWidth]  DEFAULT ((0)),
	[OptimizedHeight] [int] NOT NULL CONSTRAINT [DF_gs_MediaObject_OptimizedHeight]  DEFAULT ((0)),
	[OptimizedSizeKB] [int] NOT NULL,
	[OriginalFilename] [nvarchar](255) NOT NULL CONSTRAINT [DF_gs_MediaObject_OriginalFilename]  DEFAULT (''),
	[OriginalWidth] [int] NOT NULL CONSTRAINT [DF_gs_MediaObject_OriginalWidth]  DEFAULT ((0)),
	[OriginalHeight] [int] NOT NULL CONSTRAINT [DF_gs_MediaObject_OriginalHeight]  DEFAULT ((0)),
	[OriginalSizeKB] [int] NOT NULL,
	[ExternalHtmlSource] [nvarchar](max) NOT NULL,
	[ExternalType] [nvarchar](15) NOT NULL,
	[Seq] [int] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[LastModifiedBy] [nvarchar](256) NOT NULL,
	[DateLastModified] [datetime] NOT NULL,
	[IsPrivate] [bit] NOT NULL CONSTRAINT [DF_gs_MediaObject_IsPrivate]  DEFAULT ((0)),
 CONSTRAINT [{objectQualifier}PK_gs_MediaObject] PRIMARY KEY CLUSTERED 
(
	[MediaObjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObject]') AND name = N'IDX_gs_MediaObject_FKAlbumId')
CREATE NONCLUSTERED INDEX [IDX_gs_MediaObject_FKAlbumId] ON {schema}[{objectQualifier}gs_MediaObject] 
(
	[FKAlbumId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObject]') AND name = N'IDX_gs_MediaObject_MediaObjectId_FKAlbumId')
CREATE NONCLUSTERED INDEX [IDX_gs_MediaObject_MediaObjectId_FKAlbumId] ON {schema}[{objectQualifier}gs_MediaObject] 
( 
 [OriginalFilename] ASC
)
 INCLUDE ([MediaObjectId], [FKAlbumId])
 WITH (PAD_INDEX=OFF, STATISTICS_NORECOMPUTE=OFF, SORT_IN_TEMPDB=OFF, IGNORE_DUP_KEY=OFF, DROP_EXISTING=OFF, ONLINE=OFF, ALLOW_ROW_LOCKS=ON, ALLOW_PAGE_LOCKS=ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AppErrorSelect]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppErrorSelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_AppErrorSelect]

AS
SET NOCOUNT ON;

SELECT
	AppErrorId, FKGalleryId, [TimeStamp], ExceptionType, [Message], [Source], TargetSite, StackTrace, ExceptionData, 
	InnerExType, InnerExMessage, InnerExSource, InnerExTargetSite, InnerExStackTrace, InnerExData, Url, 
	FormVariables, Cookies, SessionVariables, ServerVariables
FROM {schema}[{objectQualifier}gs_AppError]
' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AppErrorInsert]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppErrorInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_AppErrorInsert]
	(@GalleryId int, @TimeStamp datetime, @ExceptionType nvarchar (1000),
	@Message nvarchar (4000), @Source nvarchar (1000), @TargetSite nvarchar (max),
	@StackTrace nvarchar (max), @ExceptionData nvarchar (max), @InnerExType nvarchar (1000),
	@InnerExMessage nvarchar (4000), @InnerExSource nvarchar (1000), @InnerExTargetSite nvarchar (max),
	@InnerExStackTrace nvarchar (max), @InnerExData nvarchar (max), @Url nvarchar (1000),
	@FormVariables nvarchar (max), @Cookies nvarchar (max), @SessionVariables nvarchar (max),
	@ServerVariables nvarchar (max), @Identity int OUT)
AS

/* Insert a new application error. */
INSERT {schema}[{objectQualifier}gs_AppError]
	(FKGalleryId, [TimeStamp], ExceptionType, [Message], [Source], TargetSite, StackTrace, ExceptionData, InnerExType, 
	InnerExMessage, InnerExSource, InnerExTargetSite, InnerExStackTrace, InnerExData, Url, 
	FormVariables, Cookies, SessionVariables, ServerVariables)
VALUES (@GalleryId, @TimeStamp, @ExceptionType, @Message, @Source, @TargetSite, @StackTrace, @ExceptionData, @InnerExType, 
	@InnerExMessage, @InnerExSource, @InnerExTargetSite, @InnerExStackTrace, @InnerExData, @Url,
	@FormVariables, @Cookies, @SessionVariables, @ServerVariables)

SET @Identity = SCOPE_IDENTITY()

RETURN
' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AppErrorDeleteAll]    Script Date: 09/26/2010 19:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppErrorDeleteAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_AppErrorDeleteAll]
(
	@GalleryId int
)
AS
/* Delete all application errors for the gallery, including errors not associated with any gallery */
DELETE {schema}[{objectQualifier}gs_AppError]
WHERE FKGalleryId IN (@GalleryId, -2147483648);
' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AppErrorDelete]    Script Date: 09/26/2010 19:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppErrorDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_AppErrorDelete]
(
	@AppErrorId int
)
AS
/* Delete application error */
DELETE {schema}[{objectQualifier}gs_AppError]
WHERE AppErrorId = @AppErrorId
' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AlbumUpdate]    Script Date: 09/26/2010 19:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AlbumUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_AlbumUpdate]
(@AlbumId int, @FKGalleryId int, @AlbumParentId int, @Title nvarchar(1000), @DirectoryName nvarchar(255),
 @Summary nvarchar(max), @ThumbnailMediaObjectId int,  @Seq int, 
 @DateStart datetime, @DateEnd datetime, @LastModifiedBy nvarchar(256), 
 @DateLastModified datetime, @OwnedBy nvarchar(256), @OwnerRoleName nvarchar(256), @IsPrivate bit)
 
AS
SET NOCOUNT ON

UPDATE {schema}[{objectQualifier}gs_Album]
SET
	FKGalleryId = @FKGalleryId,
	AlbumParentId = @AlbumParentId,
	Title = @Title,
	DirectoryName = @DirectoryName,
	Summary = @Summary,
	ThumbnailMediaObjectId = @ThumbnailMediaObjectId,
	Seq = @Seq,
	DateStart = @DateStart,
	DateEnd = @DateEnd,
	LastModifiedBy = @LastModifiedBy,
	DateLastModified = @DateLastModified,
	OwnedBy = @OwnedBy,
	OwnerRoleName = @OwnerRoleName,
	IsPrivate = @IsPrivate
WHERE (AlbumId = @AlbumId)

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AlbumSelect]    Script Date: 09/26/2010 19:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AlbumSelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_AlbumSelect]
(
	@AlbumId int
)
AS
SET NOCOUNT ON

SELECT
	AlbumId, FKGalleryId as GalleryId, AlbumParentId, Title, DirectoryName, Summary, ThumbnailMediaObjectId, 
	Seq, DateStart, DateEnd, CreatedBy, DateAdded, LastModifiedBy, DateLastModified, OwnedBy, OwnerRoleName, IsPrivate
FROM {schema}[{objectQualifier}gs_Album]
WHERE AlbumId = @AlbumId

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AlbumInsert]    Script Date: 09/26/2010 19:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AlbumInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_AlbumInsert]
(@AlbumParentId int, @GalleryId int, @Title nvarchar(1000), @DirectoryName nvarchar(255),
 @Summary nvarchar(max), @ThumbnailMediaObjectId int, @Seq int, 
 @DateStart datetime, @DateEnd datetime, @CreatedBy nvarchar(256), @DateAdded datetime, 
 @LastModifiedBy nvarchar(256), @DateLastModified datetime, @OwnedBy nvarchar(256),
 @OwnerRoleName nvarchar(256), @IsPrivate bit, @Identity int OUT)
AS
/* Insert a new album. */
INSERT {schema}[{objectQualifier}gs_Album] (AlbumParentId, FKGalleryId, Title, DirectoryName, 
 Summary, ThumbnailMediaObjectId, Seq, DateStart, DateEnd, 
 CreatedBy, DateAdded, LastModifiedBy, DateLastModified, OwnedBy, 
 OwnerRoleName, IsPrivate)
VALUES (@AlbumParentId, @GalleryId, @Title, @DirectoryName, 
 @Summary, @ThumbnailMediaObjectId, @Seq, @DateStart, @DateEnd, 
 @CreatedBy, @DateAdded, @LastModifiedBy, @DateLastModified, @OwnedBy, 
 @OwnerRoleName, @IsPrivate)

SET @Identity = SCOPE_IDENTITY()' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AlbumDelete]    Script Date: 09/26/2010 19:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AlbumDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_AlbumDelete]
	@AlbumId int
AS
SET NOCOUNT ON
/* Delete the specified album and its objects, including any child albums.  Instead of using 
built-in cascading delete features of the database, we delete all objects manually. This is
primarily because SQL Server does not support cascade delete for hierarchal tables, which is
how album data is stored (the AlbumParentId field refers to the AlbumId field).*/

/* First, build a table containing this album ID and all child album IDs. */
CREATE TABLE #a (aid int, apid int, processed int)

/* Insert this album into our temporary table. */
INSERT #a 
	SELECT AlbumId, AlbumParentId, 0
	FROM {schema}[{objectQualifier}gs_Album] WHERE AlbumId = @AlbumId

/* Set up a loop where we insert the children of the first album, and their children, and so on, until no 
children are left. The end result is that the table is filled with info about @AlbumId and all his descendents.
The processed field in #a represents the # of levels from the bottom. Thus the records
with the MAX processed value is @AlbumId, and the records with the MIN level (should always be 1)
represent the most distant descendents. */
WHILE EXISTS (SELECT * FROM #a WHERE processed = 0)
BEGIN
	/* Insert the children of all albums in #a into the table. We use the ''processed = 0'' criterion because we
	only want to get the children once. Each loop increases the value of the processed field by one.  */
	INSERT #a SELECT AlbumId, AlbumParentId, -1
		FROM {schema}[{objectQualifier}gs_Album] WHERE AlbumParentId IN 
			(SELECT aid FROM #a WHERE processed = 0)
	
	/* Increment the processed value to preserve the heiarchy of albums. */
	UPDATE #a SET processed = processed + 1
END

/* At this point #a contains info about @AlbumId and all his descendents. Delete all media objects 
and roles associated with these albums, and then delete the albums. */
BEGIN TRAN
	DELETE {schema}[{objectQualifier}gs_MediaObject] WHERE FKAlbumId IN (SELECT aid FROM #a)
	
	/* Only delete role_album and album records that are not associated with the root album. */
	DELETE {schema}[{objectQualifier}gs_Role_Album] WHERE FKAlbumId IN (SELECT aid FROM #a WHERE apid <> 0)
	
	DELETE {schema}[{objectQualifier}gs_Album] WHERE AlbumId IN (SELECT aid FROM #a WHERE apid <> 0)
COMMIT TRAN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_ExportMembership]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_ExportMembership]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_ExportMembership]
AS
SET NOCOUNT ON

SELECT ApplicationName, LoweredApplicationName, ApplicationId, Description
FROM aspnet_Applications

SELECT ApplicationId, UserId, Password, PasswordFormat, PasswordSalt, MobilePIN, Email, LoweredEmail, PasswordQuestion, PasswordAnswer, IsApproved, 
 IsLockedOut, CreateDate, LastLoginDate, LastPasswordChangedDate, LastLockoutDate, FailedPasswordAttemptCount, FailedPasswordAttemptWindowStart, 
 FailedPasswordAnswerAttemptCount, FailedPasswordAnswerAttemptWindowStart, Comment
FROM aspnet_Membership

SELECT UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate
FROM aspnet_Profile

SELECT ApplicationId, RoleId, RoleName, LoweredRoleName, Description
FROM aspnet_Roles

SELECT ApplicationId, UserId, UserName, LoweredUserName, MobileAlias, IsAnonymous, LastActivityDate
FROM aspnet_Users

SELECT UserId, RoleId
FROM aspnet_UsersInRoles

RETURN' 
END
GO
/****** Object:  Table {schema}[{objectQualifier}gs_MediaObjectMetadata]    Script Date: 09/26/2010 19:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadata]') AND type in (N'U'))
BEGIN
CREATE TABLE {schema}[{objectQualifier}gs_MediaObjectMetadata](
	[MediaObjectMetadataId] [int] IDENTITY(1,1) NOT NULL,
	[FKMediaObjectId] [int] NOT NULL,
	[MetadataNameIdentifier] [int] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [{objectQualifier}PK_gs_MediaObjectMetadata] PRIMARY KEY CLUSTERED 
(
	[MediaObjectMetadataId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadata]') AND name = N'IDX_gs_MediaObjectMetadata_FKMediaObjectId')
CREATE NONCLUSTERED INDEX [IDX_gs_MediaObjectMetadata_FKMediaObjectId] ON {schema}[{objectQualifier}gs_MediaObjectMetadata] 
(
	[FKMediaObjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectInsert]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MediaObjectInsert]
(@HashKey char(47), @FKAlbumId int, @ThumbnailFilename nvarchar(255), 
 @ThumbnailWidth int, @ThumbnailHeight int,
 @ThumbnailSizeKB int, @OptimizedFilename nvarchar(255), 
 @OptimizedWidth int, @OptimizedHeight int,
 @OptimizedSizeKB int, @OriginalFilename nvarchar(255),	 
 @OriginalWidth int, @OriginalHeight int, @OriginalSizeKB int, 
 @ExternalHtmlSource nvarchar(max), @ExternalType nvarchar(15),
 @Title nvarchar(max), @Seq int, @CreatedBy nvarchar(256), @DateAdded datetime, 
 @LastModifiedBy nvarchar(256), @DateLastModified datetime, @IsPrivate bit,
 @Identity int OUT)
AS

/* Insert media object information. */
 INSERT {schema}[{objectQualifier}gs_MediaObject] (HashKey, FKAlbumId, ThumbnailFilename, ThumbnailWidth, ThumbnailHeight,
 ThumbnailSizeKB, OptimizedFilename, OptimizedWidth, OptimizedHeight, OptimizedSizeKB,
 OriginalFilename, OriginalWidth, OriginalHeight, OriginalSizeKB, ExternalHtmlSource, ExternalType, Title, Seq, CreatedBy, 
 DateAdded, LastModifiedBy, DateLastModified, IsPrivate)
VALUES (@HashKey, @FKAlbumId, @ThumbnailFilename, @ThumbnailWidth, @ThumbnailHeight,
 @ThumbnailSizeKB, @OptimizedFilename, @OptimizedWidth, @OptimizedHeight, @OptimizedSizeKB,
 @OriginalFilename, @OriginalWidth, @OriginalHeight, @OriginalSizeKB, @ExternalHtmlSource, @ExternalType, @Title, @Seq, @CreatedBy, 
 @DateAdded, @LastModifiedBy, @DateLastModified, @IsPrivate)
 
SET @Identity = SCOPE_IDENTITY()' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectDelete]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MediaObjectDelete]
(
	@MediaObjectId int
)
AS
SET NOCOUNT ON
/* Delete the specified media object. */
DELETE {schema}[{objectQualifier}gs_MediaObject]
WHERE MediaObjectId = @MediaObjectId

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GalleryConfig]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GalleryConfig]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_GalleryConfig]
(
	@GalleryId int, @RootAlbumTitle nvarchar(1000),	@RootAlbumSummary nvarchar(max)
)
AS
SET NOCOUNT, XACT_ABORT ON

BEGIN TRAN

-- Verify the gallery record exists.
IF NOT EXISTS (SELECT * FROM {schema}[{objectQualifier}gs_Gallery] WITH (UPDLOCK, HOLDLOCK) WHERE GalleryId = @GalleryId)
BEGIN
	SET IDENTITY_INSERT {schema}[{objectQualifier}gs_Gallery] ON

	INSERT INTO {schema}[{objectQualifier}gs_Gallery] ([GalleryId], [Description], [DateAdded]) VALUES (@GalleryId, ''My Gallery'', GETDATE());

	SET IDENTITY_INSERT {schema}[{objectQualifier}gs_Gallery] OFF
END

-- Create a new set of gallery settings by copying the template settings (do nothing if already present).
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] (FKGalleryId, IsTemplate, SettingName, SettingValue)
SELECT @GalleryId, 0, t.SettingName, t.SettingValue
FROM {schema}[{objectQualifier}gs_GallerySetting] t
WHERE t.IsTemplate = 1
	AND t.SettingName NOT IN 
		(SELECT g.SettingName FROM {schema}[{objectQualifier}gs_GallerySetting] g
		 WHERE g.FKGalleryId = @GalleryId);

-- Create a new set of gallery MIME types (do nothing if already present).
IF NOT EXISTS (SELECT * FROM {schema}[{objectQualifier}gs_MimeTypeGallery] WITH (UPDLOCK, HOLDLOCK) WHERE FKGalleryId = @GalleryId)
BEGIN
	-- No records exist. Copy the whole set from our template list and enable .jpg and .jpeg
	INSERT INTO {schema}[{objectQualifier}gs_MimeTypeGallery] (FKGalleryId, FKMimeTypeId, IsEnabled)
	SELECT @GalleryId, MimeTypeId, 0
	FROM {schema}[{objectQualifier}gs_MimeType];
	
	-- Configure .jpg and .jpeg as enabled by default
	UPDATE {schema}[{objectQualifier}gs_MimeTypeGallery]
	SET IsEnabled = 1
	WHERE FKGalleryId = @GalleryId AND FKMimeTypeId IN (SELECT MimeTypeId FROM {schema}[{objectQualifier}gs_MimeType] WHERE FileExtension IN (''.jpg'', ''.jpeg''));
END
ELSE
BEGIN
	-- At least one record exists, but make sure we insert any new items that may have been
	-- added to the template list.
	INSERT INTO {schema}[{objectQualifier}gs_MimeTypeGallery] (FKGalleryId, FKMimeTypeId, IsEnabled)
	SELECT @GalleryId, mt.MimeTypeId, 0
	FROM {schema}[{objectQualifier}gs_MimeType] mt
	WHERE mt.MimeTypeId NOT IN
		(SELECT mtg.FKMimeTypeId FROM {schema}[{objectQualifier}gs_MimeTypeGallery] mtg
		 WHERE mtg.FKGalleryId = @GalleryId);
END

-- Create the root album.
INSERT INTO {schema}[{objectQualifier}gs_Album] (AlbumParentId, FKGalleryId, Title, DirectoryName, Summary, ThumbnailMediaObjectId, Seq, CreatedBy, DateAdded, LastModifiedBy, DateLastModified, OwnedBy, OwnerRoleName, IsPrivate)
SELECT 0, @GalleryId, @RootAlbumTitle, '''', @RootAlbumSummary, 0, 0, ''System'', GETDATE(), ''System'', GETDATE(), '''', '''', ''0''
WHERE NOT EXISTS (SELECT * FROM {schema}[{objectQualifier}gs_Album] WHERE AlbumParentId = 0 AND FKGalleryId = @GalleryId);

-- For each role with AllowAdministerSite permission, add a corresponding record in gs_Role_Album giving it 
-- access to the root album.
DECLARE @RootAlbumId int
SELECT @RootAlbumId = AlbumId FROM {schema}[{objectQualifier}gs_Album] WHERE AlbumParentId = 0 AND FKGalleryId = @GalleryId;

INSERT INTO {schema}[{objectQualifier}gs_Role_Album] (FKRoleName, FKAlbumId)
SELECT R.RoleName, @RootAlbumId
FROM {schema}[{objectQualifier}gs_Role] R LEFT JOIN {schema}[{objectQualifier}gs_Role_Album] RA ON R.RoleName = RA.FKRoleName
WHERE R.AllowAdministerSite = 1 AND RA.FKRoleName IS NULL;

-- Insert a record into the synch table if it doesn''t already exist.
INSERT INTO {schema}[{objectQualifier}gs_Synchronize]
SELECT '''', g.GalleryId, 1, 0, 0
FROM {schema}[{objectQualifier}gs_Gallery] g LEFT OUTER JOIN {schema}[{objectQualifier}gs_Synchronize] s
	ON g.GalleryId = s.FKGalleryId
WHERE (g.GalleryId = @GalleryId) AND (s.FKGalleryId IS NULL);

-- Now update it to default values. This is redundant when the previous insert inserted a record,
-- but is necessary for resetting previously existing records.
UPDATE {schema}[{objectQualifier}gs_Synchronize]
SET SynchId = '''', SynchState = 1, TotalFiles = 0, CurrentFileIndex = 0
WHERE FKGalleryId = @GalleryId

COMMIT

' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectUpdate]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MediaObjectUpdate]
(
 @MediaObjectId int, @HashKey char(47), @FKAlbumId int, 
 @ThumbnailFilename nvarchar(255), @ThumbnailWidth int, @ThumbnailHeight int, @ThumbnailSizeKB int,
 @OriginalFilename nvarchar(255),	@OriginalWidth int, @OriginalHeight int, @OriginalSizeKB int, 
 @OptimizedFilename nvarchar(255),	@OptimizedWidth int, @OptimizedHeight int, @OptimizedSizeKB int, 
 @ExternalHtmlSource nvarchar(max), @ExternalType nvarchar(15),
 @Title nvarchar(max), @Seq int, @LastModifiedBy nvarchar(256), @DateLastModified datetime, @IsPrivate bit
)
AS
SET NOCOUNT ON

/* Update the media object. */
UPDATE {schema}[{objectQualifier}gs_MediaObject]
SET HashKey = @HashKey, FKAlbumId = @FKAlbumId,
 ThumbnailFilename = @ThumbnailFilename, ThumbnailWidth = @ThumbnailWidth, 
 ThumbnailHeight = @ThumbnailHeight, ThumbnailSizeKB = @ThumbnailSizeKB,
 OptimizedFilename = @OptimizedFilename, OptimizedWidth = @OptimizedWidth,
 OptimizedHeight = @OptimizedHeight, OptimizedSizeKB = @OptimizedSizeKB, 
 OriginalFilename = @OriginalFilename, OriginalWidth = @OriginalWidth,
 OriginalHeight = @OriginalHeight, OriginalSizeKB = @OriginalSizeKB, 
 ExternalHtmlSource = @ExternalHtmlSource, ExternalType = @ExternalType,
 Title = @Title, Seq = @Seq, LastModifiedBy = @LastModifiedBy, 
 DateLastModified = @DateLastModified, IsPrivate = @IsPrivate
WHERE MediaObjectId = @MediaObjectId' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectSelectHashKeys]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectSelectHashKeys]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MediaObjectSelectHashKeys]

AS
SET NOCOUNT ON

SELECT HashKey
FROM {schema}[{objectQualifier}gs_MediaObject]

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectSelect]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectSelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MediaObjectSelect]
(
	@MediaObjectId int
)
AS
SET NOCOUNT ON

SELECT
	MediaObjectId, FKAlbumId, Title, HashKey, ThumbnailFilename, ThumbnailWidth, ThumbnailHeight, 
	ThumbnailSizeKB, OptimizedFilename, OptimizedWidth, OptimizedHeight, OptimizedSizeKB, 
	OriginalFilename, OriginalWidth, OriginalHeight, OriginalSizeKB, ExternalHtmlSource, ExternalType, Seq, 
	CreatedBy, DateAdded, LastModifiedBy, DateLastModified, IsPrivate
FROM {schema}[{objectQualifier}gs_MediaObject]
WHERE MediaObjectId = @MediaObjectId

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_RoleDelete]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_RoleDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_RoleDelete]
( @RoleName nvarchar(256) )
AS
/* Delete a gallery server role. This procedure only deletes it from the custom gallery server tables,
not the ASP.NET role membership table(s). The web application code that invokes this procedure also
uses the standard ASP.NET technique to delete the role from the membership table(s). */

-- First delete the records from the role/album association table.
DELETE {schema}[{objectQualifier}gs_Role_Album]
WHERE FKRoleName = @RoleName

-- Finally delete the role.
DELETE {schema}[{objectQualifier}gs_Role]
WHERE RoleName = @RoleName
' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_Role_AlbumSelectRootAlbumsByRoleName]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_AlbumSelectRootAlbumsByRoleName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_Role_AlbumSelectRootAlbumsByRoleName]
(	@RoleName nvarchar(256) )

AS
SET NOCOUNT ON

SELECT FKAlbumId
FROM {schema}[{objectQualifier}gs_Role_Album] 
WHERE FKRoleName = @RoleName

RETURN
' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_Role_AlbumInsert]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_AlbumInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_Role_AlbumInsert]
(
	@RoleName nvarchar(256), @AlbumId int
)
AS
SET NOCOUNT ON

INSERT {schema}[{objectQualifier}gs_Role_Album] (FKRoleName, FKAlbumId)
VALUES (@RoleName, @AlbumId)

RETURN
' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_Role_AlbumDelete]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_AlbumDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_Role_AlbumDelete]
(
	@RoleName nvarchar(256), @AlbumId int
)
AS
SET NOCOUNT ON

DELETE FROM {schema}[{objectQualifier}gs_Role_Album]
WHERE FKRoleName = @RoleName AND FKAlbumId = @AlbumId

RETURN
' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_SelectChildMediaObjects]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_SelectChildMediaObjects]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_SelectChildMediaObjects]
(
	@AlbumId int
)
AS
SET NOCOUNT ON

SELECT 
	MediaObjectId, FKAlbumId, Title, HashKey, ThumbnailFilename, ThumbnailWidth, ThumbnailHeight, 
	ThumbnailSizeKB, OptimizedFilename, OptimizedWidth, OptimizedHeight, OptimizedSizeKB, 
	OriginalFilename, OriginalWidth, OriginalHeight, OriginalSizeKB, ExternalHtmlSource, ExternalType, Seq, 
	CreatedBy, DateAdded, LastModifiedBy, DateLastModified, IsPrivate
FROM {schema}[{objectQualifier}gs_MediaObject]
WHERE FKAlbumId = @AlbumId

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_SearchGallery]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_SearchGallery]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_SearchGallery]
(     @SearchTerms nvarchar(4000), @GalleryId int)
AS
SET NOCOUNT ON

/* Search for albums and media objects that match the specified search
terms. The album or media object must match
ALL search terms to be considered a match. There is no ''OR'' capability. For
albums, the Title and Summary columns 
are searched. For media objects, the Title and OriginalFilename columns and
all metadata in the MediaObjectMetadata 
tables is searched.

Inputs:
@SearchTerms - A comma-delimited set of search terms. May include spaces.
Ex: "cat,dog", "cat videos, dog videos"
	Multiple words in a single search term (such as "cat videos" in the
previous example) are treated as a phrase
	that must be matched, exactly like how Google treats phrases contained in
quotation marks. That is, "cat videos"
	requires the phrase "cat videos" to appear somewhere in the data, and it
will not match "cat and dog videos"
	(to match "cat and dog videos", you can use "cat,videos").
@GalleryId - The ID of the gallery to search.

Returns:
Returns a set of records with two columns:
gotype - A single character containing either ''a'' for album or ''m'' for media
object. Indicates whether the id
				 stored in the second column is an album or media object.
id - The ID of a matching album or media object.

Algorithm:
The search follows these steps:
1. Create a temporary table #searchTerms and insert the search terms into
it, prepending and appending the wildcard
	 character (%). Ex: If @SearchTerms = "cat videos,dog,fish", #searchTerms
will get 3 records: %cat videos%,
	 %dog%, %fish%.
2. Create a second temporary table #searchResults to hold intermediate
search results.
3. Insert into #searchResults all albums where the title matches one of more
search terms. There will be one record
	 inserted for each matching search term. Ex: If @SearchTerms = "cat
videos,dog,fish" and the album title =
	 "My dog and cat videos", there will be two records inserted into
#searchResults, one with matchingSearchTerm =
	 "%cat videos%" and the other "%dog%" (gotype=''a'', id=album ID,
fieldname=''Album.Title'' for both).
4. Repeat the above step for other fields: Album.Summary, MediaObject.Title,
MediaObject.OriginalFilename, and
	 all media object metadata for each media object
5. Select those records from #searchResults where we made a successful match
for EVERY search term for each album or
	 media object.
	 
Note: The fieldname column in #searchResults is not used except for manual
debugging purposes. This column can
be removed if desired. 
*/

CREATE TABLE #searchTerms (searchTerm nvarchar(4000) COLLATE database_default)
CREATE TABLE #searchResults (
			gotype char(1), 
			id int, 
			fieldname nvarchar(50) COLLATE database_default, 
			matchingSearchTerm nvarchar(3000) COLLATE database_default)

INSERT #searchTerms
SELECT ''%'' + nstr + ''%'' FROM
{schema}[{objectQualifier}gs_func_convert_string_array_to_table](@SearchTerms, '','')

-- Search album title
INSERT #searchResults
SELECT ''a'', a.AlbumId, ''Album.Title'', ''%'' + SUBSTRING(a.Title,
PATINDEX(#searchTerms.searchTerm, a.Title),
LEN(#searchTerms.searchTerm) - 2) + ''%''
 FROM {schema}[{objectQualifier}gs_Album] a CROSS JOIN #searchTerms
 WHERE a.FKGalleryId = @GalleryId AND a.Title LIKE #searchTerms.searchTerm

-- Search album summary
INSERT #searchResults
SELECT ''a'', a.AlbumId, ''Album.Summary'', ''%'' + SUBSTRING(a.Summary,
PATINDEX(#searchTerms.searchTerm, a.Summary), LEN(#searchTerms.searchTerm) -
2) + ''%''
 FROM {schema}[{objectQualifier}gs_Album] a CROSS JOIN #searchTerms
 WHERE a.FKGalleryId = @GalleryId AND a.Summary LIKE #searchTerms.searchTerm

-- Search media object title
INSERT #searchResults
SELECT ''m'', m.MediaObjectId, ''MediaObject.Title'', ''%'' +
SUBSTRING(m.Title, PATINDEX(#searchTerms.searchTerm,
m.Title), LEN(#searchTerms.searchTerm) - 2) + ''%''
 FROM {schema}[{objectQualifier}gs_MediaObject] m JOIN {schema}[{objectQualifier}gs_Album] a
 ON a.AlbumId = m.FKAlbumId CROSS JOIN #searchTerms
 WHERE a.FKGalleryId = @GalleryId AND m.Title LIKE
#searchTerms.searchTerm

-- Search media object original filename
INSERT #searchResults
SELECT ''m'', m.MediaObjectId, ''MediaObject.OriginalFilename'',
''%'' + SUBSTRING(m.OriginalFilename,
PATINDEX(#searchTerms.searchTerm, m.OriginalFilename),
LEN(#searchTerms.searchTerm) - 2) + ''%''
 FROM {schema}[{objectQualifier}gs_MediaObject] m JOIN {schema}[{objectQualifier}gs_Album] a ON a.AlbumId =
m.FKAlbumId CROSS JOIN #searchTerms
 WHERE a.FKGalleryId = @GalleryId AND m.OriginalFilename
LIKE #searchTerms.searchTerm --AND 0=1

-- Search media object metadata
INSERT #searchResults
SELECT DISTINCT ''m'', m.MediaObjectId, ''MediaObjectMetadata'',
''%'' + SUBSTRING(md.Value,
PATINDEX(#searchTerms.searchTerm, md.Value),
LEN(#searchTerms.searchTerm) - 2) + ''%''
 FROM {schema}[{objectQualifier}gs_MediaObjectMetadata] md JOIN {schema}[{objectQualifier}gs_MediaObject] m
 ON md.FKMediaObjectId = m.MediaObjectId
JOIN {schema}[{objectQualifier}gs_Album] a
 ON a.AlbumId = m.FKAlbumId CROSS JOIN #searchTerms
 WHERE a.FKGalleryId = @GalleryId AND md.Value
LIKE #searchTerms.searchTerm

-- Uncomment for debug purposes:
--SELECT * from #searchTerms
--SELECT * FROM #searchResults

SELECT sr.gotype, sr.id
FROM #searchTerms AS st INNER JOIN (SELECT DISTINCT gotype, id,
matchingSearchTerm FROM #searchResults) AS sr ON st.searchTerm =
sr.matchingSearchTerm
GROUP BY sr.gotype, sr.id
HAVING (COUNT(*) >= (SELECT COUNT(*) FROM #searchTerms))

RETURN
' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_AlbumSelectAll]    Script Date: 05/26/2011 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AlbumSelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_AlbumSelectAll]
(
	@GalleryId int
)
AS
SET NOCOUNT ON

SELECT AlbumId, AlbumParentId
FROM {schema}[{objectQualifier}gs_Album]
WHERE FKGalleryId = @GalleryId

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectMetadataUpdate]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadataUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MediaObjectMetadataUpdate]
(@FKMediaObjectId int, @MetadataNameIdentifier int, @Description nvarchar(200), @Value nvarchar(max),
 @MediaObjectMetadataId int)
AS
SET NOCOUNT ON
/* Update a new media object meta data item */
UPDATE {schema}[{objectQualifier}gs_MediaObjectMetadata]
SET FKMediaObjectId = @FKMediaObjectId,
 MetadataNameIdentifier = @MetadataNameIdentifier,
 Description = @Description,
 Value = @Value
WHERE MediaObjectMetadataId = @MediaObjectMetadataId' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectMetadataSelect]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadataSelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MediaObjectMetadataSelect]
(
	@MediaObjectId int
)
AS
SET NOCOUNT ON

SELECT
	MediaObjectMetadataId, FKMediaObjectId, MetadataNameIdentifier, Description, Value
FROM {schema}[{objectQualifier}gs_MediaObjectMetadata]
WHERE FKMediaObjectId = @MediaObjectId

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectMetadataInsert]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadataInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MediaObjectMetadataInsert]
(@FKMediaObjectId int, @MetadataNameIdentifier int, @Description nvarchar(200), @Value nvarchar(max),
 @Identity int OUT)
AS
/* Insert a new media object meta data item */
INSERT {schema}[{objectQualifier}gs_MediaObjectMetadata] (FKMediaObjectId, MetadataNameIdentifier, Description, Value)
VALUES (@FKMediaObjectId, @MetadataNameIdentifier, @Description, @Value)

SET @Identity = SCOPE_IDENTITY()' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectMetadataDeleteByMediaObjectId]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadataDeleteByMediaObjectId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MediaObjectMetadataDeleteByMediaObjectId]
( @MediaObjectId int )
AS
/* Delete all new metadata items belonging to the specified media object ID. */
DELETE {schema}[{objectQualifier}gs_MediaObjectMetadata]
WHERE FKMediaObjectId = @MediaObjectId' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_MediaObjectMetadataDelete]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadataDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_MediaObjectMetadataDelete]
( @MediaObjectMetadataId int )
AS
/* Delete a new media object meta data item */
DELETE {schema}[{objectQualifier}gs_MediaObjectMetadata]
WHERE MediaObjectMetadataId = @MediaObjectMetadataId' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_GalleryDelete]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GalleryDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE {schema}[{objectQualifier}gs_GalleryDelete]
(
	@GalleryId int
)
AS
SET NOCOUNT, XACT_ABORT ON

BEGIN TRAN

	DELETE FROM {schema}[{objectQualifier}gs_MediaObjectMetadata]
	WHERE FKMediaObjectId IN 
	  (SELECT mo.MediaObjectId
	   FROM {schema}[{objectQualifier}gs_Album] a INNER JOIN {schema}[{objectQualifier}gs_MediaObject] mo ON a.AlbumId = mo.FKAlbumId
	   WHERE a.FKGalleryId = @GalleryId)
	
	DELETE FROM {schema}[{objectQualifier}gs_MediaObject]
	WHERE FKAlbumId IN 
	  (SELECT AlbumId
	   FROM {schema}[{objectQualifier}gs_Album]
	   WHERE FKGalleryId = @GalleryId)
	
	DELETE FROM {schema}[{objectQualifier}gs_Role_Album]
	WHERE FKAlbumId IN 
	  (SELECT AlbumId
	   FROM {schema}[{objectQualifier}gs_Album]
	   WHERE FKGalleryId = @GalleryId)
	
	DELETE FROM {schema}[{objectQualifier}gs_Album]
	WHERE FKGalleryId = @GalleryId
	   
	DELETE FROM {schema}[{objectQualifier}gs_AppError]
	WHERE FKGalleryId = @GalleryId
	   	   
	DELETE FROM {schema}[{objectQualifier}gs_GalleryControlSetting]
	WHERE ControlId IN
	  (SELECT ControlId
	   FROM {schema}[{objectQualifier}gs_GalleryControlSetting]
	   WHERE SettingName = ''GalleryId'' AND SettingValue = @GalleryId)

	DELETE FROM {schema}[{objectQualifier}gs_GallerySetting]
	WHERE FKGalleryId = @GalleryId
	   
	DELETE FROM {schema}[{objectQualifier}gs_MimeTypeGallery]
	WHERE FKGalleryId = @GalleryId
	
	DELETE FROM {schema}[{objectQualifier}gs_Synchronize]
	WHERE FKGalleryId = @GalleryId
		
	DELETE FROM {schema}[{objectQualifier}gs_UserGalleryProfile]
	WHERE FKGalleryId = @GalleryId

	DELETE FROM {schema}[{objectQualifier}gs_Gallery]
	WHERE [GalleryId] = @GalleryId

COMMIT' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_ExportGalleryData]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_ExportGalleryData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_ExportGalleryData]
AS
SET NOCOUNT ON

SELECT AlbumId, FKGalleryId, AlbumParentId, Title, DirectoryName, Summary, ThumbnailMediaObjectId, Seq, DateStart, DateEnd, DateAdded, CreatedBy, 
 LastModifiedBy, DateLastModified, OwnedBy, OwnerRoleName, IsPrivate
FROM {schema}[{objectQualifier}gs_Album]

SELECT GalleryId, Description, DateAdded
FROM {schema}[{objectQualifier}gs_Gallery]

SELECT MediaObjectId, FKAlbumId, Title, HashKey, ThumbnailFilename, ThumbnailWidth, ThumbnailHeight, ThumbnailSizeKB, OptimizedFilename, OptimizedWidth, 
 OptimizedHeight, OptimizedSizeKB, OriginalFilename, OriginalWidth, OriginalHeight, OriginalSizeKB, ExternalHtmlSource, ExternalType, Seq, CreatedBy, 
 DateAdded, LastModifiedBy, DateLastModified, IsPrivate
FROM {schema}[{objectQualifier}gs_MediaObject]

SELECT MediaObjectMetadataId, FKMediaObjectId, MetadataNameIdentifier, Description, Value
FROM {schema}[{objectQualifier}gs_MediaObjectMetadata]

SELECT RoleName, AllowViewAlbumsAndObjects, AllowViewOriginalImage, AllowAddChildAlbum, AllowAddMediaObject, AllowEditAlbum, 
 AllowEditMediaObject, AllowDeleteChildAlbum, AllowDeleteMediaObject, AllowSynchronize, HideWatermark, AllowAdministerGallery,
 AllowAdministerSite
FROM {schema}[{objectQualifier}gs_Role]

SELECT FKRoleName, FKAlbumId
FROM {schema}[{objectQualifier}gs_Role_Album]

SELECT AppErrorId, FKGalleryId, TimeStamp, ExceptionType, Message, Source, TargetSite, StackTrace, ExceptionData, InnerExType, InnerExMessage, InnerExSource, 
 InnerExTargetSite, InnerExStackTrace, InnerExData, Url, FormVariables, Cookies, SessionVariables, ServerVariables
FROM {schema}[{objectQualifier}gs_AppError]

SELECT AppSettingId, SettingName, SettingValue
FROM {schema}[{objectQualifier}gs_AppSetting]

SELECT GalleryControlSettingId, ControlId, SettingName, SettingValue
FROM {schema}[{objectQualifier}gs_GalleryControlSetting]

SELECT GallerySettingId, FKGalleryId, IsTemplate, SettingName, SettingValue
FROM {schema}[{objectQualifier}gs_GallerySetting]

SELECT BrowserTemplateId, MimeType, BrowserId, HtmlTemplate, ScriptTemplate
FROM {schema}[{objectQualifier}gs_BrowserTemplate]

SELECT MimeTypeId, FileExtension, MimeTypeValue, BrowserMimeTypeValue
FROM {schema}[{objectQualifier}gs_MimeType]

SELECT MimeTypeGalleryId, FKGalleryId, FKMimeTypeId, IsEnabled
FROM {schema}[{objectQualifier}gs_MimeTypeGallery]

SELECT ProfileId, UserName, FKGalleryId, SettingName, SettingValue
FROM {schema}[{objectQualifier}gs_UserGalleryProfile]

RETURN' 
END
GO
/****** Object:  StoredProcedure {schema}[{objectQualifier}gs_DeleteData]    Script Date: 09/26/2010 19:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_DeleteData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE {schema}[{objectQualifier}gs_DeleteData]
(	@DeleteMembershipData bit, @DeleteGalleryData bit	)

AS
SET NOCOUNT ON

IF @DeleteMembershipData = 1
BEGIN
	DELETE FROM dbo.[aspnet_UsersInRoles]
	DELETE FROM dbo.[aspnet_Profile]
	DELETE FROM dbo.[aspnet_Membership]
	DELETE FROM dbo.[aspnet_Users]
	DELETE FROM dbo.[aspnet_Roles]
	DELETE FROM dbo.[aspnet_Applications]
END

IF @DeleteGalleryData = 1 
BEGIN
	DELETE FROM {schema}[{objectQualifier}gs_UserGalleryProfile]
	DELETE FROM {schema}[{objectQualifier}gs_MediaObjectMetadata]
	DELETE FROM {schema}[{objectQualifier}gs_MediaObject]
	DELETE FROM {schema}[{objectQualifier}gs_Role_Album]
	DELETE FROM {schema}[{objectQualifier}gs_Role]
	DELETE FROM {schema}[{objectQualifier}gs_Album]
	DELETE FROM {schema}[{objectQualifier}gs_AppError]
	DELETE FROM {schema}[{objectQualifier}gs_AppSetting]
	DELETE FROM {schema}[{objectQualifier}gs_GalleryControlSetting]
	DELETE FROM {schema}[{objectQualifier}gs_GallerySetting]
	DELETE FROM {schema}[{objectQualifier}gs_BrowserTemplate]
	DELETE FROM {schema}[{objectQualifier}gs_MimeTypeGallery]
	DELETE FROM {schema}[{objectQualifier}gs_MimeType]
	DELETE FROM {schema}[{objectQualifier}gs_Synchronize]
	DELETE FROM {schema}[{objectQualifier}gs_Gallery]
END

RETURN' 
END
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_MediaQueue_gs_MediaObject]  ******/
ALTER TABLE {schema}[{objectQualifier}gs_MediaQueue] WITH NOCHECK
ADD CONSTRAINT [{objectQualifier}FK_gs_MediaQueue_gs_MediaObject] FOREIGN KEY([FKMediaObjectId])
REFERENCES {schema}[{objectQualifier}gs_MediaObject] ([MediaObjectId])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_Album_gs_Gallery]    Script Date: 09/26/2010 19:02:29 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Album_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Album]'))
ALTER TABLE {schema}[{objectQualifier}gs_Album]  WITH NOCHECK ADD  CONSTRAINT [{objectQualifier}FK_gs_Album_gs_Gallery] FOREIGN KEY([FKGalleryId])
REFERENCES {schema}[{objectQualifier}gs_Gallery] ([GalleryId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Album_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Album]'))
ALTER TABLE {schema}[{objectQualifier}gs_Album] CHECK CONSTRAINT [{objectQualifier}FK_gs_Album_gs_Gallery]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_AppError_gs_Gallery]    Script Date: 09/26/2010 19:02:29 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_AppError_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppError]'))
ALTER TABLE {schema}[{objectQualifier}gs_AppError]  WITH CHECK ADD  CONSTRAINT [{objectQualifier}FK_gs_AppError_gs_Gallery] FOREIGN KEY([FKGalleryId])
REFERENCES {schema}[{objectQualifier}gs_Gallery] ([GalleryId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_AppError_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_AppError]'))
ALTER TABLE {schema}[{objectQualifier}gs_AppError] CHECK CONSTRAINT [{objectQualifier}FK_gs_AppError_gs_Gallery]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_GallerySetting_gs_Gallery]    Script Date: 09/26/2010 19:02:29 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_GallerySetting_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GallerySetting]'))
ALTER TABLE {schema}[{objectQualifier}gs_GallerySetting]  WITH CHECK ADD  CONSTRAINT [{objectQualifier}FK_gs_GallerySetting_gs_Gallery] FOREIGN KEY([FKGalleryId])
REFERENCES {schema}[{objectQualifier}gs_Gallery] ([GalleryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_GallerySetting_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_GallerySetting]'))
ALTER TABLE {schema}[{objectQualifier}gs_GallerySetting] CHECK CONSTRAINT [{objectQualifier}FK_gs_GallerySetting_gs_Gallery]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_MediaObject_gs_Album]    Script Date: 09/26/2010 19:02:29 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MediaObject_gs_Album]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObject]'))
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject]  WITH NOCHECK ADD  CONSTRAINT [{objectQualifier}FK_gs_MediaObject_gs_Album] FOREIGN KEY([FKAlbumId])
REFERENCES {schema}[{objectQualifier}gs_Album] ([AlbumId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MediaObject_gs_Album]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObject]'))
ALTER TABLE {schema}[{objectQualifier}gs_MediaObject] CHECK CONSTRAINT [{objectQualifier}FK_gs_MediaObject_gs_Album]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_MediaObjectMetadata_gs_MediaObject]    Script Date: 09/26/2010 19:02:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MediaObjectMetadata_gs_MediaObject]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadata]'))
ALTER TABLE {schema}[{objectQualifier}gs_MediaObjectMetadata]  WITH NOCHECK ADD  CONSTRAINT [{objectQualifier}FK_gs_MediaObjectMetadata_gs_MediaObject] FOREIGN KEY([FKMediaObjectId])
REFERENCES {schema}[{objectQualifier}gs_MediaObject] ([MediaObjectId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MediaObjectMetadata_gs_MediaObject]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadata]'))
ALTER TABLE {schema}[{objectQualifier}gs_MediaObjectMetadata] CHECK CONSTRAINT [{objectQualifier}FK_gs_MediaObjectMetadata_gs_MediaObject]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_MimeTypeGallery_gs_Gallery]    Script Date: 09/26/2010 19:02:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MimeTypeGallery_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeGallery]'))
ALTER TABLE {schema}[{objectQualifier}gs_MimeTypeGallery]  WITH NOCHECK ADD  CONSTRAINT [{objectQualifier}FK_gs_MimeTypeGallery_gs_Gallery] FOREIGN KEY([FKGalleryId])
REFERENCES {schema}[{objectQualifier}gs_Gallery] ([GalleryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MimeTypeGallery_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeGallery]'))
ALTER TABLE {schema}[{objectQualifier}gs_MimeTypeGallery] CHECK CONSTRAINT [{objectQualifier}FK_gs_MimeTypeGallery_gs_Gallery]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_MimeTypeGallery_gs_MimeType]    Script Date: 09/26/2010 19:02:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MimeTypeGallery_gs_MimeType]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeGallery]'))
ALTER TABLE {schema}[{objectQualifier}gs_MimeTypeGallery]  WITH NOCHECK ADD  CONSTRAINT [{objectQualifier}FK_gs_MimeTypeGallery_gs_MimeType] FOREIGN KEY([FKMimeTypeId])
REFERENCES {schema}[{objectQualifier}gs_MimeType] ([MimeTypeId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_MimeTypeGallery_gs_MimeType]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MimeTypeGallery]'))
ALTER TABLE {schema}[{objectQualifier}gs_MimeTypeGallery] CHECK CONSTRAINT [{objectQualifier}FK_gs_MimeTypeGallery_gs_MimeType]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_Role_Album_gs_Album]    Script Date: 09/26/2010 19:02:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Role_Album_gs_Album]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_Album]'))
ALTER TABLE {schema}[{objectQualifier}gs_Role_Album]  WITH NOCHECK ADD  CONSTRAINT [{objectQualifier}FK_gs_Role_Album_gs_Album] FOREIGN KEY([FKAlbumId])
REFERENCES {schema}[{objectQualifier}gs_Album] ([AlbumId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Role_Album_gs_Album]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_Album]'))
ALTER TABLE {schema}[{objectQualifier}gs_Role_Album] CHECK CONSTRAINT [{objectQualifier}FK_gs_Role_Album_gs_Album]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_Role_Album_gs_Role]    Script Date: 09/26/2010 19:02:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Role_Album_gs_Role]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_Album]'))
ALTER TABLE {schema}[{objectQualifier}gs_Role_Album]  WITH NOCHECK ADD  CONSTRAINT [{objectQualifier}FK_gs_Role_Album_gs_Role] FOREIGN KEY([FKRoleName])
REFERENCES {schema}[{objectQualifier}gs_Role] ([RoleName])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Role_Album_gs_Role]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Role_Album]'))
ALTER TABLE {schema}[{objectQualifier}gs_Role_Album] CHECK CONSTRAINT [{objectQualifier}FK_gs_Role_Album_gs_Role]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_Synchronize_gs_Gallery]    Script Date: 09/26/2010 19:02:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Synchronize_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Synchronize]'))
ALTER TABLE {schema}[{objectQualifier}gs_Synchronize]  WITH CHECK ADD  CONSTRAINT [{objectQualifier}FK_gs_Synchronize_gs_Gallery] FOREIGN KEY([FKGalleryId])
REFERENCES {schema}[{objectQualifier}gs_Gallery] ([GalleryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_Synchronize_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Synchronize]'))
ALTER TABLE {schema}[{objectQualifier}gs_Synchronize] CHECK CONSTRAINT [{objectQualifier}FK_gs_Synchronize_gs_Gallery]
GO
/****** Object:  ForeignKey [{objectQualifier}FK_gs_UserGalleryProfile_gs_Gallery]    Script Date: 09/26/2010 19:02:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_UserGalleryProfile_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_UserGalleryProfile]'))
ALTER TABLE {schema}[{objectQualifier}gs_UserGalleryProfile]  WITH CHECK ADD  CONSTRAINT [{objectQualifier}FK_gs_UserGalleryProfile_gs_Gallery] FOREIGN KEY([FKGalleryId])
REFERENCES {schema}[{objectQualifier}gs_Gallery] ([GalleryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}FK_gs_UserGalleryProfile_gs_Gallery]') AND parent_object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_UserGalleryProfile]'))
ALTER TABLE {schema}[{objectQualifier}gs_UserGalleryProfile] CHECK CONSTRAINT [{objectQualifier}FK_gs_UserGalleryProfile_gs_Gallery]
GO

/* Create statistics */
IF NOT EXISTS (SELECT * FROM sys.stats WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Album]') AND name = N'STAT_gs_Album_FKGalleryId_AlbumId')
CREATE STATISTICS [STAT_gs_Album_FKGalleryId_AlbumId] ON {schema}[{objectQualifier}gs_Album] ([FKGalleryId], [AlbumId])
GO
IF NOT EXISTS (SELECT * FROM sys.stats WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Album]') AND name = N'STAT_gs_Album_AlbumParentId_FKGalleryId_AlbumId')
CREATE STATISTICS [STAT_gs_Album_AlbumParentId_FKGalleryId_AlbumId] ON {schema}[{objectQualifier}gs_Album] ([AlbumParentId], [FKGalleryId], [AlbumId])
GO
IF NOT EXISTS (SELECT * FROM sys.stats WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_Album]') AND name = N'STAT_gs_Album_AlbumId_AlbumParentId')
CREATE STATISTICS [STAT_gs_Album_AlbumId_AlbumParentId] ON {schema}[{objectQualifier}gs_Album] ([AlbumId], [AlbumParentId])
GO
IF NOT EXISTS (SELECT * FROM sys.stats WHERE object_id = OBJECT_ID(N'{schema}[{objectQualifier}gs_MediaObjectMetadata]') AND name = N'STAT_gs_MediaObjectMetadata_MediaObjectMetadataId_FKMediaObjectId')
CREATE STATISTICS [STAT_gs_MediaObjectMetadata_MediaObjectMetadataId_FKMediaObjectId] ON {schema}[{objectQualifier}gs_MediaObjectMetadata]([MediaObjectMetadataId], [FKMediaObjectId])
GO

/**********************************************************************/
/*                             END SECTION 2                          */
/**********************************************************************/

/**********************************************************************/
/*                          BEGIN SECTION 3                           */
/*
Configure permissions for the database role gs_GalleryServerProRole. Then later
all we have to do is add the desired SQL user to this role. */
/**********************************************************************/

GRANT EXECUTE ON {schema}[{objectQualifier}gs_AlbumDelete] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_AlbumInsert] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_AlbumSelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_AlbumSelectAll] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_AlbumUpdate] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_AppErrorDelete] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_AppErrorDeleteAll] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_AppErrorInsert] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_AppErrorSelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_AppSettingSelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_AppSettingUpdate] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_BrowserTemplateSelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_DeleteData] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_ExportGalleryData] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_ExportMembership] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_GalleryConfig] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_GalleryControlSettingSelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_GalleryControlSettingUpdate] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_GalleryDelete] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_GalleryInsert] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_GallerySelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_GallerySettingSelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_GallerySettingUpdate] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_GalleryUpdate] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MediaObjectDelete] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MediaObjectInsert] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MediaObjectMetadataDelete] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MediaObjectMetadataDeleteByMediaObjectId] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MediaObjectMetadataInsert] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MediaObjectMetadataSelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MediaObjectMetadataUpdate] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MediaObjectSelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MediaObjectSelectHashKeys] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MediaObjectUpdate] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MimeTypeGallerySelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MimeTypeGalleryUpdate] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MimeTypeSelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_Role_AlbumDelete] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_Role_AlbumInsert] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_Role_AlbumSelectRootAlbumsByRoleName] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_RoleDelete] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_RoleInsert] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_RoleSelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_RoleUpdate] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_SearchGallery] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_SelectChildAlbums] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_SelectChildMediaObjects] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_SynchronizeSave] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_SynchronizeSelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_UserGalleryProfileDeleteForGallery] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_UserGalleryProfileDeleteForUser] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_UserGalleryProfileSave] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_UserGalleryProfileSelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT SELECT ON {schema}[{objectQualifier}gs_func_convert_string_array_to_table] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MediaQueueDelete] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MediaQueueInsert] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MediaQueueSelect] TO [{objectQualifier}gs_GalleryServerProRole]
GO
GRANT EXECUTE ON {schema}[{objectQualifier}gs_MediaQueueUpdate] TO [{objectQualifier}gs_GalleryServerProRole]
GO

/**********************************************************************/
/*                          END SECTION 3                             */
/**********************************************************************/

/**********************************************************************/
/*                             BEGIN SECTION 4                        */
/*
	 Add ASP.NET roles to GSP role (gs_GalleryServerProRole).
	 NOTE: Do not include this section in DotNetNuke module!            */
/**********************************************************************/

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_BasicAccess')
	EXEC sys.sp_addrolemember @rolename=N'aspnet_Membership_BasicAccess', @membername=N'{objectQualifier}gs_GalleryServerProRole'
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_FullAccess')
	EXEC sys.sp_addrolemember @rolename=N'aspnet_Membership_FullAccess', @membername=N'{objectQualifier}gs_GalleryServerProRole'
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_ReportingAccess')
	EXEC sys.sp_addrolemember @rolename=N'aspnet_Membership_ReportingAccess', @membername=N'{objectQualifier}gs_GalleryServerProRole'
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_BasicAccess')
	EXEC sys.sp_addrolemember @rolename=N'aspnet_Profile_BasicAccess', @membername=N'{objectQualifier}gs_GalleryServerProRole'
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_FullAccess')
	EXEC sys.sp_addrolemember @rolename=N'aspnet_Profile_FullAccess', @membername=N'{objectQualifier}gs_GalleryServerProRole'
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_ReportingAccess')
	EXEC sys.sp_addrolemember @rolename=N'aspnet_Profile_ReportingAccess', @membername=N'{objectQualifier}gs_GalleryServerProRole'
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_BasicAccess')
	EXEC sys.sp_addrolemember @rolename=N'aspnet_Roles_BasicAccess', @membername=N'{objectQualifier}gs_GalleryServerProRole'
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_FullAccess')
	EXEC sys.sp_addrolemember @rolename=N'aspnet_Roles_FullAccess', @membername=N'{objectQualifier}gs_GalleryServerProRole'
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_ReportingAccess')
	EXEC sys.sp_addrolemember @rolename=N'aspnet_Roles_ReportingAccess', @membername=N'{objectQualifier}gs_GalleryServerProRole'
GO

/**********************************************************************/
/*                          END SECTION 4                             */
/**********************************************************************/

/**********************************************************************/
/*                             BEGIN SECTION 5                        */
/*
	 Insert data into the database.                      	             */
/**********************************************************************/

/* Table gs_Gallery */
SET IDENTITY_INSERT {schema}[{objectQualifier}gs_Gallery] ON

INSERT INTO {schema}[{objectQualifier}gs_Gallery] ([GalleryId], [Description], [DateAdded]) VALUES (-2147483648, 'Template Gallery', GETDATE());

SET IDENTITY_INSERT {schema}[{objectQualifier}gs_Gallery] OFF

/* Table gs_AppSetting */
INSERT INTO {schema}[{objectQualifier}gs_AppSetting] ([SettingName], [SettingValue]) VALUES ('MediaObjectDownloadBufferSize','32768');
INSERT INTO {schema}[{objectQualifier}gs_AppSetting] ([SettingName], [SettingValue]) VALUES ('EncryptMediaObjectUrlOnClient','False');
INSERT INTO {schema}[{objectQualifier}gs_AppSetting] ([SettingName], [SettingValue]) VALUES ('EncryptionKey','mNU-h7:5f_)3=c%@^}#U9Tn*');
INSERT INTO {schema}[{objectQualifier}gs_AppSetting] ([SettingName], [SettingValue]) VALUES ('JQueryScriptPath','//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js');
INSERT INTO {schema}[{objectQualifier}gs_AppSetting] ([SettingName], [SettingValue]) VALUES ('JQueryUiScriptPath','//ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js');
INSERT INTO {schema}[{objectQualifier}gs_AppSetting] ([SettingName], [SettingValue]) VALUES ('MembershipProviderName','');
INSERT INTO {schema}[{objectQualifier}gs_AppSetting] ([SettingName], [SettingValue]) VALUES ('RoleProviderName','');
INSERT INTO {schema}[{objectQualifier}gs_AppSetting] ([SettingName], [SettingValue]) VALUES ('ProductKey','');
INSERT INTO {schema}[{objectQualifier}gs_AppSetting] ([SettingName], [SettingValue]) VALUES ('EnableCache','True');
INSERT INTO {schema}[{objectQualifier}gs_AppSetting] ([SettingName], [SettingValue]) VALUES ('AllowGalleryAdminToManageUsersAndRoles','True');
INSERT INTO {schema}[{objectQualifier}gs_AppSetting] ([SettingName], [SettingValue]) VALUES ('AllowGalleryAdminToViewAllUsersAndRoles','True');
INSERT INTO {schema}[{objectQualifier}gs_AppSetting] ([SettingName], [SettingValue]) VALUES ('MaxNumberErrorItems','200');
INSERT INTO {schema}[{objectQualifier}gs_AppSetting] ([SettingName], [SettingValue]) VALUES ('DataSchemaVersion','2.6.0');

/* Table gs_GallerySetting */
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'MediaObjectPath','gs\mediaobjects');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ThumbnailPath','');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'OptimizedPath','');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'MediaObjectPathIsReadOnly','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ShowHeader','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'GalleryTitle','Media Gallery');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'GalleryTitleUrl','~/');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ShowLogin','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ShowSearch','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ShowErrorDetails','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EnableExceptionHandler','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'DefaultAlbumDirectoryNameLength','25');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'SynchAlbumTitleAndDirectoryName','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EmptyAlbumThumbnailBackgroundColor','#369');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EmptyAlbumThumbnailText','Empty');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EmptyAlbumThumbnailFontName','Verdana');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EmptyAlbumThumbnailFontSize','13');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EmptyAlbumThumbnailFontColor','White');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EmptyAlbumThumbnailWidthToHeightRatio','1.33');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'MaxAlbumThumbnailTitleDisplayLength','20');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'MaxMediaObjectThumbnailTitleDisplayLength','16');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'MediaObjectCaptionTemplate','{Title}');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'AllowUserEnteredHtml','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'AllowUserEnteredJavascript','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'AllowedHtmlTags','p,a,div,span,br,ul,ol,li,table,tr,td,th,h1,h2,h3,h4,h5,h6,strong,b,em,i,u,cite,blockquote,address,pre,hr,img,dl,dt,dd,code,tt');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'AllowedHtmlAttributes','href,class,style,id,src,title,alt,target,name');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'AllowCopyingReadOnlyObjects','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'AllowManageOwnAccount','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'AllowDeleteOwnAccount','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'MediaObjectTransitionType','Fade');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'MediaObjectTransitionDuration','0.2');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'SlideshowInterval','4000');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'AllowUnspecifiedMimeTypes','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ImageTypesStandardBrowsersCanDisplay','.jpg,.jpeg,.gif,.png');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'SilverlightFileTypes','.mp3,.wma,.wmv,.asf,.asx,.m4a');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ImageMagickFileTypes','.pdf,.txt,.eps,.psd,.tif,.tiff');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'AllowAnonymousHiResViewing','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EnableMetadata','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ExtractMetadata','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ExtractMetadataUsingWpf','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'MetadataDisplaySettings','29:T,34:T,35:F,8:T,102:T,106:T,22:T,14:T,9:T,5:T,28:T,2:T,26:T,4:T,6:T,7:T,12:T,13:T,15:T,16:T,17:T,18:T,21:T,23:T,24:T,10:T,25:T,27:T,11:T,1:T,32:T,3:T,0:T,31:T,20:T,30:T,33:T,19:T,36:T,37:F,38:T,39:F,40:T,101:F,103:F,104:F,105:F,108:F,107:F,110:T,109:T,1012:T,1013:T,1010:T,1011:T,1014:T,1017:T,1018:T,1015:T,1016:T,1003:T,1004:T,1001:T,1002:T,1005:T,1008:T,1009:T,1006:T,1007:T');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'GpsMapUrlTemplate','<a href=''http://bing.com/maps/default.aspx?sp=point.{GpsLatitude}_{GpsLongitude}_{TitleNoHtml}__{MediaObjectPageUrl}_{MediaObjectUrl}&style=a&lvl=13'' target=''_blank'' title=''View map''>{GpsLocation}</a>');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EnableMediaObjectDownload','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EnableGalleryObjectZipDownload','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EnableAlbumZipDownload','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EnablePermalink','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EnableSlideShow','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'MaxThumbnailLength','115');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ThumbnailImageJpegQuality','70');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ThumbnailClickShowsOriginal','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ThumbnailWidthBuffer','30');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ThumbnailHeightBuffer','70');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ThumbnailFileNamePrefix','zThumb_');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'MaxOptimizedLength','640');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'OptimizedImageJpegQuality','70');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'OptimizedImageTriggerSizeKb','50');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'OptimizedFileNamePrefix','zOpt_');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'OriginalImageJpegQuality','95');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'DiscardOriginalImageDuringImport','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ApplyWatermark','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'ApplyWatermarkToThumbnails','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'WatermarkText','Copyright 2010, Your Company Name, All Rights Reserved');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'WatermarkTextFontName','Verdana');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'WatermarkTextFontSize','13');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'WatermarkTextWidthPercent','50');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'WatermarkTextColor','White');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'WatermarkTextOpacityPercent','35');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'WatermarkTextLocation','BottomCenter');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'WatermarkImagePath','gs/images/gsplogo.png');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'WatermarkImageWidthPercent','85');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'WatermarkImageOpacityPercent','25');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'WatermarkImageLocation','MiddleCenter');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'SendEmailOnError','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EmailFromName','Gallery Server Pro');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EmailFromAddress','webmaster@yourisp.com');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'SmtpServer','');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'SmtpServerPort','');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'SendEmailUsingSsl','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'AutoStartMediaObject','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'DefaultVideoPlayerWidth','640');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'DefaultVideoPlayerHeight','480');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'DefaultAudioPlayerWidth','600');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'DefaultAudioPlayerHeight','60');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'DefaultGenericObjectWidth','640');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'DefaultGenericObjectHeight','480');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'MaxUploadSize','2097151');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'AllowAddLocalContent','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'AllowAddExternalContent','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'AllowAnonymousBrowsing','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'PageSize','0');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'PagerLocation','TopAndBottom');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EnableSelfRegistration','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'RequireEmailValidationForSelfRegisteredUser','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'RequireApprovalForSelfRegisteredUser','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'UseEmailForAccountName','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'DefaultRolesForSelfRegisteredUser','');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'UsersToNotifyWhenAccountIsCreated','');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'UsersToNotifyWhenErrorOccurs','');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EnableUserAlbum','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EnableUserAlbumDefaultForUser','True');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'UserAlbumParentAlbumId','0');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'UserAlbumNameTemplate','{UserName}''s gallery');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'UserAlbumSummaryTemplate','Welcome to your personal gallery. You can easily add photos, video, and other files. When you are logged in, an Actions menu appears in the upper left to help you manage your gallery.');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'RedirectToUserAlbumAfterLogin','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'VideoThumbnailPosition','3');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EnableAutoSync','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'AutoSyncIntervalMinutes','1440');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'LastAutoSync','');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'EnableRemoteSync','False');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'RemoteAccessPassword','');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'MediaEncoderSettings','.mp3||.mp3||~~.mp4||.mp4||~~.flv||.flv||~~.m4a||.m4a||~~*video||.flv||-i "{SourceFilePath}" -y "{DestinationFilePath}"~~*video||.mp4||-i "{SourceFilePath}" -y -vcodec libx264 -fpre "{BinPath}\libx264-medium.ffpreset" "{DestinationFilePath}"~~*audio||.m4a||-i "{SourceFilePath}" -y "{DestinationFilePath}"');
INSERT INTO {schema}[{objectQualifier}gs_GallerySetting] ([FKGalleryId], [IsTemplate], [SettingName], [SettingValue]) VALUES (-2147483648,1,'MediaEncoderTimeoutMs','900000');
GO

/* Table gs_MimeType */
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.afl','video/animaflex','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.aif','audio/aiff','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.aifc','audio/aiff','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.aiff','audio/aiff','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.asf','video/x-ms-asf','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.asx','video/x-ms-asf','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.au','audio/basic','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.avi','video/x-ms-wvx','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.avs','video/avs-video','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.bm','image/bmp','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.bmp','image/bmp','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.chm','application/vnd.ms-htmlhelp','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.css','text/css','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.divx','video/divx','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.dl','video/dl','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.doc','application/msword','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.docm','application/vnd.ms-word.document.macroEnabled.12','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.dotx','application/vnd.openxmlformats-officedocument.wordprocessingml.template','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.dot','application/msword','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.dotm','application/vnd.ms-word.template.macroEnabled.12','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.dtd','application/xml-dtd','text/plain');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.dv','video/x-dv','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.dwg','image/vnd.dwg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.dxf','image/vnd.dwg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.emf','image/x-emf','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.eps','image/postscript','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.exe','application/octet-stream','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.f4v','video/f4v','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.fif','image/fif','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.fli','video/fli','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.flo','image/florian','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.flv','video/x-flv','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.fpx','image/vnd.fpx','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.funk','audio/make','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.g3','image/g3fax','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.gif','image/gif','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.gl','video/gl','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.htm','text/html','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.html','text/html','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.ico','image/ico','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.ief','image/ief','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.iefs','image/ief','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.it','audio/it','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.jar','application/java-archive','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.jfif','image/jpeg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.jfif-tbnl','image/jpeg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.jpe','image/jpeg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.jpeg','image/jpeg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.jpg','image/jpeg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.js','text/javascript','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.jut','image/jutvision','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.kar','audio/midi','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.la','audio/nspaudio','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.lma','audio/nspaudio','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.m1v','video/mpeg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.m2a','audio/mpeg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.m2v','video/mpeg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.m4a','audio/m4a','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.m4v','video/x-m4v','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.mcf','image/vasa','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.mht','message/rfc822','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.mid','audio/midi','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.midi','audio/midi','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.mod','audio/mod','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.moov','video/quicktime','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.mov','video/mp4','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.mp2','audio/mpeg','application/x-mplayer2');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.mp3','audio/x-mp3','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.mp4','video/mp4','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.mpa','audio/mpeg','application/x-mplayer2');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.mpe','video/mpeg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.mpeg','video/mpeg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.mpg','video/mpeg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.mpga','audio/mpeg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.my','audio/make','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.nap','image/naplps','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.naplps','image/naplps','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.oga','audio/ogg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.ogg','video/ogg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.ogv','video/ogg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.pdf','application/pdf','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.pfunk','audio/make','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.pic','image/pict','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.pict','image/pict','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.png','image/png','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.potm','application/vnd.ms-powerpoint.template.macroEnabled.12','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.potx','application/vnd.openxmlformats-officedocument.presentationml.template','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.ppam','application/vnd.ms-powerpoint.addin.macroEnabled.12','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.pps','application/vnd.ms-powerpoint','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.ppsm','application/vnd.ms-powerpoint.slideshow.macroEnabled.12','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.ppsx','application/vnd.openxmlformats-officedocument.presentationml.slideshow','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.ppt','application/vnd.ms-powerpoint','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.pptm','application/vnd.ms-powerpoint.presentation.macroEnabled.12','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.pptx','application/vnd.openxmlformats-officedocument.presentationml.presentation','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.psd','image/psd','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.qcp','audio/vnd.qcelp','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.qt','video/quicktime','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.ra','audio/x-pn-realaudio','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.ram','audio/x-pn-realaudio','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.ras','image/cmu-raster','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.rast','image/cmu-raster','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.rf','image/vnd.rn-realflash','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.rmi','audio/mid','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.rp','image/vnd.rn-realpix','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.rtf','application/rtf','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.rv','video/vnd.rn-realvideo','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.sgml','text/sgml','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.s3m','audio/s3m','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.snd','audio/basic','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.svf','image/vnd.dwg','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.svg','image/svg+xml','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.swf','application/x-shockwave-flash','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.tif','image/tiff','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.tiff','image/tiff','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.tsi','audio/tsp-audio','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.tsp','audio/tsplayer','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.turbot','image/florian','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.txt','text/plain','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.vdo','video/vdo','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.viv','video/vivo','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.vivo','video/vivo','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.voc','audio/voc','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.vos','video/vosaic','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.vox','audio/voxware','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.wax','audio/x-ms-wax','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.wav','audio/wav','application/x-mplayer2');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.wbmp','image/vnd.wap.wbmp','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.webm','video/webm','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.wmf','image/wmf','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.wma','audio/x-ms-wma','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.wmv','video/x-ms-wmv','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.wvx','video/x-ms-wvx','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.xbap','application/x-ms-xbap','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.xaml','application/xaml+xml','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.xlam','application/vnd.ms-excel.addin.macroEnabled.12','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.xls','application/vnd.ms-excel','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.xlsb','application/vnd.ms-excel.sheet.binary.macroEnabled.12','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.xlsm','application/vnd.ms-excel.sheet.macroEnabled.12','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.xltm','application/vnd.ms-excel.template.macroEnabled.12','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.xltx','application/vnd.openxmlformats-officedocument.spreadsheetml.template','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.xif','image/vnd.xiff','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.xml','text/xml','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.xps','application/vnd.ms-xpsdocument','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.x-png','image/png','');
INSERT INTO {schema}[{objectQualifier}gs_MimeType] ([FileExtension], [MimeTypeValue], [BrowserMimeTypeValue]) VALUES ('.zip','application/octet-stream','');

/* Table gs_BrowserTemplate */
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('image/*','default','<div class="gsp_i_c" style="width:{Width}px;"><img id="mo_img" src="{MediaObjectUrl}" class="{CssClass}" alt="{TitleNoHtml}" title="{TitleNoHtml}" style="height:{Height}px;width:{Width}px;" /></div>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('image/*','ie1to8','<div class="gsp_floatcontainer"><div class="op1"><div class="op2"><div class="sb"><div class="ib"><img id="mo_img" src="{MediaObjectUrl}" class="{CssClass}" alt="{TitleNoHtml}" title="{TitleNoHtml}" style="height:{Height}px;width:{Width}px;" /></div></div></div></div></div>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('audio/*','default','<object type="{MimeType}" data="{MediaObjectUrl}" style="width:{Width}px;height:{Height}px;" ><param name="autostart" value="{AutoStartMediaObjectInt}" /><param name="controller" value="true" /></object>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('audio/*','ie','<object classid="clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6" standby="Loading audio..." style="width:{Width}px;height:{Height}px;"><param name="url" value="{MediaObjectUrl}" /><param name="src" value="{MediaObjectUrl}" /><param name="autostart" value="{AutoStartMediaObjectText}" /><param name="showcontrols" value="true" /></object>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('audio/m4a','default','<div id=''mp1p''></div>','if (_pageLoadHasFired) gsp_runSilverlight(); else Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(gsp_runSilverlight); function gsp_runSilverlight() { Sys.UI.Silverlight.Control.createObject(''mp1p'', ''<object type="application/x-silverlight" id="mp1" style="height:{Height}px;width:{Width}px;"><param name="Windowless" value="True" /><a href="http://go2.microsoft.com/fwlink/?LinkID=114576&amp;v=1.0"><img src="http://go2.microsoft.com/fwlink/?LinkID=108181" alt="Get Microsoft Silverlight" style="border-width:0;" /></a></object>''); Sys.Application.add_init(function() { $create(Sys.UI.Silverlight.MediaPlayer, { "mediaSource": "{MediaObjectUrl}", "scaleMode": 1, "source": "{GalleryPath}/skins/mediaplayer/AudioGray.xaml","autoPlay":{AutoStartMediaObjectText} }, null, null, $get("mp1p")); }); Sys.Application.initialize();Array.add(_mediaObjectsToDispose, "mp1");}');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('audio/ogg','default','<audio src="{MediaObjectUrl}" controls autobuffer {AutoPlay}><p>Cannot play: Your browser does not support the <code>audio</code> element or the codec of this file. Use another browser or download the file by clicking the download toolbar button above (available only when downloading is enabled).</p></audio>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('audio/ogg','ie','<p>Cannot play: Internet Explorer cannot play Ogg Theora files. Use another browser or download the file by clicking the download toolbar button above (available only when downloading is enabled).</p>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('audio/wav','default','<audio src="{MediaObjectUrl}" controls autobuffer {AutoPlay}><p>Cannot play: Your browser does not support the <code>audio</code> element or the codec of this file. Use another browser or download the file by clicking the download toolbar button above (available only when downloading is enabled).</p></audio>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('audio/wav','ie','<object classid="clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6" standby="Loading audio..." style="width:{Width}px;height:{Height}px;"><param name="url" value="{MediaObjectUrl}" /><param name="src" value="{MediaObjectUrl}" /><param name="autostart" value="{AutoStartMediaObjectText}" /><param name="showcontrols" value="true" /></object>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('audio/x-mp3','default','<div id=''mp1p''></div>','if (_pageLoadHasFired) gsp_runSilverlight(); else Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(gsp_runSilverlight); function gsp_runSilverlight() { Sys.UI.Silverlight.Control.createObject(''mp1p'', ''<object type="application/x-silverlight" id="mp1" style="height:{Height}px;width:{Width}px;"><param name="Windowless" value="True" /><a href="http://go2.microsoft.com/fwlink/?LinkID=114576&amp;v=1.0"><img src="http://go2.microsoft.com/fwlink/?LinkID=108181" alt="Get Microsoft Silverlight" style="border-width:0;" /></a></object>''); Sys.Application.add_init(function() { $create(Sys.UI.Silverlight.MediaPlayer, { "mediaSource": "{MediaObjectUrl}", "scaleMode": 1, "source": "{GalleryPath}/skins/mediaplayer/AudioGray.xaml","autoPlay":{AutoStartMediaObjectText} }, null, null, $get("mp1p")); }); Sys.Application.initialize();Array.add(_mediaObjectsToDispose, "mp1");}');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('audio/x-ms-wma','default','<div id=''mp1p''></div>','if (_pageLoadHasFired) gsp_runSilverlight(); else Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(gsp_runSilverlight); function gsp_runSilverlight() { Sys.UI.Silverlight.Control.createObject(''mp1p'', ''<object type="application/x-silverlight" id="mp1" style="height:{Height}px;width:{Width}px;"><param name="Windowless" value="True" /><a href="http://go2.microsoft.com/fwlink/?LinkID=114576&amp;v=1.0"><img src="http://go2.microsoft.com/fwlink/?LinkID=108181" alt="Get Microsoft Silverlight" style="border-width:0;" /></a></object>''); Sys.Application.add_init(function() { $create(Sys.UI.Silverlight.MediaPlayer, { "mediaSource": "{MediaObjectUrl}", "scaleMode": 1, "source": "{GalleryPath}/skins/mediaplayer/AudioGray.xaml","autoPlay":{AutoStartMediaObjectText} }, null, null, $get("mp1p")); }); Sys.Application.initialize();Array.add(_mediaObjectsToDispose, "mp1");}');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/*','default','<object type="{MimeType}" data="{MediaObjectUrl}" style="width:{Width}px;height:{Height}px;" ><param name="src" value="{MediaObjectUrl}" /><param name="autostart" value="{AutoStartMediaObjectInt}" /></object>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/*','ie','<object type="{MimeType}" data="{MediaObjectUrl}" style="width:{Width}px;height:{Height}px;"><param name="src" value="{MediaObjectUrl}" /><param name="autostart" value="{AutoStartMediaObjectText}" /></object>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/ogg','default','<video src="{MediaObjectUrl}" controls autobuffer {AutoPlay}><p>Cannot play: Your browser does not support the <code>video</code> element or the codec of this file. Use another browser or download the file by clicking the download toolbar button above (available only when downloading is enabled).</p></video>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/ogg','ie','<p>Cannot play: Internet Explorer cannot play Ogg Theora files. Use another browser or download the file by clicking the download toolbar button above (available only when downloading is enabled).</p>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/x-ms-wmv','default','<div id=''mp1p''></div>','if (_pageLoadHasFired) gsp_runSilverlight(); else Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(gsp_runSilverlight); function gsp_runSilverlight() { Sys.UI.Silverlight.Control.createObject(''mp1p'', ''<object type="application/x-silverlight" id="mp1" style="height:{Height}px;width:{Width}px;"><param name="Windowless" value="True" /><a href="http://go2.microsoft.com/fwlink/?LinkID=114576&amp;v=1.0"><img src="http://go2.microsoft.com/fwlink/?LinkID=108181" alt="Get Microsoft Silverlight" style="border-width:0;" /></a></object>''); Sys.Application.add_init(function() { $create(Sys.UI.Silverlight.MediaPlayer, { "mediaSource": "{MediaObjectUrl}", "scaleMode": 1, "source": "{GalleryPath}/skins/mediaplayer/Professional.xaml","autoPlay":{AutoStartMediaObjectText} }, null, null, $get("mp1p")); }); Sys.Application.initialize();Array.add(_mediaObjectsToDispose, "mp1");}');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/mp4','default','<script type="text/javascript" src="{GalleryPath}/script/flowplayer-3.2.6.min.js"></script><a href="{MediaObjectUrl}" style="display:block;width:{Width}px;height:{Height}px" id="gsp_player"></a>','$get("gsp_player").href=$get("gsp_player").href.replace(/&/g, "%26");flowplayer("gsp_player", { src: "{GalleryPath}/script/flowplayer-3.2.7.swf", wmode: "opaque" }, { clip:{ autoPlay: {AutoStartMediaObjectText}, scaling: "fit" } });');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/x-m4v','default','<script type="text/javascript" src="{GalleryPath}/script/flowplayer-3.2.6.min.js"></script><a href="{MediaObjectUrl}" style="display:block;width:{Width}px;height:{Height}px" id="gsp_player"></a>','$get("gsp_player").href=$get("gsp_player").href.replace(/&/g, "%26");flowplayer("gsp_player", { src: "{GalleryPath}/script/flowplayer-3.2.7.swf", wmode: "opaque" }, { clip:{ autoPlay: {AutoStartMediaObjectText}, scaling: "fit" } });');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/x-ms-asf','default','<div id=''mp1p''></div>','if (_pageLoadHasFired) gsp_runSilverlight(); else Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(gsp_runSilverlight); function gsp_runSilverlight() { Sys.UI.Silverlight.Control.createObject(''mp1p'', ''<object type="application/x-silverlight" id="mp1" style="height:{Height}px;width:{Width}px;"><param name="Windowless" value="True" /><a href="http://go2.microsoft.com/fwlink/?LinkID=114576&amp;v=1.0"><img src="http://go2.microsoft.com/fwlink/?LinkID=108181" alt="Get Microsoft Silverlight" style="border-width:0;" /></a></object>''); Sys.Application.add_init(function() { $create(Sys.UI.Silverlight.MediaPlayer, { "mediaSource": "{MediaObjectUrl}", "scaleMode": 1, "source": "{GalleryPath}/skins/mediaplayer/Professional.xaml","autoPlay":{AutoStartMediaObjectText} }, null, null, $get("mp1p")); }); Sys.Application.initialize();Array.add(_mediaObjectsToDispose, "mp1");}');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/quicktime','default','<object type="{MimeType}" data="{MediaObjectUrl}" style="width:{Width}px;height:{Height}px;"><param name="autoplay" value="{AutoStartMediaObjectText}" /><param name="controller" value="true" /><param name="pluginurl" value="http://www.apple.com/quicktime/download/" /></object>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/quicktime','ie','<object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab" style="width:{Width}px;height:{Height}px;"><param name="src" value="{MediaObjectUrl}" /><param name="autoplay" value="{AutoStartMediaObjectText}" /><param name="controller" value="true" /><param name="pluginspage" value="http://www.apple.com/quicktime/download/" /></object>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/divx','default','<object type="{MimeType}" data="{HostUrl}{MediaObjectUrl}" style="width:{Width}px;height:{Height}px;"><param name="src" value="{HostUrl}{MediaObjectUrl}" /><param name="mode" value="full" /><param name="minVersion" value="1.0.0" /><param name="allowContextMenu" value="true" /><param name="autoPlay" value="{AutoStartMediaObjectText}" /><param name="loop" value="false" /><param name="bannerEnabled" value="false" /><param name="bufferingMode" value="auto" /><param name="previewMessage" value="Click to start video" /><param name="previewMessageFontSize" value="24" /><param name="movieTitle" value="{TitleNoHtml}" /></object>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/divx','ie','<object classid="clsid:67DABFBF-D0AB-41fa-9C46-CC0F21721616" codebase="http://go.divx.com/plugin/DivXBrowserPlugin.cab" style="width:{Width}px;height:{Height}px;"><param name="src" value="{HostUrl}{MediaObjectUrl}" /><param name="mode" value="full" /><param name="minVersion" value="1.0.0" /><param name="allowContextMenu" value="true" /><param name="autoPlay" value="{AutoStartMediaObjectText}" /><param name="loop" value="false" /><param name="bannerEnabled" value="false" /><param name="bufferingMode" value="auto" /><param name="previewMessage" value="Click to start video" /><param name="previewMessageFontSize" value="24" /><param name="movieTitle" value="{TitleNoHtml}" /></object>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/webm','default','<video src="{MediaObjectUrl}" controls autobuffer {AutoPlay}><p>Cannot play: Your browser does not support the <code>video</code> element or the codec of this file. Use another browser or download the file by clicking the download toolbar button above (available only when downloading is enabled).</p></video>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('application/x-shockwave-flash','default','<object type="{MimeType}" data="{MediaObjectUrl}" style="width:{Width}px;height:{Height}px;" id="flash_plugin" standby="loading movie..."><param name="movie" value="{MediaObjectUrl}" /><param name="allowScriptAccess" value="sameDomain" /><param name="quality" value="best" /><param name="wmode" value="opaque" /><param name="scale" value="default" /><param name="bgcolor" value="#FFFFFF" /><param name="salign" value="TL" /><param name="FlashVars" value="playerMode=embedded" /><p><strong>Cannot play Flash content</strong> Your browser does not have the Flash plugin or it is disabled. To view the content, install the Macromedia Flash plugin or, if it is already installed, enable it.</p></object>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('application/x-shockwave-flash','ie','<object type="{MimeType}" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0&quot; id="flash_activex" standby="loading movie..." style="width:{Width}px;height:{Height}px;"><param name="movie" value="{MediaObjectUrl}" /><param name="quality" value="high" /><param name="wmode" value="opaque" /><param name="bgcolor" value="#FFFFFF" /><p><strong>Cannot play Flash content</strong> Your browser does not have the Flash plugin or it is disabled. To view the content, install the Macromedia Flash plugin or, if it is already installed, enable it.</p></object>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('application/x-shockwave-flash','ie5to9mac','<object type="{MimeType}" data="{MediaObjectUrl}" style="width:{Width}px;height:{Height}px;" id="flash_plugin" standby="loading movie..."><param name="movie" value="{MediaObjectUrl}" /><param name="allowScriptAccess" value="sameDomain" /><param name="quality" value="best" /><param name="scale" value="default" /><param name="bgcolor" value="#FFFFFF" /><param name="wmode" value="opaque" /><param name="salign" value="TL" /><param name="FlashVars" value="playerMode=embedded" /><strong>Cannot play Flash content</strong> Your browser does not have the Flash plugin or it is disabled. To view the content, install the Macromedia Flash plugin or, if it is already installed, enable it.</object>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/f4v','default','<script type="text/javascript" src="{GalleryPath}/script/flowplayer-3.2.6.min.js"></script><a href="{MediaObjectUrl}" style="display:block;width:{Width}px;height:{Height}px" id="gsp_player"></a>','$get("gsp_player").href=$get("gsp_player").href.replace(/&/g, "%26");flowplayer("gsp_player", { src: "{GalleryPath}/script/flowplayer-3.2.7.swf", wmode: "opaque" }, { clip:{ autoPlay: {AutoStartMediaObjectText}, scaling: "fit" } });');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/x-flv','default','<script type="text/javascript" src="{GalleryPath}/script/flowplayer-3.2.6.min.js"></script><a href="{MediaObjectUrl}" style="display:block;width:{Width}px;height:{Height}px" id="gsp_player"></a>','$get("gsp_player").href=$get("gsp_player").href.replace(/&/g, "%26");flowplayer("gsp_player", { src: "{GalleryPath}/script/flowplayer-3.2.7.swf", wmode: "opaque" }, { clip:{ autoPlay: {AutoStartMediaObjectText}, scaling: "fit" } });');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/mp4','safari','<video src="{MediaObjectUrl}" controls autobuffer {AutoPlay}><p>Cannot play: Your browser does not support the <code>video</code> element or the codec of this file. Use another browser or download the file by clicking the download toolbar button above (available only when downloading is enabled).</p></video>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/x-m4v','safari','<video src="{MediaObjectUrl}" controls autobuffer {AutoPlay}><p>Cannot play: Your browser does not support the <code>video</code> element or the codec of this file. Use another browser or download the file by clicking the download toolbar button above (available only when downloading is enabled).</p></video>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('video/quicktime','safari','<video src="{MediaObjectUrl}" controls autobuffer {AutoPlay}><p>Cannot play: Your browser does not support the <code>video</code> element or the codec of this file. Use another browser or download the file by clicking the download toolbar button above (available only when downloading is enabled).</p></video>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('audio/x-mp3','safari','<audio src="{MediaObjectUrl}" controls autobuffer {AutoPlay}><p>Cannot play: Your browser does not support the <code>audio</code> element or the codec of this file. Use another browser or download the file by clicking the download toolbar button above (available only when downloading is enabled).</p></audio>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('audio/m4a','safari','<audio src="{MediaObjectUrl}" controls autobuffer {AutoPlay}><p>Cannot play: Your browser does not support the <code>audio</code> element or the codec of this file. Use another browser or download the file by clicking the download toolbar button above (available only when downloading is enabled).</p></audio>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('application/pdf','default','<p><a href="{MediaObjectUrl}">Enlarge PDF to fit browser window</a></p><iframe src="{MediaObjectUrl}" frameborder="0" style="width:680px;height:600px;border:1px solid #000;"></iframe>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('text/plain','default','<p><a href="{MediaObjectUrl}">Enlarge file to fit browser window</a></p><iframe src="{MediaObjectUrl}" frameborder="0" style="width:680px;height:600px;border:1px solid #000;"></iframe>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('text/html','default','<p><a href="{MediaObjectUrl}">Enlarge file to fit browser window</a></p><iframe src="{MediaObjectUrl}" frameborder="0" style="width:680px;height:600px;border:1px solid #000;"></iframe>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('application/vnd.openxmlformats-officedocument.wordprocessingml.document','default','<p style="margin-bottom:5em;"><a href="{MediaObjectUrl}" title="Download {TitleNoHtml}">Download {TitleNoHtml}</a></p>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('application/msword','default','<p style="margin-bottom:5em;"><a href="{MediaObjectUrl}" title="Download {TitleNoHtml}">Download {TitleNoHtml}</a></p>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('message/rfc822','default','<p class="gsp_msgfriendly">This browser cannot display web archive files (.mht). Use Internet Explorer or download it by clicking the download link in the toolbar.</p>','');
INSERT INTO {schema}[{objectQualifier}gs_BrowserTemplate] ([MimeType], [BrowserId], [HtmlTemplate], [ScriptTemplate]) VALUES ('message/rfc822','ie','<p><a href="{MediaObjectUrl}">Enlarge to fit browser window</a></p><iframe src="{MediaObjectUrl}" frameborder="0" style="width:680px;height:600px;border:1px solid #000;"></iframe>','');
