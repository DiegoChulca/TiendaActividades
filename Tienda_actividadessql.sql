USE [master]
GO
/****** Object:  Database [Tienda_Actividades]    Script Date: 13/04/2022 18:53:28 ******/
CREATE DATABASE [Tienda_Actividades]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tienda_Actividades', FILENAME = N'/var/opt/mssql/data/Tienda_Actividades.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tienda_Actividades_log', FILENAME = N'/var/opt/mssql/data/Tienda_Actividades_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Tienda_Actividades] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tienda_Actividades].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tienda_Actividades] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tienda_Actividades] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tienda_Actividades] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tienda_Actividades] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tienda_Actividades] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tienda_Actividades] SET  MULTI_USER 
GO
ALTER DATABASE [Tienda_Actividades] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tienda_Actividades] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tienda_Actividades] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tienda_Actividades] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tienda_Actividades] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tienda_Actividades] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tienda_Actividades', N'ON'
GO
ALTER DATABASE [Tienda_Actividades] SET QUERY_STORE = OFF
GO
USE [Tienda_Actividades]
GO
/****** Object:  Table [dbo].[Actividades]    Script Date: 13/04/2022 18:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividades](
	[idActividad] [int] NOT NULL,
	[descripcionActividad] [nchar](45) NULL,
	[horarioActividad] [time](7) NULL,
	[idAgenciaFK] [int] NULL,
 CONSTRAINT [PK_Actividades] PRIMARY KEY CLUSTERED 
(
	[idActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Administradores]    Script Date: 13/04/2022 18:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administradores](
	[idAdministrativo] [int] IDENTITY(1,1) NOT NULL,
	[nivelOfficeAdministrativo] [nchar](45) NULL,
	[atencionCliente] [nchar](45) NULL,
	[idEmpleadoFK] [int] NULL,
 CONSTRAINT [PK_Administradores] PRIMARY KEY CLUSTERED 
(
	[idAdministrativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agencia]    Script Date: 13/04/2022 18:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agencia](
	[idAgencia] [int] IDENTITY(1,1) NOT NULL,
	[direccionAgencia] [nchar](100) NULL,
	[telefonoAgencia] [nchar](9) NULL,
	[correoElectronicoAgencia] [nchar](100) NULL,
 CONSTRAINT [PK_Agencia] PRIMARY KEY CLUSTERED 
(
	[idAgencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 13/04/2022 18:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombreCliente] [nchar](45) NULL,
	[primerApellidoCliente] [nchar](45) NULL,
	[segundoApellidoCliente] [nchar](45) NULL,
	[dniCliente] [nchar](9) NULL,
	[direccionCliente] [nchar](100) NULL,
	[telefonoCliente] [nchar](9) NULL,
	[correoCliente] [nchar](100) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 13/04/2022 18:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombreEmpleado] [nchar](45) NULL,
	[primerApellidoEmpleado] [nchar](45) NULL,
	[segundoApellidoEmpleado] [nchar](45) NULL,
	[telefonoEmpleado] [nchar](9) NULL,
	[idAgenciaFK] [int] NULL,
	[idJefeFK] [int] NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Monitores]    Script Date: 13/04/2022 18:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monitores](
	[idMonitor] [int] IDENTITY(1,1) NOT NULL,
	[tituloEspecializado] [nchar](45) NULL,
	[idEmpleadoFK] [int] NULL,
 CONSTRAINT [PK_Monitores] PRIMARY KEY CLUSTERED 
(
	[idMonitor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservas]    Script Date: 13/04/2022 18:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservas](
	[idReserva] [int] IDENTITY(1,1) NOT NULL,
	[fechaReserva] [nchar](45) NULL,
	[idActividadFK] [int] NULL,
	[idClienteFK] [int] NULL,
 CONSTRAINT [PK_Reservas] PRIMARY KEY CLUSTERED 
(
	[idReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Actividades] ([idActividad], [descripcionActividad], [horarioActividad], [idAgenciaFK]) VALUES (1, N'senderismo                                   ', CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[Actividades] ([idActividad], [descripcionActividad], [horarioActividad], [idAgenciaFK]) VALUES (2, N'barranquismo                                 ', CAST(N'12:00:00' AS Time), 1)
GO
SET IDENTITY_INSERT [dbo].[Administradores] ON 

INSERT [dbo].[Administradores] ([idAdministrativo], [nivelOfficeAdministrativo], [atencionCliente], [idEmpleadoFK]) VALUES (1, N'principiante                                 ', N'asesoria online                              ', 1)
INSERT [dbo].[Administradores] ([idAdministrativo], [nivelOfficeAdministrativo], [atencionCliente], [idEmpleadoFK]) VALUES (2, N'basico                                       ', N'asesoria telefonica                          ', 2)
SET IDENTITY_INSERT [dbo].[Administradores] OFF
GO
SET IDENTITY_INSERT [dbo].[Agencia] ON 

INSERT [dbo].[Agencia] ([idAgencia], [direccionAgencia], [telefonoAgencia], [correoElectronicoAgencia]) VALUES (1, N'Calle_Carmelo_17                                                                                    ', N'687659345', N'agenciat@gmail.com                                                                                  ')
SET IDENTITY_INSERT [dbo].[Agencia] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([idCliente], [nombreCliente], [primerApellidoCliente], [segundoApellidoCliente], [dniCliente], [direccionCliente], [telefonoCliente], [correoCliente]) VALUES (1, N'Juan                                         ', N'Torres                                       ', N'Galvan                                       ', N'73164701E', N'Calle_moras_1                                                                                       ', N'667282483', N'jtg@gmail.es                                                                                        ')
INSERT [dbo].[Clientes] ([idCliente], [nombreCliente], [primerApellidoCliente], [segundoApellidoCliente], [dniCliente], [direccionCliente], [telefonoCliente], [correoCliente]) VALUES (2, N'Oscar                                        ', N'Rico                                         ', N'Tello                                        ', N'75647651A', N'Calle_Pardo_7                                                                                       ', N'676892233', N'ort@gmail.com                                                                                       ')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([idEmpleado], [nombreEmpleado], [primerApellidoEmpleado], [segundoApellidoEmpleado], [telefonoEmpleado], [idAgenciaFK], [idJefeFK]) VALUES (1, N'Alejandro                                    ', N'Pasamon                                      ', N'Bernal                                       ', N'672597123', 1, 1)
INSERT [dbo].[Empleados] ([idEmpleado], [nombreEmpleado], [primerApellidoEmpleado], [segundoApellidoEmpleado], [telefonoEmpleado], [idAgenciaFK], [idJefeFK]) VALUES (2, N'Jose                                         ', N'Santamaria                                   ', N'Ferreiro                                     ', N'623455691', 1, 1)
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Monitores] ON 

INSERT [dbo].[Monitores] ([idMonitor], [tituloEspecializado], [idEmpleadoFK]) VALUES (1, N'monitor de senderismo                        ', 2)
INSERT [dbo].[Monitores] ([idMonitor], [tituloEspecializado], [idEmpleadoFK]) VALUES (2, N'monitor de barranquismo                      ', 1)
SET IDENTITY_INSERT [dbo].[Monitores] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservas] ON 

INSERT [dbo].[Reservas] ([idReserva], [fechaReserva], [idActividadFK], [idClienteFK]) VALUES (1, N'2022/03/22                                   ', 1, 1)
INSERT [dbo].[Reservas] ([idReserva], [fechaReserva], [idActividadFK], [idClienteFK]) VALUES (2, N'2022/03/22                                   ', 2, 2)
SET IDENTITY_INSERT [dbo].[Reservas] OFF
GO
ALTER TABLE [dbo].[Actividades]  WITH CHECK ADD  CONSTRAINT [FK_Agencia_Actividades] FOREIGN KEY([idAgenciaFK])
REFERENCES [dbo].[Agencia] ([idAgencia])
GO
ALTER TABLE [dbo].[Actividades] CHECK CONSTRAINT [FK_Agencia_Actividades]
GO
ALTER TABLE [dbo].[Administradores]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Administradores] FOREIGN KEY([idEmpleadoFK])
REFERENCES [dbo].[Empleados] ([idEmpleado])
GO
ALTER TABLE [dbo].[Administradores] CHECK CONSTRAINT [FK_Empleados_Administradores]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Agencia_Empleados] FOREIGN KEY([idAgenciaFK])
REFERENCES [dbo].[Agencia] ([idAgencia])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Agencia_Empleados]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Jefe_Empleados] FOREIGN KEY([idJefeFK])
REFERENCES [dbo].[Empleados] ([idEmpleado])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Jefe_Empleados]
GO
ALTER TABLE [dbo].[Monitores]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Monitores] FOREIGN KEY([idEmpleadoFK])
REFERENCES [dbo].[Empleados] ([idEmpleado])
GO
ALTER TABLE [dbo].[Monitores] CHECK CONSTRAINT [FK_Empleados_Monitores]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Actividades_Reservas] FOREIGN KEY([idActividadFK])
REFERENCES [dbo].[Actividades] ([idActividad])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Actividades_Reservas]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Reservas] FOREIGN KEY([idClienteFK])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Clientes_Reservas]
GO
USE [master]
GO
ALTER DATABASE [Tienda_Actividades] SET  READ_WRITE 
GO
