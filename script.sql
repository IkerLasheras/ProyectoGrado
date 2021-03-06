USE [master]
GO
/****** Object:  Database [Proyecto]    Script Date: 28/04/2022 19:02:54 ******/
CREATE DATABASE [Proyecto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyecto', FILENAME = N'C:\SQLData\MSSQL15.PROVIS19\MSSQL\DATA\Proyecto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proyecto_log', FILENAME = N'C:\SQLData\MSSQL15.PROVIS19\MSSQL\DATA\Proyecto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Proyecto] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyecto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyecto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyecto] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyecto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyecto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyecto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyecto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyecto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyecto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proyecto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyecto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyecto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyecto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyecto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyecto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyecto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyecto] SET RECOVERY FULL 
GO
ALTER DATABASE [Proyecto] SET  MULTI_USER 
GO
ALTER DATABASE [Proyecto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyecto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyecto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyecto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proyecto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Proyecto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Proyecto', N'ON'
GO
ALTER DATABASE [Proyecto] SET QUERY_STORE = OFF
GO
USE [Proyecto]
GO
/****** Object:  Table [dbo].[Bebidas]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bebidas](
	[idBebida] [int] NOT NULL,
	[tipoBebida] [int] NOT NULL,
	[precio] [numeric](5, 2) NOT NULL,
	[productosUilizados] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] NOT NULL,
	[descripcionCategoria] [nchar](100) NOT NULL,
	[imgCategoria] [image] NULL,
	[nombre] [nchar](20) NULL,
 CONSTRAINT [PK_idCategoria] PRIMARY KEY NONCLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriasProveedor]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriasProveedor](
	[idCategoriaProveedor] [int] NOT NULL,
	[nombreCategroria] [varchar](20) NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_idCategoriaProveedor] PRIMARY KEY CLUSTERED 
(
	[idCategoriaProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[idEmpleado] [int] NOT NULL,
	[nombre] [nchar](15) NOT NULL,
	[apellido1] [nchar](15) NOT NULL,
	[apellido2] [nchar](15) NULL,
	[dni] [nchar](9) NOT NULL,
	[telefono] [nchar](9) NULL,
	[email] [nchar](40) NULL,
	[fechNac] [date] NULL,
	[localidad] [nchar](25) NULL,
	[direccion] [nchar](25) NULL,
	[cp] [int] NULL,
	[tipoEmpleado] [int] NULL,
	[cuentaCredito] [nchar](20) NOT NULL,
	[fechIncicioContrato] [date] NOT NULL,
	[sueldoBase] [numeric](7, 2) NOT NULL,
	[imgEmpleado] [image] NULL,
 CONSTRAINT [PK_idEmpleado] PRIMARY KEY NONCLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientesPlatos]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientesPlatos](
	[idIngredientePlato] [int] NOT NULL,
	[plato] [int] NOT NULL,
	[producto] [int] NOT NULL,
 CONSTRAINT [PK_idIngredientePlato] PRIMARY KEY NONCLUSTERED 
(
	[idIngredientePlato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesas]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesas](
	[idMesa] [int] NOT NULL,
	[ubicacion] [int] NOT NULL,
	[disponible] [bit] NOT NULL,
 CONSTRAINT [PK_idMesa] PRIMARY KEY NONCLUSTERED 
(
	[idMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedidoMesa]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedidoMesa](
	[idMesa] [int] NOT NULL,
	[pedidos] [varchar](100) NULL,
	[idEmpleado] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[idPedido] [int] NOT NULL,
	[costeTotal] [numeric](6, 2) NOT NULL,
	[fechaPedido] [date] NOT NULL,
 CONSTRAINT [PK_idPedido] PRIMARY KEY NONCLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Platos]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platos](
	[idPlato] [int] NOT NULL,
	[precio] [numeric](3, 2) NOT NULL,
	[tipoPlato] [int] NULL,
	[ingredientes] [varchar](50) NULL,
 CONSTRAINT [PK_idPlato] PRIMARY KEY NONCLUSTERED 
(
	[idPlato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[idProducto] [int] NOT NULL,
	[codigoProducto] [nchar](15) NOT NULL,
	[nombreProducto] [nchar](20) NOT NULL,
	[cantidadStock] [int] NOT NULL,
	[categoriaProducto] [int] NOT NULL,
	[costeUnitario] [numeric](4, 2) NOT NULL,
	[imgProducto] [image] NULL,
 CONSTRAINT [PK_idProducto] PRIMARY KEY NONCLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[idProveedor] [int] NOT NULL,
	[categoriaProveedor] [int] NOT NULL,
	[nombreProveedor] [varchar](25) NOT NULL,
	[localizacionProveedor] [varchar](50) NULL,
	[iban] [nchar](24) NULL,
 CONSTRAINT [PK_idProveedor] PRIMARY KEY NONCLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubPedidos]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubPedidos](
	[idSubPedido] [int] NOT NULL,
	[idPedido] [int] NOT NULL,
	[proveedorSubPedido] [int] NOT NULL,
	[costeSubpedido] [numeric](5, 2) NULL,
	[idProducto] [int] NULL,
 CONSTRAINT [PK_idSubPedido] PRIMARY KEY NONCLUSTERED 
(
	[idSubPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipobebida]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipobebida](
	[idTipoBebida] [int] NOT NULL,
	[nombre] [nchar](20) NOT NULL,
 CONSTRAINT [PK_idTipoBebida] PRIMARY KEY CLUSTERED 
(
	[idTipoBebida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpleado](
	[idTipoEmpleado] [int] NOT NULL,
	[nombreTipoEmpleado] [nchar](25) NOT NULL,
	[sueldoBase] [numeric](6, 2) NULL,
 CONSTRAINT [PK_idTipoEmpleado] PRIMARY KEY CLUSTERED 
(
	[idTipoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPlatos]    Script Date: 28/04/2022 19:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPlatos](
	[idTipoPlato] [int] NOT NULL,
	[nombreTipo] [nchar](15) NOT NULL,
 CONSTRAINT [PK_idTipoPlato] PRIMARY KEY CLUSTERED 
(
	[idTipoPlato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bebidas]  WITH CHECK ADD  CONSTRAINT [FK_tipobebida] FOREIGN KEY([tipoBebida])
REFERENCES [dbo].[Tipobebida] ([idTipoBebida])
GO
ALTER TABLE [dbo].[Bebidas] CHECK CONSTRAINT [FK_tipobebida]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_tipoEmpleado] FOREIGN KEY([tipoEmpleado])
REFERENCES [dbo].[TipoEmpleado] ([idTipoEmpleado])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_tipoEmpleado]
GO
ALTER TABLE [dbo].[IngredientesPlatos]  WITH CHECK ADD  CONSTRAINT [FK_plato] FOREIGN KEY([plato])
REFERENCES [dbo].[Platos] ([idPlato])
GO
ALTER TABLE [dbo].[IngredientesPlatos] CHECK CONSTRAINT [FK_plato]
GO
ALTER TABLE [dbo].[IngredientesPlatos]  WITH CHECK ADD  CONSTRAINT [FK_productoIngrediente] FOREIGN KEY([producto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[IngredientesPlatos] CHECK CONSTRAINT [FK_productoIngrediente]
GO
ALTER TABLE [dbo].[pedidoMesa]  WITH CHECK ADD  CONSTRAINT [FK_idEMpleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleados] ([idEmpleado])
GO
ALTER TABLE [dbo].[pedidoMesa] CHECK CONSTRAINT [FK_idEMpleado]
GO
ALTER TABLE [dbo].[pedidoMesa]  WITH CHECK ADD  CONSTRAINT [FK_idMesa] FOREIGN KEY([idMesa])
REFERENCES [dbo].[Mesas] ([idMesa])
GO
ALTER TABLE [dbo].[pedidoMesa] CHECK CONSTRAINT [FK_idMesa]
GO
ALTER TABLE [dbo].[Platos]  WITH CHECK ADD  CONSTRAINT [FK_tipoPlato] FOREIGN KEY([tipoPlato])
REFERENCES [dbo].[TipoPlatos] ([idTipoPlato])
GO
ALTER TABLE [dbo].[Platos] CHECK CONSTRAINT [FK_tipoPlato]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_categoriaProducto] FOREIGN KEY([categoriaProducto])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_categoriaProducto]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [FK_categoriaProveedor] FOREIGN KEY([categoriaProveedor])
REFERENCES [dbo].[CategoriasProveedor] ([idCategoriaProveedor])
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [FK_categoriaProveedor]
GO
ALTER TABLE [dbo].[SubPedidos]  WITH CHECK ADD  CONSTRAINT [FK_idProducto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[SubPedidos] CHECK CONSTRAINT [FK_idProducto]
GO
ALTER TABLE [dbo].[SubPedidos]  WITH CHECK ADD  CONSTRAINT [FK_pedido] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedidos] ([idPedido])
GO
ALTER TABLE [dbo].[SubPedidos] CHECK CONSTRAINT [FK_pedido]
GO
ALTER TABLE [dbo].[SubPedidos]  WITH CHECK ADD  CONSTRAINT [FK_proveedorSubPedido] FOREIGN KEY([proveedorSubPedido])
REFERENCES [dbo].[Proveedores] ([idProveedor])
GO
ALTER TABLE [dbo].[SubPedidos] CHECK CONSTRAINT [FK_proveedorSubPedido]
GO
USE [master]
GO
ALTER DATABASE [Proyecto] SET  READ_WRITE 
GO
