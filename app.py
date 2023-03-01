from flask import Flask, render_template, url_for
import csv

app = Flask(__name__)


DINO_PATH = app.root_path + '/dinosaurs.csv'
FAQ_PTH = app.root_path + '/faq.csv'

def get_dinos():
    with open(DINO_PATH, 'r') as csvfile:
        data=csv.DictReader(csvfile)
        dinosaurs={row['slug']: {'name': row['name'], 'description':row['description'], 'image':row['image'], 'image-credit':row['image-credit'], 'source-url':row['source-url'], 'source-credit':row['source-credit']} for row in data}
    return dinosaurs

def get_faq():
    fileList = []
    with open(FAQ_PTH, 'r') as csvfile:
        data=csv.reader(csvfile)
        for row in data:
            fileList.append(row)
        return fileList 

# @app.route('/')
# def index():
#     dinosaurs=get_dinos()
#     print(dinosaurs)
#     return render_template('index.html', dinosaurs=dinosaurs)

print(get_faq())
@app.route('/')
@app.route('/dino')
@app.route('/dino/<dino>')

def index(dino=None):
    dinosaurs=get_dinos()
    if dino in dinosaurs.keys():
        print(dino)
        return render_template('dino.html', dinosaur=dinosaurs[dino])
    else:
        return render_template('index.html', dinosaurs=dinosaurs)

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/faq')
def faq():
    faq = get_faq()
    return render_template('faq.html', faq = faq)
