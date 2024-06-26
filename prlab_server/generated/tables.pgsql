--
-- Class Comentario as table comentarios
--

CREATE TABLE "comentarios" (
  "id" serial,
  "idEntregable" integer NOT NULL,
  "textoComentario" text NOT NULL,
  "idAutor" integer NOT NULL,
  "completado" boolean NOT NULL,
  "idAutorCompletado" integer NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL,
  "ultimaModificacion" timestamp without time zone,
  "compania" text,
  "fechaEliminacion" timestamp without time zone,
  "fechaCompletado" timestamp without time zone
);

ALTER TABLE ONLY "comentarios"
  ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);


--
-- Class Entregable as table entregables
--

CREATE TABLE "entregables" (
  "id" serial,
  "nombre" text NOT NULL,
  "idAutor" integer,
  "fechaInicio" timestamp without time zone NOT NULL,
  "fechaFin" timestamp without time zone NOT NULL,
  "ultimaModificacion" timestamp without time zone NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "entregables"
  ADD CONSTRAINT entregables_pkey PRIMARY KEY (id);


--
-- Class InformacionDeContacto as table informacion_de_contactos
--

CREATE TABLE "informacion_de_contactos" (
  "id" serial,
  "idUsuario" integer,
  "emailPrincipal" text,
  "emailSecundario" text,
  "telefonoPrincipal" text,
  "telefonoSecundario" text,
  "domicilioCalle" text,
  "domicilioNumero" text,
  "domicilioCiudad" text,
  "domicilioCodigoPostal" text,
  "domicilioEstadoProvincia" text,
  "domicilioPais" text,
  "fechaEliminacion" timestamp without time zone,
  "ultimaModificacion" timestamp without time zone NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "informacion_de_contactos"
  ADD CONSTRAINT informacion_de_contactos_pkey PRIMARY KEY (id);


--
-- Class Marca as table marcas
--

CREATE TABLE "marcas" (
  "id" serial,
  "nombre" text NOT NULL,
  "sitioWeb" text NOT NULL,
  "ultimaModificacion" timestamp without time zone,
  "fechaCreacion" timestamp without time zone,
  "fechaEliminacion" timestamp without time zone
);

ALTER TABLE ONLY "marcas"
  ADD CONSTRAINT marcas_pkey PRIMARY KEY (id);


--
-- Class MarcaStaff as table marcas_staff
--

CREATE TABLE "marcas_staff" (
  "id" serial,
  "idMarca" integer NOT NULL,
  "idStaff" integer NOT NULL,
  "idRol" integer NOT NULL,
  "ultimaModificacion" timestamp without time zone NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL,
  "fechaEliminacion" timestamp without time zone
);

ALTER TABLE ONLY "marcas_staff"
  ADD CONSTRAINT marcas_staff_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "marcas_staff"
  ADD CONSTRAINT marcas_staff_fk_0
    FOREIGN KEY("idMarca")
      REFERENCES marcas(id)
        ON DELETE CASCADE;

--
-- Class MensajeRegistro as table mensaje_registro
--

CREATE TABLE "mensaje_registro" (
  "id" serial,
  "mensaje" text NOT NULL,
  "host" text NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "mensaje_registro"
  ADD CONSTRAINT mensaje_registro_pkey PRIMARY KEY (id);


--
-- Class Organizacion as table organizaciones
--

CREATE TABLE "organizaciones" (
  "id" serial,
  "nombre" text NOT NULL,
  "tipo" integer,
  "contacto" integer,
  "fechaEliminacion" timestamp without time zone,
  "ultimaModificacion" timestamp without time zone NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "organizaciones"
  ADD CONSTRAINT organizaciones_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "organizaciones"
  ADD CONSTRAINT organizaciones_fk_0
    FOREIGN KEY("contacto")
      REFERENCES informacion_de_contactos(id)
        ON DELETE CASCADE;

--
-- Class Cliente as table clientes
--

CREATE TABLE "clientes" (
  "id" serial,
  "nombre" text NOT NULL,
  "apellido" text NOT NULL,
  "fechaDeNacimiento" timestamp without time zone NOT NULL,
  "nombreDeOrganizacion" text NOT NULL,
  "domicilio" text,
  "telefono" text,
  "idUsuario" integer,
  "idOrganizacion" integer,
  "contacto" integer,
  "fechaCreacion" timestamp without time zone,
  "ultimaModificacion" timestamp without time zone,
  "activo" boolean
);

ALTER TABLE ONLY "clientes"
  ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "clientes"
  ADD CONSTRAINT clientes_fk_0
    FOREIGN KEY("idOrganizacion")
      REFERENCES organizaciones(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "clientes"
  ADD CONSTRAINT clientes_fk_1
    FOREIGN KEY("contacto")
      REFERENCES informacion_de_contactos(id)
        ON DELETE CASCADE;

--
-- Class Pais as table paises
--

CREATE TABLE "paises" (
  "id" serial,
  "nombre" text NOT NULL
);

ALTER TABLE ONLY "paises"
  ADD CONSTRAINT paises_pkey PRIMARY KEY (id);


--
-- Class Periodista as table periodistas
--

CREATE TABLE "periodistas" (
  "id" serial,
  "urlImagen" text NOT NULL,
  "nombres" text NOT NULL,
  "apellidos" text NOT NULL,
  "idPuesto" integer,
  "idMedio" integer,
  "biografia" text NOT NULL,
  "email" text NOT NULL,
  "telefono" text NOT NULL,
  "idCiudad" integer,
  "idPais" integer,
  "ultimaModificacion" timestamp without time zone,
  "activo" boolean,
  "fechaCreacion" timestamp without time zone
);

ALTER TABLE ONLY "periodistas"
  ADD CONSTRAINT periodistas_pkey PRIMARY KEY (id);


--
-- Class Proyecto as table proyectos
--

CREATE TABLE "proyectos" (
  "id" serial,
  "nombre" text NOT NULL,
  "descripcion" text NOT NULL,
  "idOrganizacion" integer,
  "fechaInicio" timestamp without time zone NOT NULL,
  "fechaFin" timestamp without time zone NOT NULL,
  "fechaEliminacion" timestamp without time zone,
  "ultimaModificacion" timestamp without time zone NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "proyectos"
  ADD CONSTRAINT proyectos_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "proyectos"
  ADD CONSTRAINT proyectos_fk_0
    FOREIGN KEY("idOrganizacion")
      REFERENCES organizaciones(id)
        ON DELETE CASCADE;

--
-- Class EntregableArticulo as table articulos
--

CREATE TABLE "articulos" (
  "id" serial,
  "titulo" text NOT NULL,
  "contenido" text NOT NULL,
  "contenidoHtml" text NOT NULL,
  "idAutor" integer NOT NULL,
  "idStatus" integer NOT NULL,
  "ultimaModificacion" timestamp without time zone NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL,
  "activo" boolean NOT NULL,
  "slug" text,
  "idMarca" integer,
  "fechaEliminacion" timestamp without time zone,
  "fechaLanzamiento" timestamp without time zone,
  "fechaPublicacion" timestamp without time zone,
  "idPlataforma" integer,
  "idProyecto" integer
);

ALTER TABLE ONLY "articulos"
  ADD CONSTRAINT articulos_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "articulos"
  ADD CONSTRAINT articulos_fk_0
    FOREIGN KEY("idMarca")
      REFERENCES marcas(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "articulos"
  ADD CONSTRAINT articulos_fk_1
    FOREIGN KEY("idProyecto")
      REFERENCES proyectos(id)
        ON DELETE CASCADE;

--
-- Class ImagenArticulo as table imagen_articulo
--

CREATE TABLE "imagen_articulo" (
  "id" serial,
  "url" text NOT NULL,
  "nombreImagen" text NOT NULL,
  "publicId" text NOT NULL,
  "idArticulo" integer,
  "fechaEliminacion" timestamp without time zone,
  "ultimaModificacion" timestamp without time zone NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "imagen_articulo"
  ADD CONSTRAINT imagen_articulo_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "imagen_articulo"
  ADD CONSTRAINT imagen_articulo_fk_0
    FOREIGN KEY("idArticulo")
      REFERENCES articulos(id)
        ON DELETE CASCADE;

--
-- Class Publicacion as table publicaciones
--

CREATE TABLE "publicaciones" (
  "id" serial,
  "titulo" text NOT NULL,
  "idProyecto" integer,
  "idAutor" integer,
  "idStatus" integer,
  "fechaEliminacion" timestamp without time zone,
  "ultimaModificacion" timestamp without time zone NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "publicaciones"
  ADD CONSTRAINT publicaciones_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "publicaciones"
  ADD CONSTRAINT publicaciones_fk_0
    FOREIGN KEY("idProyecto")
      REFERENCES proyectos(id)
        ON DELETE CASCADE;

--
-- Class RedSocial as table redes_sociales_periodistas
--

CREATE TABLE "redes_sociales_periodistas" (
  "id" serial,
  "idRedSocial" integer,
  "idUsuario" integer,
  "nombreDeUsuario" text NOT NULL,
  "urlPerfil" text NOT NULL,
  "ultimaModificacion" timestamp without time zone,
  "activo" boolean,
  "fechaCreacion" timestamp without time zone
);

ALTER TABLE ONLY "redes_sociales_periodistas"
  ADD CONSTRAINT redes_sociales_periodistas_pkey PRIMARY KEY (id);


--
-- Class StatusEntregable as table status_entregables
--

CREATE TABLE "status_entregables" (
  "id" serial,
  "nombre" text NOT NULL,
  "activo" boolean,
  "fechaCreacion" timestamp without time zone,
  "ultimaModificacion" timestamp without time zone
);

ALTER TABLE ONLY "status_entregables"
  ADD CONSTRAINT status_entregables_pkey PRIMARY KEY (id);


