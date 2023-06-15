#!/usr/bin/python3
"""Starts a Flask web application.

the application listens on 0.0.0.0, port 5000.
Routes:
    /airbnb-onepage/: Displays 'Hello HBNB!'
"""
from flask import Flask


app = Flask(__name__)

@app.route('/airbnb-onepage/', strict_slashes=False)
def hello():
    return "Hello HBNB!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
