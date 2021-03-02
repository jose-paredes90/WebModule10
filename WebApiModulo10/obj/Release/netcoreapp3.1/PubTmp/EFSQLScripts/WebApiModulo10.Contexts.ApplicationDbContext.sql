IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190210144614_Initial')
BEGIN
    CREATE TABLE [Autores] (
        [Id] int NOT NULL IDENTITY,
        [Nombre] nvarchar(max) NOT NULL,
        [Identificacion] nvarchar(max) NULL,
        [FechaNacimiento] datetime2 NOT NULL,
        CONSTRAINT [PK_Autores] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190210144614_Initial')
BEGIN
    CREATE TABLE [Libro] (
        [Id] int NOT NULL IDENTITY,
        [Titulo] nvarchar(max) NULL,
        [AutorId] int NOT NULL,
        CONSTRAINT [PK_Libro] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Libro_Autores_AutorId] FOREIGN KEY ([AutorId]) REFERENCES [Autores] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190210144614_Initial')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'FechaNacimiento', N'Identificacion', N'Nombre') AND [object_id] = OBJECT_ID(N'[Autores]'))
        SET IDENTITY_INSERT [Autores] ON;
    INSERT INTO [Autores] ([Id], [FechaNacimiento], [Identificacion], [Nombre])
    VALUES (1, '1900-02-05T00:00:00.0000000', NULL, N'Felipe Gavilán');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'FechaNacimiento', N'Identificacion', N'Nombre') AND [object_id] = OBJECT_ID(N'[Autores]'))
        SET IDENTITY_INSERT [Autores] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190210144614_Initial')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'FechaNacimiento', N'Identificacion', N'Nombre') AND [object_id] = OBJECT_ID(N'[Autores]'))
        SET IDENTITY_INSERT [Autores] ON;
    INSERT INTO [Autores] ([Id], [FechaNacimiento], [Identificacion], [Nombre])
    VALUES (2, '1905-04-15T00:00:00.0000000', NULL, N'Claudia Rodríguez');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'FechaNacimiento', N'Identificacion', N'Nombre') AND [object_id] = OBJECT_ID(N'[Autores]'))
        SET IDENTITY_INSERT [Autores] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190210144614_Initial')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AutorId', N'Titulo') AND [object_id] = OBJECT_ID(N'[Libro]'))
        SET IDENTITY_INSERT [Libro] ON;
    INSERT INTO [Libro] ([Id], [AutorId], [Titulo])
    VALUES (1, 1, N'Entity Framework Core 2.1 - De verdad');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AutorId', N'Titulo') AND [object_id] = OBJECT_ID(N'[Libro]'))
        SET IDENTITY_INSERT [Libro] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190210144614_Initial')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AutorId', N'Titulo') AND [object_id] = OBJECT_ID(N'[Libro]'))
        SET IDENTITY_INSERT [Libro] ON;
    INSERT INTO [Libro] ([Id], [AutorId], [Titulo])
    VALUES (2, 2, N'Construyendo Web APIs con ASP.NET Core 2.2');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AutorId', N'Titulo') AND [object_id] = OBJECT_ID(N'[Libro]'))
        SET IDENTITY_INSERT [Libro] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190210144614_Initial')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AutorId', N'Titulo') AND [object_id] = OBJECT_ID(N'[Libro]'))
        SET IDENTITY_INSERT [Libro] ON;
    INSERT INTO [Libro] ([Id], [AutorId], [Titulo])
    VALUES (3, 2, N'Libro de prueba');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AutorId', N'Titulo') AND [object_id] = OBJECT_ID(N'[Libro]'))
        SET IDENTITY_INSERT [Libro] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190210144614_Initial')
BEGIN
    CREATE INDEX [IX_Libro_AutorId] ON [Libro] ([AutorId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190210144614_Initial')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20190210144614_Initial', N'3.1.4');
END;

GO

