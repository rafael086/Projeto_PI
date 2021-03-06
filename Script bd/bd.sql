/*    ==Parâmetros de Script==

    Versão do Servidor de Origem : SQL Server 2016 (13.0.1742)
    Edição do Mecanismo de Banco de Dados de Origem : Microsoft SQL Server Enterprise Edition
    Tipo do Mecanismo de Banco de Dados de Origem : SQL Server Autônomo

    Versão do Servidor de Destino : SQL Server 2017
    Edição de Mecanismo de Banco de Dados de Destino : Microsoft SQL Server Standard Edition
    Tipo de Mecanismo de Banco de Dados de Destino : SQL Server Autônomo
*/
USE [Projeto_PI]
GO
/****** Object:  Table [dbo].[Apoios]    Script Date: 28/10/2017 17:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apoios](
	[idProjeto] [int] NOT NULL,
	[idDoador] [int] NOT NULL,
	[valor] [money] NOT NULL,
 CONSTRAINT [PK__Apoios__F9899F4CD92B1489] PRIMARY KEY CLUSTERED 
(
	[idProjeto] ASC,
	[idDoador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 28/10/2017 17:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[comentario] [varchar](245) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idProjeto] [int] NOT NULL,
 CONSTRAINT [PK_Comentarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doadores]    Script Date: 28/10/2017 17:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doadores](
	[id] [int] NOT NULL,
	[cpf] [varchar](11) NOT NULL,
 CONSTRAINT [PK__Doadores__3213E83F7C409561] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [cpf_UNIQUE] UNIQUE NONCLUSTERED 
(
	[cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enderecos]    Script Date: 28/10/2017 17:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enderecos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cep] [varchar](8) NOT NULL,
	[numero] [varchar](10) NOT NULL,
	[bairro] [varchar](45) NOT NULL,
	[rua] [varchar](45) NOT NULL,
	[cidade] [varchar](45) NOT NULL,
	[estado] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Endereco] UNIQUE NONCLUSTERED 
(
	[cep] ASC,
	[numero] ASC,
	[bairro] ASC,
	[rua] ASC,
	[cidade] ASC,
	[estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imagens]    Script Date: 28/10/2017 17:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [nome_UNIQUE] UNIQUE NONCLUSTERED 
(
	[nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ongs]    Script Date: 28/10/2017 17:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ongs](
	[id] [int] NOT NULL,
	[razaoSocial] [varchar](45) NOT NULL,
	[cnpj] [varchar](14) NOT NULL,
	[telefone] [varchar](10) NOT NULL,
	[representante] [varchar](45) NULL,
	[cargo] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [cnpj_UNIQUE] UNIQUE NONCLUSTERED 
(
	[cnpj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [razaoSocial_UNIQUE] UNIQUE NONCLUSTERED 
(
	[razaoSocial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [telefone_UNIQUE] UNIQUE NONCLUSTERED 
(
	[telefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projetos]    Script Date: 28/10/2017 17:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projetos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](45) NOT NULL,
	[descricao] [varchar](max) NOT NULL,
	[banner] [int] NOT NULL,
	[meta] [varchar](45) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[tipo] [varchar](10) NOT NULL,
	[arrecadado] [money] NOT NULL,
	[finalizado] [bit] NOT NULL,
 CONSTRAINT [PK__Projetos__3213E83FC59F2F94] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [banner_UNIQUE] UNIQUE NONCLUSTERED 
(
	[banner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sobre]    Script Date: 28/10/2017 17:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sobre](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](45) NOT NULL,
	[texto] [varchar](max) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idImagem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 28/10/2017 17:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](45) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[senha] [varchar](45) NOT NULL,
	[idEndereco] [int] NOT NULL,
	[idImagem] [int] NOT NULL,
	[frase] [varchar](100) NULL,
 CONSTRAINT [PK__Usuarios__3213E83F3538B1CC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [email_UNIQUE] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voluntarios]    Script Date: 28/10/2017 17:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voluntarios](
	[idOng] [int] NOT NULL,
	[idDoador] [int] NOT NULL,
	[situacao] [varchar](15) NOT NULL,
 CONSTRAINT [PK__Voluntar__EF41F784677D93D1] PRIMARY KEY CLUSTERED 
(
	[idOng] ASC,
	[idDoador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Apoios] ADD  CONSTRAINT [DF_Apoios_valor]  DEFAULT ((0)) FOR [valor]
GO
ALTER TABLE [dbo].[Ongs] ADD  DEFAULT (NULL) FOR [representante]
GO
ALTER TABLE [dbo].[Ongs] ADD  DEFAULT (NULL) FOR [cargo]
GO
ALTER TABLE [dbo].[Projetos] ADD  CONSTRAINT [DF_Projetos_arrecadado]  DEFAULT ((0)) FOR [arrecadado]
GO
ALTER TABLE [dbo].[Projetos] ADD  CONSTRAINT [DF_Projetos_finalizado]  DEFAULT ((0)) FOR [finalizado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_idImagem]  DEFAULT ((3010)) FOR [idImagem]
GO
ALTER TABLE [dbo].[Voluntarios] ADD  CONSTRAINT [DF_Voluntarios_situacao]  DEFAULT ('Em aguardo') FOR [situacao]
GO
ALTER TABLE [dbo].[Apoios]  WITH CHECK ADD  CONSTRAINT [idDoador_Apoios_id_Doadores] FOREIGN KEY([idDoador])
REFERENCES [dbo].[Doadores] ([id])
GO
ALTER TABLE [dbo].[Apoios] CHECK CONSTRAINT [idDoador_Apoios_id_Doadores]
GO
ALTER TABLE [dbo].[Apoios]  WITH CHECK ADD  CONSTRAINT [idProjeto_Apoios_id_Projeto] FOREIGN KEY([idProjeto])
REFERENCES [dbo].[Projetos] ([id])
GO
ALTER TABLE [dbo].[Apoios] CHECK CONSTRAINT [idProjeto_Apoios_id_Projeto]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [idProjeto_Comentarios_id_Projeto] FOREIGN KEY([idProjeto])
REFERENCES [dbo].[Projetos] ([id])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [idProjeto_Comentarios_id_Projeto]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [idUsuario_Comentarios_id_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [idUsuario_Comentarios_id_Usuario]
GO
ALTER TABLE [dbo].[Doadores]  WITH CHECK ADD  CONSTRAINT [Id_Doadores_IdUsuarios] FOREIGN KEY([id])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Doadores] CHECK CONSTRAINT [Id_Doadores_IdUsuarios]
GO
ALTER TABLE [dbo].[Ongs]  WITH CHECK ADD  CONSTRAINT [Id_Ongs_Id_Usuarios] FOREIGN KEY([id])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Ongs] CHECK CONSTRAINT [Id_Ongs_Id_Usuarios]
GO
ALTER TABLE [dbo].[Projetos]  WITH CHECK ADD  CONSTRAINT [banner_Projetos_id_Imagens] FOREIGN KEY([banner])
REFERENCES [dbo].[Imagens] ([id])
GO
ALTER TABLE [dbo].[Projetos] CHECK CONSTRAINT [banner_Projetos_id_Imagens]
GO
ALTER TABLE [dbo].[Projetos]  WITH CHECK ADD  CONSTRAINT [idUsuario_Projetos_id_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Projetos] CHECK CONSTRAINT [idUsuario_Projetos_id_Usuarios]
GO
ALTER TABLE [dbo].[Sobre]  WITH CHECK ADD  CONSTRAINT [idImagem_Sobre_id_Imagens] FOREIGN KEY([idImagem])
REFERENCES [dbo].[Imagens] ([id])
GO
ALTER TABLE [dbo].[Sobre] CHECK CONSTRAINT [idImagem_Sobre_id_Imagens]
GO
ALTER TABLE [dbo].[Sobre]  WITH CHECK ADD  CONSTRAINT [idUsuario_Sobre_id_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Sobre] CHECK CONSTRAINT [idUsuario_Sobre_id_Usuario]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [idEndereco_Usuarios_id_Enderecos] FOREIGN KEY([idEndereco])
REFERENCES [dbo].[Enderecos] ([id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [idEndereco_Usuarios_id_Enderecos]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [idImagem_Usuarios_id_Imagens] FOREIGN KEY([idImagem])
REFERENCES [dbo].[Imagens] ([id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [idImagem_Usuarios_id_Imagens]
GO
ALTER TABLE [dbo].[Voluntarios]  WITH CHECK ADD  CONSTRAINT [idDoador_Voluntarios_id_Doador] FOREIGN KEY([idDoador])
REFERENCES [dbo].[Doadores] ([id])
GO
ALTER TABLE [dbo].[Voluntarios] CHECK CONSTRAINT [idDoador_Voluntarios_id_Doador]
GO
ALTER TABLE [dbo].[Voluntarios]  WITH CHECK ADD  CONSTRAINT [idOng_Voluntarios_id_Ong] FOREIGN KEY([idOng])
REFERENCES [dbo].[Ongs] ([id])
GO
ALTER TABLE [dbo].[Voluntarios] CHECK CONSTRAINT [idOng_Voluntarios_id_Ong]
GO
/****** Object:  StoredProcedure [dbo].[setDoadores]    Script Date: 28/10/2017 17:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[setDoadores] (@nome varchar(45), @email varchar(100), @senha varchar(45), @cpf varchar(9),@cep varchar(8), @numero varchar(10), @bairro varchar(45), @rua varchar(45), @cidade varchar(45), @estado varchar(45))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	begin transaction
		begin try
			declare @idEndereco int
			declare @idUsuario int;
			exec setEnderecos @idEndereco output, @cep, @numero, @bairro, @rua, @cidade, @estado;
			exec setUsuario @nome,@email,@senha,@idEndereco,@idUsuario output;
			insert into Doadores values(@idUsuario,@cpf);
			commit;
		end try
		begin catch
			declare @error int, @message varchar(4000), @xstate int;
			select @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
			rollback;
			raiserror ('setDoadores: %d: %s', 16, 1, @error, @message) ;
		end catch;
END
GO
/****** Object:  StoredProcedure [dbo].[setEnderecos]    Script Date: 28/10/2017 17:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[setEnderecos](@id int output,@cep varchar(8), @numero varchar(10), @bairro varchar(45),
	@rua varchar(45), @cidade varchar(45), @estado varchar(45))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @tot int;
	select @tot = COUNT(*) from Enderecos where cep = @cep and numero = @numero and bairro = @bairro
	 and rua = @rua and cidade = @cidade and estado = @estado;
	if @tot = 0
	begin
		insert into Enderecos(cep,numero,bairro,rua,cidade,estado) values (@cep,@numero,@bairro,@rua,@cidade,@estado);
		select @id = id from Enderecos where cep = @cep and numero = @numero and bairro = @bairro and rua = @rua and cidade = @cidade and estado = @estado;
	end
	else
	begin
		select @id = id from Enderecos where cep = @cep and numero = @numero and bairro = @bairro and rua = @rua and cidade = @cidade and estado = @estado;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[setOngs]    Script Date: 28/10/2017 17:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[setOngs] (@nome varchar(45), @email varchar(100), @senha varchar(45),
	@razaoSocial varchar(45), @cnpj varchar(14), @telefone varchar(10), @representante varchar(45),
	@cargo varchar(45), @cep varchar(8), @numero varchar(10), @bairro varchar(45), @rua varchar(45),
	@cidade varchar(45), @estado varchar(45))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	begin transaction
		begin try
			declare @idEndereco int;
			declare @idUsuario int;
			exec setEnderecos @idEndereco output, @cep, @numero, @bairro, @rua, @cidade, @estado;
			exec setUsuario @nome,@email,@senha,@idEndereco,@idUsuario output;
			insert into Ongs values(@idUsuario,@razaoSocial, @cnpj, @telefone,
				@representante,@cargo);
			commit;
		end try
		begin catch
			declare @error int, @message varchar(4000), @xstate int;
			select @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
			rollback;
			raiserror ('setOngs: %d: %s', 16, 1, @error, @message) ;
		end catch
END
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
GO
/****** Object:  StoredProcedure [dbo].[setUsuario]    Script Date: 28/10/2017 17:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[setUsuario](@nome varchar(45), @email varchar(100), @senha varchar(45), 
	@idEndereco int,@idUsuario int output)
as
begin
set nocount on; 
  insert into Usuarios(nome, email, senha,idEndereco) values(@nome, @email, @senha,@idEndereco);
  select @idUsuario = id from Usuarios where email = @email;
end;
GO
