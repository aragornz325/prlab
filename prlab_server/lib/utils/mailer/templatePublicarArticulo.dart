String templatePublicarArticulo({
  required String titulo,
  required String contenido,
}) {
  return '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artículo de Noticias</title>
    <link rel="stylesheet" href="/css/styyles.css">
</head>
<body>
    <header>
        <img src="./logopr.png" alt="Logo de la Empresa">
    </header>
    <main>
        <article>
            <h1>$titulo</h1>
            <p>$contenido</p>
            <img src="imagen.jpg" alt="Imagen del Artículo">
        </article>
    </main>
</body>
<footer>
    © 2021 - Todos los derechos reservados
</footer>
</html>


''';
}
