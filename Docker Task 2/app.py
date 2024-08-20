from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return '''
    <html>
    <body>
        <h1>Hello</h1>
        <p>Here are some basic details:</p>
        <ul>
            <li><strong>Name:</strong>Vinothkumar R</li>
            <li><strong>Course:</strong>DevOps</li>
            <li><strong>Email ID:</strong>kumarvinoth1553@gmail.com</li>
            <li><strong>Mobile No:</strong>8825951072</li>
        </ul>
    </body>
    </html>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

