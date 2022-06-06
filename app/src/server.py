import os
from flask import Flask

server = Flask(__name__)
port = 8080


@server.route("/")
def hello():
    return "Hello Sealed Secrets!"


if __name__ == "__main__":
    key1 = os.environ['KEY1']
    key2 = os.environ['KEY2']
    print(f'Server started on port: {port}, key1: {key1}')
    print(f'Server started on port: {port}, key2: {key2}')
    server.run(host='0.0.0.0', port=port)