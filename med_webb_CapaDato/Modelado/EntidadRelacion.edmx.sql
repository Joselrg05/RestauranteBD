
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/17/2024 17:53:28
-- Generated from EDMX file: C:\Users\jr703\source\repos\RestauranteBD\med_webb_CapaDato\Modelado\EntidadRelacion.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Med_Webb_Database];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__DetallePe__Pedid__534D60F1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DetallePedido] DROP CONSTRAINT [FK__DetallePe__Pedid__534D60F1];
GO
IF OBJECT_ID(N'[dbo].[FK__DetallePe__Plati__5441852A]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DetallePedido] DROP CONSTRAINT [FK__DetallePe__Plati__5441852A];
GO
IF OBJECT_ID(N'[dbo].[FK__DetalleVe__Plati__5BE2A6F2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DetalleVentaPlatillo] DROP CONSTRAINT [FK__DetalleVe__Plati__5BE2A6F2];
GO
IF OBJECT_ID(N'[dbo].[FK__DetalleVe__Venta__5AEE82B9]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DetalleVentaPlatillo] DROP CONSTRAINT [FK__DetalleVe__Venta__5AEE82B9];
GO
IF OBJECT_ID(N'[dbo].[FK__Pedido__ClienteI__4E88ABD4]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT [FK__Pedido__ClienteI__4E88ABD4];
GO
IF OBJECT_ID(N'[dbo].[FK__Pedido__MesaId__4F7CD00D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT [FK__Pedido__MesaId__4F7CD00D];
GO
IF OBJECT_ID(N'[dbo].[FK__Platillo__Catego__44FF419A]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Platillo] DROP CONSTRAINT [FK__Platillo__Catego__44FF419A];
GO
IF OBJECT_ID(N'[dbo].[FK__Reserva__Cliente__4AB81AF0]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reserva] DROP CONSTRAINT [FK__Reserva__Cliente__4AB81AF0];
GO
IF OBJECT_ID(N'[dbo].[FK__Reserva__MesaId__4BAC3F29]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reserva] DROP CONSTRAINT [FK__Reserva__MesaId__4BAC3F29];
GO
IF OBJECT_ID(N'[dbo].[FK__Venta__ClienteId__5812160E]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Venta] DROP CONSTRAINT [FK__Venta__ClienteId__5812160E];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Categoria]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categoria];
GO
IF OBJECT_ID(N'[dbo].[Cliente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cliente];
GO
IF OBJECT_ID(N'[dbo].[DetallePedido]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DetallePedido];
GO
IF OBJECT_ID(N'[dbo].[DetalleVentaPlatillo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DetalleVentaPlatillo];
GO
IF OBJECT_ID(N'[dbo].[Mesa]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Mesa];
GO
IF OBJECT_ID(N'[dbo].[Pedido]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pedido];
GO
IF OBJECT_ID(N'[dbo].[Platillo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Platillo];
GO
IF OBJECT_ID(N'[dbo].[Reserva]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reserva];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuario];
GO
IF OBJECT_ID(N'[dbo].[Venta]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Venta];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categorias'
CREATE TABLE [dbo].[Categorias] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Descripcion] varchar(100)  NULL,
    [Activo] bit  NOT NULL,
    [FechaRegistro] datetime  NOT NULL
);
GO

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombres] varchar(100)  NOT NULL,
    [Apellidos] varchar(100)  NOT NULL,
    [Correo] varchar(100)  NOT NULL,
    [Contrasena] varchar(100)  NOT NULL,
    [Direccion] varchar(500)  NULL,
    [Telefono] varchar(50)  NULL,
    [FechaRegistro] datetime  NOT NULL
);
GO

-- Creating table 'DetallePedidoes'
CREATE TABLE [dbo].[DetallePedidoes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PedidoId] int  NULL,
    [PlatilloId] int  NULL,
    [Cantidad] int  NOT NULL,
    [Total] decimal(10,2)  NOT NULL
);
GO

-- Creating table 'DetalleVentaPlatilloes'
CREATE TABLE [dbo].[DetalleVentaPlatilloes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [VentaId] int  NULL,
    [PlatilloId] int  NULL,
    [Cantidad] int  NOT NULL,
    [Total] decimal(10,2)  NOT NULL
);
GO

-- Creating table 'Mesas'
CREATE TABLE [dbo].[Mesas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NumeroMesa] int  NOT NULL,
    [Ubicacion] varchar(100)  NULL,
    [Capacidad] int  NOT NULL,
    [Estado] bit  NOT NULL
);
GO

-- Creating table 'Pedidoes'
CREATE TABLE [dbo].[Pedidoes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ClienteId] int  NULL,
    [MesaId] int  NULL,
    [CantidadPlatillo] int  NOT NULL,
    [FechaPedido] datetime  NOT NULL,
    [EstadoPedido] varchar(50)  NOT NULL
);
GO

-- Creating table 'Platilloes'
CREATE TABLE [dbo].[Platilloes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(500)  NOT NULL,
    [Descripcion] varchar(500)  NULL,
    [CategoriaId] int  NULL,
    [Precio] decimal(10,2)  NOT NULL,
    [Activo] bit  NOT NULL,
    [FechaRegistro] datetime  NOT NULL
);
GO

-- Creating table 'Reservas'
CREATE TABLE [dbo].[Reservas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ClienteId] int  NULL,
    [MesaId] int  NULL,
    [FechaReserva] datetime  NOT NULL,
    [CantidadPersonas] int  NOT NULL,
    [EstadoReserva] varchar(50)  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombres] varchar(100)  NOT NULL,
    [Apellidos] varchar(100)  NOT NULL,
    [Correo] varchar(100)  NOT NULL,
    [Contrasena] varchar(100)  NOT NULL,
    [Reestablecer] bit  NOT NULL,
    [Activo] bit  NOT NULL,
    [FechaRegistro] datetime  NOT NULL
);
GO

-- Creating table 'Ventas'
CREATE TABLE [dbo].[Ventas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CantidadPlatillo] int  NOT NULL,
    [MontoTotal] decimal(10,2)  NOT NULL,
    [Contacto] varchar(100)  NULL,
    [Telefono] varchar(50)  NULL,
    [Direccion] varchar(500)  NULL,
    [FechaVenta] datetime  NOT NULL,
    [ClienteId] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Categorias'
ALTER TABLE [dbo].[Categorias]
ADD CONSTRAINT [PK_Categorias]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DetallePedidoes'
ALTER TABLE [dbo].[DetallePedidoes]
ADD CONSTRAINT [PK_DetallePedidoes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DetalleVentaPlatilloes'
ALTER TABLE [dbo].[DetalleVentaPlatilloes]
ADD CONSTRAINT [PK_DetalleVentaPlatilloes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Mesas'
ALTER TABLE [dbo].[Mesas]
ADD CONSTRAINT [PK_Mesas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pedidoes'
ALTER TABLE [dbo].[Pedidoes]
ADD CONSTRAINT [PK_Pedidoes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Platilloes'
ALTER TABLE [dbo].[Platilloes]
ADD CONSTRAINT [PK_Platilloes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Reservas'
ALTER TABLE [dbo].[Reservas]
ADD CONSTRAINT [PK_Reservas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [Id] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [PK_Ventas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CategoriaId] in table 'Platilloes'
ALTER TABLE [dbo].[Platilloes]
ADD CONSTRAINT [FK__Platillo__Catego__44FF419A]
    FOREIGN KEY ([CategoriaId])
    REFERENCES [dbo].[Categorias]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Platillo__Catego__44FF419A'
CREATE INDEX [IX_FK__Platillo__Catego__44FF419A]
ON [dbo].[Platilloes]
    ([CategoriaId]);
GO

-- Creating foreign key on [ClienteId] in table 'Pedidoes'
ALTER TABLE [dbo].[Pedidoes]
ADD CONSTRAINT [FK__Pedido__ClienteI__4E88ABD4]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Pedido__ClienteI__4E88ABD4'
CREATE INDEX [IX_FK__Pedido__ClienteI__4E88ABD4]
ON [dbo].[Pedidoes]
    ([ClienteId]);
GO

-- Creating foreign key on [ClienteId] in table 'Reservas'
ALTER TABLE [dbo].[Reservas]
ADD CONSTRAINT [FK__Reserva__Cliente__4AB81AF0]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Reserva__Cliente__4AB81AF0'
CREATE INDEX [IX_FK__Reserva__Cliente__4AB81AF0]
ON [dbo].[Reservas]
    ([ClienteId]);
GO

-- Creating foreign key on [ClienteId] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [FK__Venta__ClienteId__5812160E]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Venta__ClienteId__5812160E'
CREATE INDEX [IX_FK__Venta__ClienteId__5812160E]
ON [dbo].[Ventas]
    ([ClienteId]);
GO

-- Creating foreign key on [PedidoId] in table 'DetallePedidoes'
ALTER TABLE [dbo].[DetallePedidoes]
ADD CONSTRAINT [FK__DetallePe__Pedid__534D60F1]
    FOREIGN KEY ([PedidoId])
    REFERENCES [dbo].[Pedidoes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__DetallePe__Pedid__534D60F1'
CREATE INDEX [IX_FK__DetallePe__Pedid__534D60F1]
ON [dbo].[DetallePedidoes]
    ([PedidoId]);
GO

-- Creating foreign key on [PlatilloId] in table 'DetallePedidoes'
ALTER TABLE [dbo].[DetallePedidoes]
ADD CONSTRAINT [FK__DetallePe__Plati__5441852A]
    FOREIGN KEY ([PlatilloId])
    REFERENCES [dbo].[Platilloes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__DetallePe__Plati__5441852A'
CREATE INDEX [IX_FK__DetallePe__Plati__5441852A]
ON [dbo].[DetallePedidoes]
    ([PlatilloId]);
GO

-- Creating foreign key on [PlatilloId] in table 'DetalleVentaPlatilloes'
ALTER TABLE [dbo].[DetalleVentaPlatilloes]
ADD CONSTRAINT [FK__DetalleVe__Plati__5BE2A6F2]
    FOREIGN KEY ([PlatilloId])
    REFERENCES [dbo].[Platilloes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__DetalleVe__Plati__5BE2A6F2'
CREATE INDEX [IX_FK__DetalleVe__Plati__5BE2A6F2]
ON [dbo].[DetalleVentaPlatilloes]
    ([PlatilloId]);
GO

-- Creating foreign key on [VentaId] in table 'DetalleVentaPlatilloes'
ALTER TABLE [dbo].[DetalleVentaPlatilloes]
ADD CONSTRAINT [FK__DetalleVe__Venta__5AEE82B9]
    FOREIGN KEY ([VentaId])
    REFERENCES [dbo].[Ventas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__DetalleVe__Venta__5AEE82B9'
CREATE INDEX [IX_FK__DetalleVe__Venta__5AEE82B9]
ON [dbo].[DetalleVentaPlatilloes]
    ([VentaId]);
GO

-- Creating foreign key on [MesaId] in table 'Pedidoes'
ALTER TABLE [dbo].[Pedidoes]
ADD CONSTRAINT [FK__Pedido__MesaId__4F7CD00D]
    FOREIGN KEY ([MesaId])
    REFERENCES [dbo].[Mesas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Pedido__MesaId__4F7CD00D'
CREATE INDEX [IX_FK__Pedido__MesaId__4F7CD00D]
ON [dbo].[Pedidoes]
    ([MesaId]);
GO

-- Creating foreign key on [MesaId] in table 'Reservas'
ALTER TABLE [dbo].[Reservas]
ADD CONSTRAINT [FK__Reserva__MesaId__4BAC3F29]
    FOREIGN KEY ([MesaId])
    REFERENCES [dbo].[Mesas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Reserva__MesaId__4BAC3F29'
CREATE INDEX [IX_FK__Reserva__MesaId__4BAC3F29]
ON [dbo].[Reservas]
    ([MesaId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------