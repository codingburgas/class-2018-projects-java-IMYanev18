USE [master]
GO
/****** Object:  Database [JavaProject]    Script Date: 24.3.2022 г. 21:00:26 ******/
CREATE DATABASE [JavaProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JavaProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\JavaProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JavaProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\JavaProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JavaProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JavaProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JavaProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JavaProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JavaProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JavaProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [JavaProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JavaProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JavaProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JavaProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JavaProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JavaProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JavaProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JavaProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JavaProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JavaProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JavaProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JavaProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JavaProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JavaProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JavaProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JavaProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JavaProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JavaProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JavaProject] SET  MULTI_USER 
GO
ALTER DATABASE [JavaProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JavaProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JavaProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JavaProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JavaProject] SET DELAYED_DURABILITY = DISABLED 
GO
USE [JavaProject]
GO
/****** Object:  Table [dbo].[actors]    Script Date: 24.3.2022 г. 21:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actors](
	[ActorId] [int] IDENTITY(1,1) NOT NULL,
	[ActorName] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actorsmovies]    Script Date: 24.3.2022 г. 21:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actorsmovies](
	[ActorId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favourites]    Script Date: 24.3.2022 г. 21:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favourites](
	[MovieId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genres]    Script Date: 24.3.2022 г. 21:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genres](
	[GenreId] [int] NOT NULL,
	[Genre] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genresmovies]    Script Date: 24.3.2022 г. 21:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genresmovies](
	[GenreId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movies]    Script Date: 24.3.2022 г. 21:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movies](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [varchar](100) NOT NULL,
	[MovieOrSeries] [varchar](45) NOT NULL,
	[YearOfPublishing] [tinyint] NOT NULL,
	[Description] [varchar](1000) NULL,
	[Company] [varchar](45) NOT NULL,
	[Duration] [tinyint] NOT NULL,
	[IMDB_Score] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 24.3.2022 г. 21:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](45) NOT NULL,
	[LastName] [varchar](45) NOT NULL,
	[Email] [varchar](45) NOT NULL,
	[Username] [varchar](45) NOT NULL,
	[Password] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[movies] ADD  DEFAULT (NULL) FOR [Description]
GO
ALTER TABLE [dbo].[actorsmovies]  WITH CHECK ADD  CONSTRAINT [FK_ActorsActorsMovies] FOREIGN KEY([ActorId])
REFERENCES [dbo].[actors] ([ActorId])
GO
ALTER TABLE [dbo].[actorsmovies] CHECK CONSTRAINT [FK_ActorsActorsMovies]
GO
ALTER TABLE [dbo].[actorsmovies]  WITH CHECK ADD  CONSTRAINT [FK_MoviesActorsMovies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[movies] ([MovieId])
GO
ALTER TABLE [dbo].[actorsmovies] CHECK CONSTRAINT [FK_MoviesActorsMovies]
GO
ALTER TABLE [dbo].[favourites]  WITH CHECK ADD  CONSTRAINT [FK_FavouritesMovies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[movies] ([MovieId])
GO
ALTER TABLE [dbo].[favourites] CHECK CONSTRAINT [FK_FavouritesMovies]
GO
ALTER TABLE [dbo].[favourites]  WITH CHECK ADD  CONSTRAINT [FK_FavouritesUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([UserId])
GO
ALTER TABLE [dbo].[favourites] CHECK CONSTRAINT [FK_FavouritesUsers]
GO
ALTER TABLE [dbo].[genresmovies]  WITH CHECK ADD  CONSTRAINT [FK_GenresGenresMovies] FOREIGN KEY([GenreId])
REFERENCES [dbo].[genres] ([GenreId])
GO
ALTER TABLE [dbo].[genresmovies] CHECK CONSTRAINT [FK_GenresGenresMovies]
GO
ALTER TABLE [dbo].[genresmovies]  WITH CHECK ADD  CONSTRAINT [FK_MoviesGenresMovies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[movies] ([MovieId])
GO
ALTER TABLE [dbo].[genresmovies] CHECK CONSTRAINT [FK_MoviesGenresMovies]
GO
USE [master]
GO
ALTER DATABASE [JavaProject] SET  READ_WRITE 
GO
