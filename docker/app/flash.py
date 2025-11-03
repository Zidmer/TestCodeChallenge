from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return """
<html>
  <head>
    <title>Flashweb Deployed</title>
    <style>
      body {
        margin: 0;
        padding: 0;
        background: radial-gradient(circle at center, #000000, #1f1c2c);
        color: #ff4d4d;
        font-family: 'Creepster', cursive;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        text-align: center;
        background-image: url('https://www.transparenttextures.com/patterns/skulls.png');
      }
      h1 {
        font-size: 4em;
        animation: flicker 1.5s infinite;
        text-shadow: 0 0 10px #ff4d4d, 0 0 20px #ff0000;
      }
      @keyframes flicker {
        0% { opacity: 1; }
        50% { opacity: 0.6; }
        100% { opacity: 1; }
      }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Creepster&display=swap" rel="stylesheet">
  </head>
  <body>
    <h1>Welcome to Flashweb</h1>
    <p>The shadows are stirring… Halloween is almost here!</p>
  </body>
</html>
"""
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)