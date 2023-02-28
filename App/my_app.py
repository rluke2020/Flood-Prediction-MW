from flask import Flask

app = Flask(__name__)

@app.route('/predict')
def index():
    return '<h1>FLASK APP IS RUNNING!</h1>'

if __name__ == '__main__':
    app.run()