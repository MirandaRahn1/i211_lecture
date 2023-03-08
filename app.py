from flask import Flask, render_template, url_for, request, redirect
import csv

app = Flask(__name__)

DINO_PATH = app.root_path + '/dinosaurs.csv'
FAQ_PTH = app.root_path + '/faq.csv'
DINO_PATH = app.root_path + '/dinosaurs.csv'
DINO_KEYS = ['slug', 'name', 'description', 'image', 'image-credit', 'source-url', 'source-credit']

def get_dinos():
    with open(DINO_PATH, 'r') as csvfile:
        data=csv.DictReader(csvfile)
        dinosaurs={row['slug']: {'name': row['name'], 'description':row['description'], 'image':row['image'], 'image-credit':row['image-credit'], 'source-url':row['source-url'], 'source-credit':row['source-credit']} for row in data}
    return dinosaurs

def set_dinos(dinosaurs):
    try:
        with open(DINO_PATH, mode='w', newline='') as csv_file:
            writer = csv.DictWriter(csv_file, fieldnames=DINO_KEYS)
            writer.writeheader()
            for dino in dinosaurs.values():
                writer.writerow(dino)
    except Exception as err:
        print(err)

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

@app.route('/add-dino', methods=['GET', 'POST'])
def add_dino():
    if request.method == 'POST':
        dinosaurs = get_dinos()
        new_dino = {}
        new_dino['name'] = request.form['name']
        new_dino['description'] = request.form['description']
        new_dino['image'] = request.form['image']
        new_dino['image-credit'] = request.form['image-credit']
        new_dino['source-url'] = request.form['source-url']
        new_dino['source-credit'] = request.form['source-credit']
        dinosaurs[request.form['slug']] = new_dino
        set_dinos(dinosaurs)
        return redirect(url_for('index'))
    else:
        return render_template('add_dino.html')
