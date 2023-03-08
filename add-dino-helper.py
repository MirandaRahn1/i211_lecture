
# 1 Add to your imports from Flask
# request, redirect, url_for

# 2 Add after app = Flask(__name__) :

#global variables to help with getting and setting dinosaur data
DINO_PATH = app.root_path + '/dinosaurs.csv'
DINO_KEYS = ['slug', 'name', 'description', 'image', 'image-credit', 'source-url', 'source-credit']

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

# 3 Add underneath other routes
#   Complete the code
@app.route('/add-dino', methods=['GET', 'POST'])
def add_dino():
    
    # if POST request received (form submitted)
    if request.method == 'POST':
        # get dinosaurs.csv data
        # create new dict to hold new dino data from form
        # add form data to new dict
        # add new dict to csv data
        # write csv data back out to csv file
        # since POST request, redirect to home after Submit
        return redirect(url_for('index'))
    
    # if GET request received (display form)
    else:
        return render_template('add-dino.html')