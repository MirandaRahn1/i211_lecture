from flask import Flask, render_template, url_for, request, redirect
import csv

app = Flask(__name__)

#global variables to help with getting and setting dinosaur data
DINO_PATH = app.root_path + '/dinosaurs.csv'
DINO_KEYS = ['slug', 'name', 'description', 'image', 'image-credit', 'source-url', 'source-credit']

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

#function to get the dinosaurs dictionary of dictionaries data from csv file
def get_dinos():
    try:
        with open(DINO_PATH, 'r') as csvfile:
            data = csv.DictReader(csvfile)
            dinosaurs = {}
            for dino in data:
                dinosaurs[dino['slug']] = dino
    except Exception as e:
        print(e)
    return dinosaurs

# Function that takes a dictionary and saves it to csv
def set_dinos(dinosaurs):
    try:
        with open(DINO_PATH, mode='w', newline='') as csv_file:
            writer = csv.DictWriter(csv_file, fieldnames=DINO_KEYS)
            writer.writeheader()
            for dino in dinosaurs.values():
                writer.writerow(dino)
    except Exception as err:
        print(err)

# @app.route('/')
# def index():
#     dinosaurs=get_dinos()
#     print(dinosaurs)
#     return render_template('index.html', dinosaurs=dinosaurs)

# print(get_faq())
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

@app.route('/add-dino', methods = ['GET', 'POST'])
def add_dino():
    if request.method == 'POST':
    # grab the user data from POST 
        in_slug = request.form['slug']
        in_description = request.form['description']
        in_name = request.form['name']
        in_image = request.form['image']
        in_image_credit = request.form['image-credit']
        in_source_url = request.form['source-url']
        in_source_credit = request.form['source-credit']
    # create a new dictionary with the new dino data in it
        new_dino = {'slug':in_slug, 'name':in_name, 'description':in_description, 'image':in_image, 'image-credit':in_image_credit, 'source-url':in_source_url, 'source-credit':in_source_credit} 
    # grab the existing dino data 
        print(new_dino)
        dinosaurs = get_dinos()
        dinosaurs[in_slug] = new_dino
    # write the combined data back out to csv
        set_dinos(dinosaurs)
        return redirect(url_for('index'))
    else:
        return render_template('add-dino.html')
