from flask import Flask, render_template, url_for
import csv

app = Flask(__name__)

#globals 
greetings = ['How are you?', 'What is the weather like out there?', 'Is it Friday yet?']

def get_dinos():
    with open('dinosaurs.csv', 'r') as csvfile:
        data=csv.DictReader(csvfile)
        dinosaurs={row['slug']: {'name': row['name'], 'description':row['description'], 'image':row['image'], 'image-credit':row['image-credit'], 'source-url':row['source-url'], 'source-credit':row['source-credit']} for row in data}
    return dinosaurs

@app.route('/')
def index():
    dinosaurs=get_dinos()
    print(dinosaurs)
    return render_template('index.html', dinosaurs=dinosaurs)