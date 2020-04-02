from flask import Flask, escape, request, render_template
import os
import sys

app = Flask(__name__)



#def hello():
#    name = request.args.get("name", "World")
#    return f'Hello, {escape(name)}!'
scripdir = os.path.dirname(sys.argv[0])

@app.route('/')
def index():
    staticpath = os.path.join(scripdir, "static")
    files = os.listdir(staticpath)
    inputfilename = None
    for filename in files:
        if "input" in filename:
            inputfilename = filename
            print( "input filename: ", inputfilename)
            break
    for filename in files:
        if "output" in filename:
            outputfilename = filename
            print( "output filename: ", outputfilename)
            break

    return render_template('index.html', inputfilename=inputfilename, outputfilename=outputfilename)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=80)