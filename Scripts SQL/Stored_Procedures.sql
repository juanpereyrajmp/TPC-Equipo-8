USE TPC

GO

-- PROCEDURE QUE DEVUELVE LISTADO DE FILIALES

CREATE OR ALTER PROCEDURE SP_ListarFiliales 
AS

	SELECT U.IdUsuario, F.*, DU.Calle, DU.Altura, DU.Piso, DU.Departamento, L.Nombre AS Localidad, L.CodigoPostal, C.Nombre AS Ciudad, P.Nombre AS Provincia, U.Estado 
	FROM Filiales F
	INNER JOIN Usuarios U ON U.IdUsuario = F.IdUsuario
	INNER JOIN Direcciones_x_Usuario DU ON DU.IdUsuario = U.IdUsuario
	INNER JOIN Localidades L ON L.IdLocalidad = DU.IdLocalidad
	INNER JOIN Ciudades C ON C.IdCiudad = L.IdCiudad
	INNER JOIN Provincias P ON P.IdProvincia = C.IdProvincia

GO

-- PROCEDURE QUE RECIBE UNA FILIAL Y DEVUELVE SU DIRECCION PARA SU CONCATENACION Y BUSQUEDA EN EL MAPA

CREATE OR ALTER PROCEDURE SP_DireccionesCompletas 
	@IdFilial INT
AS
	SELECT DU.Calle, DU.Altura, P.Nombre
	FROM Direcciones_x_Usuario DU
	INNER JOIN Localidades L ON L.IdLocalidad = DU.IdLocalidad
	INNER JOIN Ciudades C ON C.IdCiudad = L.IdCiudad
	INNER JOIN Provincias P ON P.IdProvincia = C.IdProvincia
	INNER JOIN Filiales F ON F.IdUsuario = DU.IdUsuario
	WHERE F.IdFilial = @IdFilial

GO

-- FUNCION QUE RECIBE UN GRUPO SANGUINEO Y DEVUELVE UN STRING DE POSIBLES GRUPOS DONANTES

CREATE OR ALTER FUNCTION FN_PosiblesDonantes
	(@IdGrupoSanguineo INT)
RETURNS NVARCHAR(50)
AS
BEGIN

	DECLARE @Resultado NVARCHAR(50)

	SELECT @Resultado = STRING_AGG(GS.Grupo, ', ')
	FROM GruposSanguineos GS
	INNER JOIN DonacionesPosibles DP ON DP.IdGrupoDonante = GS.IdGrupoSanguineo
	WHERE DP.IdGrupoReceptor = @IdGrupoSanguineo 

	RETURN @Resultado
END

GO

-- PROCEDURE QUE RECIBE UNA FILIAL Y DEVUELVE LISTADO DE SUS PUBLICACIONES
-- SI RECIBE EL VALOR -1 DEVUELVE TODAS LAS PUBLICACIONES

CREATE OR ALTER PROCEDURE SP_ListarPublicaciones 
	@IdFilial INT
AS
BEGIN
	IF @IdFilial = -1
	BEGIN
		SELECT P.*, GP.Grupo, dbo.FN_PosiblesDonantes(P.IdGrupoSanguineo) AS PosiblesDonantes, F.Nombre AS NombreFilial, U.Descripcion as DescripcionUrgencia
		FROM Publicaciones P
		INNER JOIN GruposSanguineos GP ON GP.IdGrupoSanguineo = P.IdGrupoSanguineo
		INNER JOIN Filiales F ON F.IdFilial = P.IdFilial
		INNER JOIN Urgencias U ON U.IdUrgencia = P.IdUrgencia
	END
	ELSE
	BEGIN
		SELECT P.*, GP.Grupo, dbo.FN_PosiblesDonantes(P.IdGrupoSanguineo) AS PosiblesDonantes, F.Nombre AS NombreFilial, U.Descripcion AS DescripcionUrgencia
		FROM Publicaciones P
		INNER JOIN GruposSanguineos GP ON GP.IdGrupoSanguineo = P.IdGrupoSanguineo
		INNER JOIN Filiales F ON F.IdFilial = P.IdFilial
		INNER JOIN Urgencias U ON U.IdUrgencia = P.IdUrgencia
		WHERE P.IdFilial = @IdFilial
	END
END

GO

