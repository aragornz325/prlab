--
-- Class Comentario as table comentarios
--

CREATE TABLE "comentarios" (
  "id" serial,
  "idEntregable" integer,
  "textoComentario" text NOT NULL,
  "idAutor" integer,
  "ultimaModificacion" timestamp without time zone NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL
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
-- Class EstadoDeArticulo as table estados_de_articulos
--

CREATE TABLE "estados_de_articulos" (
  "id" serial,
  "estado" text NOT NULL,
  "ultimaModificacion" timestamp without time zone NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "estados_de_articulos"
  ADD CONSTRAINT estados_de_articulos_pkey PRIMARY KEY (id);


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
  "ultimaModificacion" timestamp without time zone,
  "fechaCreacion" timestamp without time zone
);

ALTER TABLE ONLY "informacion_de_contactos"
  ADD CONSTRAINT informacion_de_contactos_pkey PRIMARY KEY (id);


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
-- Class TipoDeOrganizacion as table tipos_de_organizacion
--

CREATE TABLE "tipos_de_organizacion" (
  "id" serial,
  "tipo" text NOT NULL,
  "ultimaModificacion" timestamp without time zone NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "tipos_de_organizacion"
  ADD CONSTRAINT tipos_de_organizacion_pkey PRIMARY KEY (id);


--
-- Class Organizacion as table organizaciones
--

CREATE TABLE "organizaciones" (
  "id" serial,
  "nombre" text NOT NULL,
  "tipo" integer,
  "contacto" integer,
  "ultimaModificacion" timestamp without time zone NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "organizaciones"
  ADD CONSTRAINT organizaciones_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "organizaciones"
  ADD CONSTRAINT organizaciones_fk_0
    FOREIGN KEY("tipo")
      REFERENCES tipos_de_organizacion(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "organizaciones"
  ADD CONSTRAINT organizaciones_fk_1
    FOREIGN KEY("contacto")
      REFERENCES informacion_de_contactos(id)
        ON DELETE CASCADE;

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
-- Class Publicacion as table publicaciones
--

CREATE TABLE "publicaciones" (
  "id" serial,
  "titulo" text NOT NULL,
  "idProyecto" integer,
  "idAutor" integer,
  "idStatus" integer,
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
ALTER TABLE ONLY "publicaciones"
  ADD CONSTRAINT publicaciones_fk_1
    FOREIGN KEY("idStatus")
      REFERENCES estados_de_articulos(id)
        ON DELETE CASCADE;

--
-- Class Articulo as table articulos
--

CREATE TABLE "articulos" (
  "id" serial,
  "titulo" text NOT NULL,
  "idProyecto" integer,
  "idAutor" integer,
  "idStatus" integer,
  "ultimaModificacion" timestamp without time zone NOT NULL,
  "fechaCreacion" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "articulos"
  ADD CONSTRAINT articulos_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "articulos"
  ADD CONSTRAINT articulos_fk_0
    FOREIGN KEY("idProyecto")
      REFERENCES proyectos(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "articulos"
  ADD CONSTRAINT articulos_fk_1
    FOREIGN KEY("idStatus")
      REFERENCES estados_de_articulos(id)
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
  "ultimaModificacion" timestamp without time zone,
  "fechaCreacion" timestamp without time zone
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

