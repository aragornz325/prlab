/// Contiene el código de HTML para renderizar el mail que se le
/// va a enviar a los destinatarios para el comunidado de prensa.
String emailBaseHtml(String contenidoHtml) => '''
<div style="background: #fff; text-align: center;margin: 0">
      <div style="padding: 30px">
        <div>
          <img
            style="height: 125px"
            src="https://res.cloudinary.com/dovck0lft/image/upload/v1696961504/logo_jgourx.png"
      
          />
        </div>
      </div>

      <div style="height: auto; padding: 20px">
        <p>$contenidoHtml</p>

        <a
          style="
            color: #0094e7;
            text-align: center;
            font-size: 14px;
            font-style: normal;
            font-weight: 700;
            text-decoration-line: underline;
          "
          href="#"
          >LINK-BACKEND</a
        ><br /><br />
        <p
          style="
            color: #363636;
            text-align: center;
            font-family: Louis George Cafe;
            font-size: 13px;
            font-style: normal;
            font-weight: 400;
            letter-spacing: -0.165px;
          "
        >
          ¡Thank you for<br />
          trusting us!
        </p>
        <br />
        <p
          style="
            color: #377c6e;
            font-family: Louis George Cafe;
            font-size: 13px;
            font-style: normal;
            font-weight: 400;
            letter-spacing: -0.165px;
          "
        >
          -PR Hive Team-
        </p>
      </div>
<div style="height: 100%"></div>
      <div style="padding: 12px; background-color: #377c6e">
        <p
          style="
            color: #fff;
            text-align: center;
            font-family: Louis George Cafe;
            font-size: 16px;
            font-style: normal;
            font-weight: 700;
            letter-spacing: -0.165px;
          "
        >
          <br />To get in touch with us,<br />
          write this email address
          <a style="color: #fff" href="#">support@prlab.com</a>
        </p>
      </div>
    </div>
''';
