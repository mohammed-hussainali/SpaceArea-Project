-- Spaceara: full database schema script (idempotent).
-- Generated with: dotnet ef migrations script --idempotent
-- Safe to run more than once: it applies only the migrations that are missing from [__EFMigrationsHistory].
-- Run it while connected to your MonsterASP database (SSMS: select the database first).
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [FullName] nvarchar(200) NOT NULL,
        [CreatedAt] datetime2 NOT NULL,
        [IsActive] bit NOT NULL,
        [AccountType] int NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [Skills] (
        [SkillID] int NOT NULL IDENTITY,
        [Name] nvarchar(200) NOT NULL,
        [Category] nvarchar(100) NULL,
        [Description] nvarchar(500) NULL,
        [IsActive] bit NOT NULL,
        CONSTRAINT [PK_Skills] PRIMARY KEY ([SkillID])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [TrainingTerms] (
        [TermID] int NOT NULL IDENTITY,
        [Name] nvarchar(100) NOT NULL,
        [AcademicYear] nvarchar(20) NOT NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NOT NULL,
        [IsActive] bit NOT NULL,
        CONSTRAINT [PK_TrainingTerms] PRIMARY KEY ([TermID])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(128) NOT NULL,
        [ProviderKey] nvarchar(128) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(128) NOT NULL,
        [Name] nvarchar(128) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [EmailVerificationCodes] (
        [Id] int NOT NULL IDENTITY,
        [Code] nvarchar(max) NOT NULL,
        [ExpireAt] datetime2 NOT NULL,
        [IsUsed] bit NOT NULL,
        [CreatedAt] datetime2 NOT NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_EmailVerificationCodes] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_EmailVerificationCodes_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [TrainingInstitutions] (
        [InstituationID] int NOT NULL IDENTITY,
        [Name] nvarchar(200) NOT NULL,
        [InstitutionType] nvarchar(50) NULL,
        [Address] nvarchar(300) NULL,
        [PhoneNumber] nvarchar(50) NULL,
        [Email] nvarchar(150) NULL,
        [ContactPersonName] nvarchar(200) NULL,
        [IsActive] bit NOT NULL,
        [UserID] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_TrainingInstitutions] PRIMARY KEY ([InstituationID]),
        CONSTRAINT [FK_TrainingInstitutions_AspNetUsers_UserID] FOREIGN KEY ([UserID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [Universities] (
        [UniversityID] int NOT NULL IDENTITY,
        [Name] nvarchar(200) NOT NULL,
        [Address] nvarchar(300) NULL,
        [PhoneNumber] nvarchar(50) NULL,
        [Email] nvarchar(max) NULL,
        [IsActive] bit NOT NULL,
        [UserID] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_Universities] PRIMARY KEY ([UniversityID]),
        CONSTRAINT [FK_Universities_AspNetUsers_UserID] FOREIGN KEY ([UserID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [Departments] (
        [DepartmentID] int NOT NULL IDENTITY,
        [Name] nvarchar(200) NOT NULL,
        [IsActive] bit NOT NULL,
        [UniversityID] int NOT NULL,
        CONSTRAINT [PK_Departments] PRIMARY KEY ([DepartmentID]),
        CONSTRAINT [FK_Departments_Universities_UniversityID] FOREIGN KEY ([UniversityID]) REFERENCES [Universities] ([UniversityID])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [AspNetRoleScopes] (
        [UserRoleScopeID] int NOT NULL IDENTITY,
        [UserID] nvarchar(450) NOT NULL,
        [RoleID] nvarchar(450) NOT NULL,
        [UniversityID] int NULL,
        [DepartmentID] int NULL,
        [InstitutionID] int NULL,
        [StudentID] int NULL,
        [IsActive] bit NOT NULL,
        CONSTRAINT [PK_AspNetRoleScopes] PRIMARY KEY ([UserRoleScopeID]),
        CONSTRAINT [FK_AspNetRoleScopes_AspNetRoles_RoleID] FOREIGN KEY ([RoleID]) REFERENCES [AspNetRoles] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_AspNetRoleScopes_AspNetUsers_UserID] FOREIGN KEY ([UserID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetRoleScopes_Departments_DepartmentID] FOREIGN KEY ([DepartmentID]) REFERENCES [Departments] ([DepartmentID]) ON DELETE NO ACTION,
        CONSTRAINT [FK_AspNetRoleScopes_TrainingInstitutions_InstitutionID] FOREIGN KEY ([InstitutionID]) REFERENCES [TrainingInstitutions] ([InstituationID]) ON DELETE NO ACTION,
        CONSTRAINT [FK_AspNetRoleScopes_Universities_UniversityID] FOREIGN KEY ([UniversityID]) REFERENCES [Universities] ([UniversityID]) ON DELETE NO ACTION
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [Specialties] (
        [SpecialtyID] int NOT NULL IDENTITY,
        [Name] nvarchar(200) NOT NULL,
        [Description] nvarchar(500) NULL,
        [Category] nvarchar(100) NULL,
        [IsActive] bit NOT NULL,
        [DepartmentID] int NOT NULL,
        CONSTRAINT [PK_Specialties] PRIMARY KEY ([SpecialtyID]),
        CONSTRAINT [FK_Specialties_Departments_DepartmentID] FOREIGN KEY ([DepartmentID]) REFERENCES [Departments] ([DepartmentID])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [TrainingOpportunityRequests] (
        [RequestID] int NOT NULL IDENTITY,
        [Title] nvarchar(300) NOT NULL,
        [Description] nvarchar(1000) NULL,
        [RequestedSeats] int NOT NULL,
        [PreferredStartDate] datetime2 NULL,
        [PreferredEndDate] datetime2 NULL,
        [ApplicationDeadline] datetime2 NULL,
        [Status] nvarchar(50) NOT NULL,
        [CreatedAt] datetime2 NOT NULL,
        [Notes] nvarchar(1000) NULL,
        [DepartmentID] int NULL,
        [UniversityID] int NOT NULL,
        [TermID] int NOT NULL,
        [UniversityAdminID] nvarchar(450) NULL,
        [DepartmentHeadID] nvarchar(450) NULL,
        CONSTRAINT [PK_TrainingOpportunityRequests] PRIMARY KEY ([RequestID]),
        CONSTRAINT [FK_TrainingOpportunityRequests_AspNetUsers_DepartmentHeadID] FOREIGN KEY ([DepartmentHeadID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrainingOpportunityRequests_AspNetUsers_UniversityAdminID] FOREIGN KEY ([UniversityAdminID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrainingOpportunityRequests_Departments_DepartmentID] FOREIGN KEY ([DepartmentID]) REFERENCES [Departments] ([DepartmentID]),
        CONSTRAINT [FK_TrainingOpportunityRequests_TrainingTerms_TermID] FOREIGN KEY ([TermID]) REFERENCES [TrainingTerms] ([TermID]) ON DELETE CASCADE,
        CONSTRAINT [FK_TrainingOpportunityRequests_Universities_UniversityID] FOREIGN KEY ([UniversityID]) REFERENCES [Universities] ([UniversityID]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [Students] (
        [StudentID] int NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [StudentNumber] nvarchar(50) NOT NULL,
        [Level] nvarchar(20) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [GPA] decimal(5,2) NULL,
        [Bio] nvarchar(1000) NULL,
        [CVPath] nvarchar(500) NULL,
        [ProfileImagePath] nvarchar(max) NULL,
        [Status] nvarchar(50) NOT NULL,
        [DepartmentID] int NOT NULL,
        [SpecialtyID] int NULL,
        [UserID] nvarchar(450) NOT NULL,
        [UniversityID] int NOT NULL,
        CONSTRAINT [PK_Students] PRIMARY KEY ([StudentID]),
        CONSTRAINT [FK_Students_AspNetUsers_UserID] FOREIGN KEY ([UserID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Students_Departments_DepartmentID] FOREIGN KEY ([DepartmentID]) REFERENCES [Departments] ([DepartmentID]),
        CONSTRAINT [FK_Students_Specialties_SpecialtyID] FOREIGN KEY ([SpecialtyID]) REFERENCES [Specialties] ([SpecialtyID]),
        CONSTRAINT [FK_Students_Universities_UniversityID] FOREIGN KEY ([UniversityID]) REFERENCES [Universities] ([UniversityID])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [OpportunityRequestInstitutions] (
        [RequestInstitutionID] int NOT NULL IDENTITY,
        [Status] nvarchar(50) NOT NULL,
        [SentAt] datetime2 NOT NULL,
        [RespondedAt] datetime2 NULL,
        [Notes] nvarchar(1000) NULL,
        [RequestID] int NOT NULL,
        [InstitutionID] int NOT NULL,
        CONSTRAINT [PK_OpportunityRequestInstitutions] PRIMARY KEY ([RequestInstitutionID]),
        CONSTRAINT [FK_OpportunityRequestInstitutions_TrainingInstitutions_InstitutionID] FOREIGN KEY ([InstitutionID]) REFERENCES [TrainingInstitutions] ([InstituationID]) ON DELETE NO ACTION,
        CONSTRAINT [FK_OpportunityRequestInstitutions_TrainingOpportunityRequests_RequestID] FOREIGN KEY ([RequestID]) REFERENCES [TrainingOpportunityRequests] ([RequestID]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [RequestSkills] (
        [RequestSkillID] int NOT NULL IDENTITY,
        [RequestID] int NOT NULL,
        [SkillID] int NOT NULL,
        [IsRequired] bit NOT NULL,
        CONSTRAINT [PK_RequestSkills] PRIMARY KEY ([RequestSkillID]),
        CONSTRAINT [FK_RequestSkills_Skills_SkillID] FOREIGN KEY ([SkillID]) REFERENCES [Skills] ([SkillID]) ON DELETE CASCADE,
        CONSTRAINT [FK_RequestSkills_TrainingOpportunityRequests_RequestID] FOREIGN KEY ([RequestID]) REFERENCES [TrainingOpportunityRequests] ([RequestID]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [RequestSpecialties] (
        [RequestSpecialtyID] int NOT NULL IDENTITY,
        [RequestID] int NOT NULL,
        [SpecialtyID] int NOT NULL,
        CONSTRAINT [PK_RequestSpecialties] PRIMARY KEY ([RequestSpecialtyID]),
        CONSTRAINT [FK_RequestSpecialties_Specialties_SpecialtyID] FOREIGN KEY ([SpecialtyID]) REFERENCES [Specialties] ([SpecialtyID]) ON DELETE CASCADE,
        CONSTRAINT [FK_RequestSpecialties_TrainingOpportunityRequests_RequestID] FOREIGN KEY ([RequestID]) REFERENCES [TrainingOpportunityRequests] ([RequestID]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [TrainingOpportunities] (
        [OpportunityID] int NOT NULL IDENTITY,
        [InstitutionID] int NOT NULL,
        [TermID] int NOT NULL,
        [RequestID] int NULL,
        [Title] nvarchar(200) NOT NULL,
        [Description] nvarchar(500) NULL,
        [Capacity] int NOT NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NOT NULL,
        [Location] nvarchar(300) NULL,
        [InstitutionOfficerID] nvarchar(450) NOT NULL,
        [Status] nvarchar(50) NOT NULL,
        [CreatedAt] datetime2 NOT NULL,
        [TrainingTermTermID] int NULL,
        CONSTRAINT [PK_TrainingOpportunities] PRIMARY KEY ([OpportunityID]),
        CONSTRAINT [FK_TrainingOpportunities_AspNetUsers_InstitutionOfficerID] FOREIGN KEY ([InstitutionOfficerID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrainingOpportunities_TrainingInstitutions_InstitutionID] FOREIGN KEY ([InstitutionID]) REFERENCES [TrainingInstitutions] ([InstituationID]) ON DELETE CASCADE,
        CONSTRAINT [FK_TrainingOpportunities_TrainingOpportunityRequests_RequestID] FOREIGN KEY ([RequestID]) REFERENCES [TrainingOpportunityRequests] ([RequestID]),
        CONSTRAINT [FK_TrainingOpportunities_TrainingTerms_TermID] FOREIGN KEY ([TermID]) REFERENCES [TrainingTerms] ([TermID]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrainingOpportunities_TrainingTerms_TrainingTermTermID] FOREIGN KEY ([TrainingTermTermID]) REFERENCES [TrainingTerms] ([TermID])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [PortfolioItems] (
        [PortfolioItemID] int NOT NULL IDENTITY,
        [StudentID] int NOT NULL,
        [Title] nvarchar(300) NOT NULL,
        [Description] nvarchar(1000) NULL,
        [FilePath] nvarchar(max) NULL,
        [Url] nvarchar(max) NULL,
        [Type] nvarchar(50) NOT NULL,
        [CreatedAt] datetime2 NOT NULL,
        CONSTRAINT [PK_PortfolioItems] PRIMARY KEY ([PortfolioItemID]),
        CONSTRAINT [FK_PortfolioItems_Students_StudentID] FOREIGN KEY ([StudentID]) REFERENCES [Students] ([StudentID]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [StudentSkills] (
        [StudentSkillID] int NOT NULL IDENTITY,
        [Level] nvarchar(50) NOT NULL,
        [StudentID] int NOT NULL,
        [SkillID] int NOT NULL,
        CONSTRAINT [PK_StudentSkills] PRIMARY KEY ([StudentSkillID]),
        CONSTRAINT [FK_StudentSkills_Skills_SkillID] FOREIGN KEY ([SkillID]) REFERENCES [Skills] ([SkillID]) ON DELETE CASCADE,
        CONSTRAINT [FK_StudentSkills_Students_StudentID] FOREIGN KEY ([StudentID]) REFERENCES [Students] ([StudentID]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [OpportunitySkills] (
        [OpportunitySkillID] int NOT NULL IDENTITY,
        [OpportunityID] int NOT NULL,
        [SkillID] int NOT NULL,
        [IsRequired] bit NOT NULL,
        CONSTRAINT [PK_OpportunitySkills] PRIMARY KEY ([OpportunitySkillID]),
        CONSTRAINT [FK_OpportunitySkills_Skills_SkillID] FOREIGN KEY ([SkillID]) REFERENCES [Skills] ([SkillID]) ON DELETE CASCADE,
        CONSTRAINT [FK_OpportunitySkills_TrainingOpportunities_OpportunityID] FOREIGN KEY ([OpportunityID]) REFERENCES [TrainingOpportunities] ([OpportunityID]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [OpportunitySpecialties] (
        [OpportunitySpecialtyID] int NOT NULL IDENTITY,
        [OpportunityID] int NOT NULL,
        [SpecialtyID] int NOT NULL,
        CONSTRAINT [PK_OpportunitySpecialties] PRIMARY KEY ([OpportunitySpecialtyID]),
        CONSTRAINT [FK_OpportunitySpecialties_Specialties_SpecialtyID] FOREIGN KEY ([SpecialtyID]) REFERENCES [Specialties] ([SpecialtyID]) ON DELETE CASCADE,
        CONSTRAINT [FK_OpportunitySpecialties_TrainingOpportunities_OpportunityID] FOREIGN KEY ([OpportunityID]) REFERENCES [TrainingOpportunities] ([OpportunityID]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [TrainingApplications] (
        [ApplicationID] int NOT NULL IDENTITY,
        [OpportunityID] int NOT NULL,
        [StudentID] int NOT NULL,
        [AppliedAt] datetime2 NOT NULL,
        [StudentNotes] nvarchar(1000) NULL,
        [Status] nvarchar(50) NOT NULL,
        [DepartmentDecision] nvarchar(50) NOT NULL,
        [DepartmentHeadID] nvarchar(450) NULL,
        [DepartmentReviewedAt] datetime2 NULL,
        [DepartmentReviewNotes] nvarchar(1000) NULL,
        [UniversityAdminDecision] nvarchar(50) NOT NULL,
        [UniversityAdminID] nvarchar(450) NULL,
        [UniversityAdminReviewedAt] datetime2 NULL,
        [UniversityAdminNotes] nvarchar(1000) NULL,
        [InstitutionDecision] nvarchar(50) NOT NULL,
        [InstitutionOfficerID] nvarchar(450) NULL,
        [InstitutionReviewedAt] datetime2 NULL,
        [InstitutionNotes] nvarchar(1000) NULL,
        CONSTRAINT [PK_TrainingApplications] PRIMARY KEY ([ApplicationID]),
        CONSTRAINT [FK_TrainingApplications_AspNetUsers_DepartmentHeadID] FOREIGN KEY ([DepartmentHeadID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrainingApplications_AspNetUsers_InstitutionOfficerID] FOREIGN KEY ([InstitutionOfficerID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrainingApplications_AspNetUsers_UniversityAdminID] FOREIGN KEY ([UniversityAdminID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrainingApplications_Students_StudentID] FOREIGN KEY ([StudentID]) REFERENCES [Students] ([StudentID]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrainingApplications_TrainingOpportunities_OpportunityID] FOREIGN KEY ([OpportunityID]) REFERENCES [TrainingOpportunities] ([OpportunityID]) ON DELETE NO ACTION
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [TrainingPlacements] (
        [PlacementID] int NOT NULL IDENTITY,
        [OpportunityID] int NOT NULL,
        [ApplicationID] int NOT NULL,
        [StudentID] int NOT NULL,
        [InstitutionID] int NOT NULL,
        [TermID] int NOT NULL,
        [UniversitySupervisorID] nvarchar(450) NULL,
        [InstitutionSupervisorID] nvarchar(450) NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NOT NULL,
        [Status] nvarchar(50) NOT NULL,
        [Notes] nvarchar(1000) NULL,
        [TrainingOpportunityOpportunityID] int NULL,
        CONSTRAINT [PK_TrainingPlacements] PRIMARY KEY ([PlacementID]),
        CONSTRAINT [FK_TrainingPlacements_AspNetUsers_InstitutionSupervisorID] FOREIGN KEY ([InstitutionSupervisorID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrainingPlacements_AspNetUsers_UniversitySupervisorID] FOREIGN KEY ([UniversitySupervisorID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrainingPlacements_Students_StudentID] FOREIGN KEY ([StudentID]) REFERENCES [Students] ([StudentID]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrainingPlacements_TrainingApplications_ApplicationID] FOREIGN KEY ([ApplicationID]) REFERENCES [TrainingApplications] ([ApplicationID]) ON DELETE CASCADE,
        CONSTRAINT [FK_TrainingPlacements_TrainingInstitutions_InstitutionID] FOREIGN KEY ([InstitutionID]) REFERENCES [TrainingInstitutions] ([InstituationID]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrainingPlacements_TrainingOpportunities_OpportunityID] FOREIGN KEY ([OpportunityID]) REFERENCES [TrainingOpportunities] ([OpportunityID]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrainingPlacements_TrainingOpportunities_TrainingOpportunityOpportunityID] FOREIGN KEY ([TrainingOpportunityOpportunityID]) REFERENCES [TrainingOpportunities] ([OpportunityID]),
        CONSTRAINT [FK_TrainingPlacements_TrainingTerms_TermID] FOREIGN KEY ([TermID]) REFERENCES [TrainingTerms] ([TermID]) ON DELETE NO ACTION
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [AttendanceRecords] (
        [AttendanceID] int NOT NULL IDENTITY,
        [PlacementID] int NOT NULL,
        [AttendanceDate] datetime2 NOT NULL,
        [CheckInTime] time NULL,
        [CheckOutTime] time NULL,
        [Status] nvarchar(50) NOT NULL,
        [InstitutionSupervisorID] nvarchar(450) NOT NULL,
        [Notes] nvarchar(500) NULL,
        CONSTRAINT [PK_AttendanceRecords] PRIMARY KEY ([AttendanceID]),
        CONSTRAINT [FK_AttendanceRecords_AspNetUsers_InstitutionSupervisorID] FOREIGN KEY ([InstitutionSupervisorID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_AttendanceRecords_TrainingPlacements_PlacementID] FOREIGN KEY ([PlacementID]) REFERENCES [TrainingPlacements] ([PlacementID]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [FieldVisits] (
        [VisitID] int NOT NULL IDENTITY,
        [PlacementID] int NOT NULL,
        [UniversitySupervisorID] nvarchar(450) NOT NULL,
        [VisitDate] datetime2 NOT NULL,
        [Type] nvarchar(50) NOT NULL,
        [Score] decimal(5,2) NULL,
        [MaxScore] decimal(5,2) NULL,
        [Notes] nvarchar(1000) NULL,
        [AttachmentPath] nvarchar(max) NULL,
        [CreatedAt] datetime2 NOT NULL,
        CONSTRAINT [PK_FieldVisits] PRIMARY KEY ([VisitID]),
        CONSTRAINT [FK_FieldVisits_AspNetUsers_UniversitySupervisorID] FOREIGN KEY ([UniversitySupervisorID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_FieldVisits_TrainingPlacements_PlacementID] FOREIGN KEY ([PlacementID]) REFERENCES [TrainingPlacements] ([PlacementID]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [StudentEvaluations] (
        [EvaluationID] int NOT NULL IDENTITY,
        [PlacementID] int NOT NULL,
        [UniversitySupervisorID] nvarchar(450) NULL,
        [InstitutionSupervisorID] nvarchar(450) NULL,
        [Type] nvarchar(50) NOT NULL,
        [EvaluationDate] datetime2 NOT NULL,
        [Score] decimal(5,2) NOT NULL,
        [MaxScore] decimal(5,2) NOT NULL,
        [Notes] nvarchar(2000) NOT NULL,
        [EvaluationPdfPath] nvarchar(max) NOT NULL,
        [Status] nvarchar(50) NOT NULL,
        [CreatedAt] datetime2 NOT NULL,
        CONSTRAINT [PK_StudentEvaluations] PRIMARY KEY ([EvaluationID]),
        CONSTRAINT [FK_StudentEvaluations_AspNetUsers_InstitutionSupervisorID] FOREIGN KEY ([InstitutionSupervisorID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_StudentEvaluations_AspNetUsers_UniversitySupervisorID] FOREIGN KEY ([UniversitySupervisorID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_StudentEvaluations_TrainingPlacements_PlacementID] FOREIGN KEY ([PlacementID]) REFERENCES [TrainingPlacements] ([PlacementID]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE TABLE [StudentReports] (
        [ReportID] int NOT NULL IDENTITY,
        [PlacementID] int NOT NULL,
        [StudentID] int NOT NULL,
        [Type] nvarchar(50) NOT NULL,
        [Title] nvarchar(300) NOT NULL,
        [Content] nvarchar(max) NULL,
        [FilePath] nvarchar(max) NULL,
        [SubmittedAt] datetime2 NOT NULL,
        [Status] nvarchar(50) NOT NULL,
        [UniversitySupervisorID] nvarchar(450) NULL,
        [ReviewNotes] nvarchar(1000) NULL,
        CONSTRAINT [PK_StudentReports] PRIMARY KEY ([ReportID]),
        CONSTRAINT [FK_StudentReports_AspNetUsers_UniversitySupervisorID] FOREIGN KEY ([UniversitySupervisorID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_StudentReports_Students_StudentID] FOREIGN KEY ([StudentID]) REFERENCES [Students] ([StudentID]) ON DELETE NO ACTION,
        CONSTRAINT [FK_StudentReports_TrainingPlacements_PlacementID] FOREIGN KEY ([PlacementID]) REFERENCES [TrainingPlacements] ([PlacementID]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''1'', N''1'', N''UniversityTrainingAdmin'', N''UNIVERSITYTRAININGADMIN''),
    (N''2'', N''2'', N''DepartmentHead'', N''DEPARTMENTHEAD''),
    (N''3'', N''3'', N''UniversitySupervisor'', N''UNIVERSITYSUPERVISOR''),
    (N''4'', N''4'', N''InstitutionTrainingOfficer'', N''INSTITUTIONTRAININGOFFICER''),
    (N''5'', N''5'', N''InstitutionSupervisor'', N''INSTITUTIONSUPERVISOR''),
    (N''6'', N''6'', N''Student'', N''STUDENT'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_AspNetRoleScopes_DepartmentID] ON [AspNetRoleScopes] ([DepartmentID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_AspNetRoleScopes_InstitutionID] ON [AspNetRoleScopes] ([InstitutionID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_AspNetRoleScopes_RoleID] ON [AspNetRoleScopes] ([RoleID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_AspNetRoleScopes_UniversityID] ON [AspNetRoleScopes] ([UniversityID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_AspNetRoleScopes_UserID] ON [AspNetRoleScopes] ([UserID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_AttendanceRecords_InstitutionSupervisorID] ON [AttendanceRecords] ([InstitutionSupervisorID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_AttendanceRecords_PlacementID_AttendanceDate] ON [AttendanceRecords] ([PlacementID], [AttendanceDate]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_Departments_UniversityID] ON [Departments] ([UniversityID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_EmailVerificationCodes_UserId] ON [EmailVerificationCodes] ([UserId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_FieldVisits_PlacementID] ON [FieldVisits] ([PlacementID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_FieldVisits_UniversitySupervisorID] ON [FieldVisits] ([UniversitySupervisorID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_OpportunityRequestInstitutions_InstitutionID] ON [OpportunityRequestInstitutions] ([InstitutionID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_OpportunityRequestInstitutions_RequestID] ON [OpportunityRequestInstitutions] ([RequestID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_OpportunitySkills_OpportunityID_SkillID] ON [OpportunitySkills] ([OpportunityID], [SkillID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_OpportunitySkills_SkillID] ON [OpportunitySkills] ([SkillID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_OpportunitySpecialties_OpportunityID_SpecialtyID] ON [OpportunitySpecialties] ([OpportunityID], [SpecialtyID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_OpportunitySpecialties_SpecialtyID] ON [OpportunitySpecialties] ([SpecialtyID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_PortfolioItems_StudentID] ON [PortfolioItems] ([StudentID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_RequestSkills_RequestID_SkillID] ON [RequestSkills] ([RequestID], [SkillID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_RequestSkills_SkillID] ON [RequestSkills] ([SkillID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_RequestSpecialties_RequestID_SpecialtyID] ON [RequestSpecialties] ([RequestID], [SpecialtyID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_RequestSpecialties_SpecialtyID] ON [RequestSpecialties] ([SpecialtyID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_Skills_Name] ON [Skills] ([Name]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_Specialties_DepartmentID] ON [Specialties] ([DepartmentID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_Specialties_Name] ON [Specialties] ([Name]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_StudentEvaluations_InstitutionSupervisorID] ON [StudentEvaluations] ([InstitutionSupervisorID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_StudentEvaluations_PlacementID] ON [StudentEvaluations] ([PlacementID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_StudentEvaluations_UniversitySupervisorID] ON [StudentEvaluations] ([UniversitySupervisorID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_StudentReports_PlacementID] ON [StudentReports] ([PlacementID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_StudentReports_StudentID] ON [StudentReports] ([StudentID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_StudentReports_UniversitySupervisorID] ON [StudentReports] ([UniversitySupervisorID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_Students_DepartmentID] ON [Students] ([DepartmentID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_Students_SpecialtyID] ON [Students] ([SpecialtyID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_Students_StudentNumber] ON [Students] ([StudentNumber]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_Students_UniversityID] ON [Students] ([UniversityID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_Students_UserID] ON [Students] ([UserID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_StudentSkills_SkillID] ON [StudentSkills] ([SkillID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_StudentSkills_StudentID_SkillID] ON [StudentSkills] ([StudentID], [SkillID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingApplications_DepartmentHeadID] ON [TrainingApplications] ([DepartmentHeadID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingApplications_InstitutionOfficerID] ON [TrainingApplications] ([InstitutionOfficerID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_TrainingApplications_OpportunityID_StudentID] ON [TrainingApplications] ([OpportunityID], [StudentID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingApplications_StudentID] ON [TrainingApplications] ([StudentID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingApplications_UniversityAdminID] ON [TrainingApplications] ([UniversityAdminID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_TrainingInstitutions_UserID] ON [TrainingInstitutions] ([UserID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingOpportunities_InstitutionID] ON [TrainingOpportunities] ([InstitutionID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingOpportunities_InstitutionOfficerID] ON [TrainingOpportunities] ([InstitutionOfficerID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingOpportunities_RequestID] ON [TrainingOpportunities] ([RequestID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingOpportunities_TermID] ON [TrainingOpportunities] ([TermID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingOpportunities_TrainingTermTermID] ON [TrainingOpportunities] ([TrainingTermTermID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingOpportunityRequests_DepartmentHeadID] ON [TrainingOpportunityRequests] ([DepartmentHeadID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingOpportunityRequests_DepartmentID] ON [TrainingOpportunityRequests] ([DepartmentID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingOpportunityRequests_TermID] ON [TrainingOpportunityRequests] ([TermID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingOpportunityRequests_UniversityAdminID] ON [TrainingOpportunityRequests] ([UniversityAdminID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingOpportunityRequests_UniversityID] ON [TrainingOpportunityRequests] ([UniversityID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_TrainingPlacements_ApplicationID] ON [TrainingPlacements] ([ApplicationID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingPlacements_InstitutionID] ON [TrainingPlacements] ([InstitutionID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingPlacements_InstitutionSupervisorID] ON [TrainingPlacements] ([InstitutionSupervisorID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingPlacements_OpportunityID] ON [TrainingPlacements] ([OpportunityID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingPlacements_StudentID] ON [TrainingPlacements] ([StudentID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingPlacements_TermID] ON [TrainingPlacements] ([TermID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingPlacements_TrainingOpportunityOpportunityID] ON [TrainingPlacements] ([TrainingOpportunityOpportunityID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE INDEX [IX_TrainingPlacements_UniversitySupervisorID] ON [TrainingPlacements] ([UniversitySupervisorID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    CREATE UNIQUE INDEX [IX_Universities_UserID] ON [Universities] ([UserID]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260611094347_init'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20260611094347_init', N'10.0.8');
END;

COMMIT;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260612124828_RemoveGhostTrainingOpportunityRelation'
)
BEGIN
    ALTER TABLE [TrainingPlacements] DROP CONSTRAINT [FK_TrainingPlacements_AspNetUsers_InstitutionSupervisorID];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260612124828_RemoveGhostTrainingOpportunityRelation'
)
BEGIN
    ALTER TABLE [TrainingPlacements] DROP CONSTRAINT [FK_TrainingPlacements_TrainingOpportunities_TrainingOpportunityOpportunityID];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260612124828_RemoveGhostTrainingOpportunityRelation'
)
BEGIN
    DROP INDEX [IX_TrainingPlacements_TrainingOpportunityOpportunityID] ON [TrainingPlacements];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260612124828_RemoveGhostTrainingOpportunityRelation'
)
BEGIN
    DECLARE @var nvarchar(max);
    SELECT @var = QUOTENAME([d].[name])
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[TrainingPlacements]') AND [c].[name] = N'TrainingOpportunityOpportunityID');
    IF @var IS NOT NULL EXEC(N'ALTER TABLE [TrainingPlacements] DROP CONSTRAINT ' + @var + ';');
    ALTER TABLE [TrainingPlacements] DROP COLUMN [TrainingOpportunityOpportunityID];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260612124828_RemoveGhostTrainingOpportunityRelation'
)
BEGIN
    ALTER TABLE [TrainingPlacements] ADD CONSTRAINT [FK_TrainingPlacements_AspNetUsers_InstitutionSupervisorID] FOREIGN KEY ([InstitutionSupervisorID]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260612124828_RemoveGhostTrainingOpportunityRelation'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20260612124828_RemoveGhostTrainingOpportunityRelation', N'10.0.8');
END;

COMMIT;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260614101334_addProfileImage'
)
BEGIN
    ALTER TABLE [AspNetUsers] ADD [ProfileImagePath] nvarchar(max) NULL;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260614101334_addProfileImage'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20260614101334_addProfileImage', N'10.0.8');
END;

COMMIT;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260807120806_AddNotificationSystem'
)
BEGIN
    CREATE TABLE [Notifications] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [Title] nvarchar(200) NOT NULL,
        [Message] nvarchar(max) NOT NULL,
        [Type] nvarchar(50) NOT NULL,
        [Icon] nvarchar(100) NULL,
        [Url] nvarchar(500) NULL,
        [IsRead] bit NOT NULL,
        [CreatedAt] datetime2 NOT NULL,
        [ReadAt] datetime2 NULL,
        [SenderId] nvarchar(450) NULL,
        [ReferenceId] nvarchar(100) NULL,
        [ReferenceType] nvarchar(100) NULL,
        CONSTRAINT [PK_Notifications] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Notifications_AspNetUsers_SenderId] FOREIGN KEY ([SenderId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Notifications_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260807120806_AddNotificationSystem'
)
BEGIN
    CREATE INDEX [IX_Notifications_CreatedAt] ON [Notifications] ([CreatedAt]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260807120806_AddNotificationSystem'
)
BEGIN
    CREATE INDEX [IX_Notifications_IsRead] ON [Notifications] ([IsRead]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260807120806_AddNotificationSystem'
)
BEGIN
    CREATE INDEX [IX_Notifications_SenderId] ON [Notifications] ([SenderId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260807120806_AddNotificationSystem'
)
BEGIN
    CREATE INDEX [IX_Notifications_UserId] ON [Notifications] ([UserId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20260807120806_AddNotificationSystem'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20260807120806_AddNotificationSystem', N'10.0.8');
END;

COMMIT;
GO

