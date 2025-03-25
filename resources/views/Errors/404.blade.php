<!DOCTYPE html>
<html>
  <head>
    <title>404 - Page not found</title>
    <link rel="stylesheet" href="/404.css">
    <link rel="icon" type="image/x-icon" href="/images/fav-icon.jpg">
    <style>
      body {
        background-color: rgb(61, 102, 143);
        font-family: "Playfair Display", serif !important;
        color: rgb(61, 102, 143);
        margin: 0;
        height: 100vh;
      }
      
      .error-wrapper {
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        padding-top: 10%;
      }
      
      .error-wrapper .error-container {
        background-color: #ffffff !important;
        padding: 60px;
        border-radius: 10px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      }
      
      .error-wrapper .error-container .error {
        text-align: center;
      }
      
      .error-wrapper .error-container .error .error-title {
        font-size: 28px;
        font-weight: 700;
        letter-spacing: 5px;
        text-transform: uppercase;
      }
      
      .error-wrapper .error-container .error .error-number {
        font-size: 100px;
        font-weight: 700;
        color: rgb(61, 102, 143);
        letter-spacing: 5px;
        text-shadow: 0 3px 0 #292929, 0 14px 10px rgba(0, 0, 0, .15), 0 24px 2px rgba(0, 0, 0, .1), 0 34px 30px rgba(0, 0, 0, .1);
      }
      
      .error-wrapper .error-container .error .error-description {
        font-size: 14px;
        font-weight: 300;
        padding: 0 40px;
        color: rgb(61, 102, 143);
      }
      
      .error-wrapper .error-container .error .error-actions {
        margin-top: 30px;
        display: block;
      }
      
      .error-wrapper .error-container .error .error-actions a {
        color: rgb(61, 102, 143);
        font-size: 16px;
        text-decoration: none;
        font-weight: 600;
      }
      
      .error-wrapper .error-container .error .error-actions a:hover {
        text-decoration: underline;
      }
      
      @media only screen and (max-width: 600px) {
        .error-wrapper {
          padding-top: 5%;
        }
        .error-wrapper .error-container {
          padding: 30px;
        }
        .error-wrapper .error-container .error {
          width: auto;
        }
      }
    </style>
  </head>
  <body>
    <main>
      <center>
        <div class="error-wrapper">
          <div class="error-container">
            <div class="error">
              <div class="error-title">
                Error
              </div>
              <div class="error-number">
                404
              </div>
              <div class="error-description">
                Sorry, The page you were looking for doesn't exist.
              </div>
              <ul class="error-actions">
                <a href="/" style="color: rgb(61, 102, 143);">Go to Home Page</a>
              </ul>
            </div>
          </div>
        </div>
      </center>
    </main>

    <script src="https://use.fontawesome.com/1874c28d1a.js"></script>
  </body>
</html>
