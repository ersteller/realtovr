from flask import Flask, escape, request, render_template

app = Flask(__name__)


#def hello():
#    name = request.args.get("name", "World")
#    return f'Hello, {escape(name)}!'

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=80)