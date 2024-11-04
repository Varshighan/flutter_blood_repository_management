import cx_Oracle
import datetime 
# Define your Oracle DB connection parameters
dsn_tns = cx_Oracle.makedsn('your_host', 'your_port', service_name='your_service_name')

def get_db_connection():
    connection = cx_Oracle.connect(user='your_username', password='your_password', dsn=dsn_tns)
    return connection

# crud operations for donoar table
# insert into
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/add_donor', methods=['POST'])
def add_donor():
    data = request.get_json()
    
    conn = get_db_connection()
    cursor = conn.cursor()

    # Insert query for donor
    cursor.execute("""
        INSERT INTO Donor (first_name, last_name, date_of_birth, gender, blood_type, contact_number, email, address)
        VALUES (:first_name, :last_name, TO_DATE(:date_of_birth, 'YYYY-MM-DD'), :gender, :blood_type, :contact_number, :email, :address)
        """, {
        'first_name': data['first_name'],
        'last_name': data['last_name'],
        'date_of_birth': data['date_of_birth'],
        'gender': data['gender'],
        'blood_type': data['blood_type'],
        'contact_number': data['contact_number'],
        'email': data['email'],
        'address': data['address']
    })
    
    conn.commit()
    cursor.close()
    conn.close()
    
    return jsonify({'message': 'Donor added successfully'}), 201

# read donors
@app.route('/get_donors', methods=['GET'])
def get_donors():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    cursor.execute("SELECT * FROM Donor")
    donors = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return jsonify(donors), 200
# update
@app.route('/update_donor/<int:donor_id>', methods=['PUT'])
def update_donor(donor_id):
    data = request.get_json()
    
    conn = get_db_connection()
    cursor = conn.cursor()
    
    cursor.execute("""
        UPDATE Donor 
        SET first_name = :first_name, last_name = :last_name, date_of_birth = TO_DATE(:date_of_birth, 'YYYY-MM-DD'), 
            gender = :gender, blood_type = :blood_type, contact_number = :contact_number, email = :email, address = :address
        WHERE donor_id = :donor_id
        """, {
        'first_name': data['first_name'],
        'last_name': data['last_name'],
        'date_of_birth': data['date_of_birth'],
        'gender': data['gender'],
        'blood_type': data['blood_type'],
        'contact_number': data['contact_number'],
        'email': data['email'],
        'address': data['address'],
        'donor_id': donor_id
    })
    
    conn.commit()
    cursor.close()
    conn.close()
    
    return jsonify({'message': 'Donor updated successfully'}), 200
# delete
@app.route('/delete_donor/<int:donor_id>', methods=['DELETE'])
def delete_donor(donor_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    cursor.execute("DELETE FROM Donor WHERE donor_id = :donor_id", {'donor_id': donor_id})
    
    conn.commit()
    cursor.close()
    conn.close()
    
    return jsonify({'message': 'Donor deleted successfully'}), 200
# crud for blood donations
# Create a new blood donation
@app.route('/blood_donations', methods=['POST'])
def add_blood_donation():
    data = request.get_json()
    donor_id = data['donor_id']
    blood_group = data['blood_group']
    donation_date = data['donation_date']  # Ensure it's in 'YYYY-MM-DD' format
    volume = data['volume']  # Volume in mL
    
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("INSERT INTO BloodDonation (donor_id, blood_group, donation_date, volume) VALUES (:donor_id, :blood_group, :donation_date, :volume)",
                   {'donor_id': donor_id, 'blood_group': blood_group, 'donation_date': donation_date, 'volume': volume})
    connection.commit()
    
    cursor.close()
    connection.close()
    
    return jsonify({"message": "Blood donation added successfully."}), 201

# Retrieve all blood donations
@app.route('/blood_donations', methods=['GET'])
def get_blood_donations():
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("SELECT donation_id, donor_id, blood_group, donation_date, volume FROM BloodDonation")
    donations = cursor.fetchall()
    
    cursor.close()
    connection.close()
    
    donations_list = []
    for donation in donations:
        donations_list.append({
            "donation_id": donation[0],
            "donor_id": donation[1],
            "blood_group": donation[2],
            "donation_date": donation[3].strftime('%Y-%m-%d'),  # Format date as string
            "volume": donation[4]
        })
    
    return jsonify(donations_list), 200

# Retrieve a single blood donation by ID
@app.route('/blood_donations/<int:donation_id>', methods=['GET'])
def get_blood_donation(donation_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("SELECT donation_id, donor_id, blood_group, donation_date, volume FROM BloodDonation WHERE donation_id = :id", {'id': donation_id})
    donation = cursor.fetchone()
    
    cursor.close()
    connection.close()
    
    if donation:
        return jsonify({
            "donation_id": donation[0],
            "donor_id": donation[1],
            "blood_group": donation[2],
            "donation_date": donation[3].strftime('%Y-%m-%d'),  # Format date as string
            "volume": donation[4]
        }), 200
    else:
        return jsonify({"error": "Blood donation not found."}), 404

# Update a blood donation's details
@app.route('/blood_donations/<int:donation_id>', methods=['PUT'])
def update_blood_donation(donation_id):
    data = request.get_json()
    donor_id = data.get('donor_id')
    blood_group = data.get('blood_group')
    donation_date = data.get('donation_date')  # Ensure it's in 'YYYY-MM-DD' format
    volume = data.get('volume')

    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("UPDATE BloodDonation SET donor_id = :donor_id, blood_group = :blood_group, donation_date = :donation_date, volume = :volume WHERE donation_id = :id",
                   {'donor_id': donor_id, 'blood_group': blood_group, 'donation_date': donation_date, 'volume': volume, 'id': donation_id})
    connection.commit()
    
    cursor.close()
    connection.close()
    
    return jsonify({"message": "Blood donation updated successfully."}), 200

# Delete a blood donation
@app.route('/blood_donations/<int:donation_id>', methods=['DELETE'])
def delete_blood_donation(donation_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("DELETE FROM BloodDonation WHERE donation_id = :id", {'id': donation_id})
    connection.commit()
    
    cursor.close()
    connection.close()
    
    return jsonify({"message": "Blood donation deleted successfully."}), 200

# crud operations for inventory
# Create a new blood inventory entry
@app.route('/blood_inventories', methods=['POST'])
def add_blood_inventory():
    data = request.get_json()
    blood_group = data['blood_group']
    units_available = data['units_available']
    expiry_date = data['expiry_date']  # Ensure it's in 'YYYY-MM-DD' format
    
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("INSERT INTO BloodInventory (blood_group, units_available, expiry_date) VALUES (:blood_group, :units_available, :expiry_date)",
                   {'blood_group': blood_group, 'units_available': units_available, 'expiry_date': expiry_date})
    connection.commit()
    
    cursor.close()
    connection.close()
    
    return jsonify({"message": "Blood inventory added successfully."}), 201

# Retrieve all blood inventory entries
@app.route('/blood_inventories', methods=['GET'])
def get_blood_inventories():
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("SELECT inventory_id, blood_group, units_available, expiry_date FROM BloodInventory")
    inventories = cursor.fetchall()
    
    cursor.close()
    connection.close()
    
    inventories_list = []
    for inventory in inventories:
        inventories_list.append({
            "inventory_id": inventory[0],
            "blood_group": inventory[1],
            "units_available": inventory[2],
            "expiry_date": inventory[3].strftime('%Y-%m-%d')  # Format date as string
        })
    
    return jsonify(inventories_list), 200

# Retrieve a single blood inventory entry by ID
@app.route('/blood_inventories/<int:inventory_id>', methods=['GET'])
def get_blood_inventory(inventory_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("SELECT inventory_id, blood_group, units_available, expiry_date FROM BloodInventory WHERE inventory_id = :id", {'id': inventory_id})
    inventory = cursor.fetchone()
    
    cursor.close()
    connection.close()
    
    if inventory:
        return jsonify({
            "inventory_id": inventory[0],
            "blood_group": inventory[1],
            "units_available": inventory[2],
            "expiry_date": inventory[3].strftime('%Y-%m-%d')  # Format date as string
        }), 200
    else:
        return jsonify({"error": "Blood inventory entry not found."}), 404

# Update a blood inventory entry
@app.route('/blood_inventories/<int:inventory_id>', methods=['PUT'])
def update_blood_inventory(inventory_id):
    data = request.get_json()
    blood_group = data.get('blood_group')
    units_available = data.get('units_available')
    expiry_date = data.get('expiry_date')  # Ensure it's in 'YYYY-MM-DD' format

    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("UPDATE BloodInventory SET blood_group = :blood_group, units_available = :units_available, expiry_date = :expiry_date WHERE inventory_id = :id",
                   {'blood_group': blood_group, 'units_available': units_available, 'expiry_date': expiry_date, 'id': inventory_id})
    connection.commit()
    
    cursor.close()
    connection.close()
    
    return jsonify({"message": "Blood inventory updated successfully."}), 200

# Delete a blood inventory entry
@app.route('/blood_inventories/<int:inventory_id>', methods=['DELETE'])
def delete_blood_inventory(inventory_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("DELETE FROM BloodInventory WHERE inventory_id = :id", {'id': inventory_id})
    connection.commit()
    
    cursor.close()
    connection.close()
    
    return jsonify({"message": "Blood inventory deleted successfully."}), 200

# crud operations for hospital table
# create
@app.route('/add_hospital', methods=['POST'])
def add_hospital():
    data = request.get_json()

    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute("""
        INSERT INTO Hospital (hospital_name, email, password, address, contact_number)
        VALUES (:hospital_name, :email, :password, :address, :contact_number)
        """, {
        'hospital_name': data['hospital_name'],
        'email': data['email'],
        'password': data['password'],  # Use password hashing in real-world apps
        'address': data['address'],
        'contact_number': data['contact_number']
    })
    
    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({'message': 'Hospital registered successfully'}), 201

# authentication
from werkzeug.security import check_password_hash

@app.route('/hospital_login', methods=['POST'])
def hospital_login():
    data = request.get_json()
    email = data['email']
    password = data['password']

    conn = get_db_connection()
    cursor = conn.cursor()
    
    cursor.execute("SELECT password FROM Hospital WHERE email = :email", [email])
    stored_password = cursor.fetchone()

    if stored_password and check_password_hash(stored_password[0], password):
        return jsonify({'message': 'Login successful'}), 200
    else:
        return jsonify({'message': 'Invalid credentials'}), 401

# Retrieve all hospitals
@app.route('/hospitals', methods=['GET'])
def get_hospitals():
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("SELECT hospital_id, hospital_name, hospital_address, contact_phone, contact_email FROM Hospital")
    hospitals = cursor.fetchall()
    
    cursor.close()
    connection.close()
    
    # Convert list of tuples to list of dictionaries for JSON response
    hospitals_list = []
    for hospital in hospitals:
        hospitals_list.append({
            "hospital_id": hospital[0],
            "hospital_name": hospital[1],
            "hospital_address": hospital[2],
            "contact_phone": hospital[3],
            "contact_email": hospital[4]
        })
    
    return jsonify(hospitals_list), 200
if __name__ == '__main__':
    app.run(debug=True)
# Retrieve a single hospital by ID
@app.route('/hospitals/<int:hospital_id>', methods=['GET'])
def get_hospital(hospital_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("SELECT hospital_id, hospital_name, hospital_address, contact_phone, contact_email FROM Hospital WHERE hospital_id = :id", {'id': hospital_id})
    hospital = cursor.fetchone()
    
    cursor.close()
    connection.close()
    
    if hospital:
        return jsonify({
            "hospital_id": hospital[0],
            "hospital_name": hospital[1],
            "hospital_address": hospital[2],
            "contact_phone": hospital[3],
            "contact_email": hospital[4]
        }), 200
    else:
        return jsonify({"error": "Hospital not found."}), 404

# Update a hospital's details
@app.route('/hospitals/<int:hospital_id>', methods=['PUT'])
def update_hospital(hospital_id):
    data = request.get_json()
    hospital_name = data.get('hospital_name')
    password = data.get('password')
    hospital_address = data.get('hospital_address')
    contact_phone = data.get('contact_phone')
    contact_email = data.get('contact_email')
    
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("UPDATE Hospital SET hospital_name = :hospital_name, password = :password, hospital_address = :hospital_address, contact_phone = :contact_phone, contact_email = :contact_email WHERE hospital_id = :id",
                   {'hospital_name': hospital_name, 'password': password, 'hospital_address': hospital_address, 'contact_phone': contact_phone, 'contact_email': contact_email, 'id': hospital_id})
    connection.commit()
    
    cursor.close()
    connection.close()
    
    return jsonify({"message": "Hospital updated successfully."}), 200

# Delete a hospital
@app.route('/hospitals/<int:hospital_id>', methods=['DELETE'])
def delete_hospital(hospital_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("DELETE FROM Hospital WHERE hospital_id = :id", {'id': hospital_id})
    connection.commit()
    
    cursor.close()
    connection.close()
    
    return jsonify({"message": "Hospital deleted successfully."}), 200

if __name__ == '__main__':
    app.run(debug=True)

# Create a new blood request
@app.route('/blood_requests', methods=['POST'])
def add_blood_request():
    data = request.get_json()
    hospital_id = data['hospital_id']
    blood_group = data['blood_group']
    units_requested = data['units_requested']
    request_date = datetime.now()  # Set the current date
    
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("INSERT INTO BloodRequest (hospital_id, blood_group, units_requested, request_date) VALUES (:hospital_id, :blood_group, :units_requested, :request_date)",
                   {'hospital_id': hospital_id, 'blood_group': blood_group, 'units_requested': units_requested, 'request_date': request_date})
    connection.commit()
    
    cursor.close()
    connection.close()
    
    return jsonify({"message": "Blood request added successfully."}), 201

# Retrieve all blood requests
@app.route('/blood_requests', methods=['GET'])
def get_blood_requests():
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("SELECT request_id, hospital_id, blood_group, units_requested, request_date, fulfilled FROM BloodRequest")
    requests = cursor.fetchall()
    
    cursor.close()
    connection.close()
    
    # Convert list of tuples to list of dictionaries for JSON response
    requests_list = []
    for request in requests:
        requests_list.append({
            "request_id": request[0],
            "hospital_id": request[1],
            "blood_group": request[2],
            "units_requested": request[3],
            "request_date": request[4].strftime('%Y-%m-%d'),  # Format date as string
            "fulfilled": request[5]
        })
    
    return jsonify(requests_list), 200

# Retrieve a single blood request by ID
@app.route('/blood_requests/<int:request_id>', methods=['GET'])
def get_blood_request(request_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("SELECT request_id, hospital_id, blood_group, units_requested, request_date, fulfilled FROM BloodRequest WHERE request_id = :id", {'id': request_id})
    request = cursor.fetchone()
    
    cursor.close()
    connection.close()
    
    if request:
        return jsonify({
            "request_id": request[0],
            "hospital_id": request[1],
            "blood_group": request[2],
            "units_requested": request[3],
            "request_date": request[4].strftime('%Y-%m-%d'),  # Format date as string
            "fulfilled": request[5]
        }), 200
    else:
        return jsonify({"error": "Blood request not found."}), 404

# Update a blood request's details
@app.route('/blood_requests/<int:request_id>', methods=['PUT'])
def update_blood_request(request_id):
    data = request.get_json()
    blood_group = data.get('blood_group')
    units_requested = data.get('units_requested')
    fulfilled = data.get('fulfilled', 'N')  # Default to 'N' if not provided

    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("UPDATE BloodRequest SET blood_group = :blood_group, units_requested = :units_requested, fulfilled = :fulfilled WHERE request_id = :id",
                   {'blood_group': blood_group, 'units_requested': units_requested, 'fulfilled': fulfilled, 'id': request_id})
    connection.commit()
    
    cursor.close()
    connection.close()
    
    return jsonify({"message": "Blood request updated successfully."}), 200

# Delete a blood request
@app.route('/blood_requests/<int:request_id>', methods=['DELETE'])
def delete_blood_request(request_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    
    cursor.execute("DELETE FROM BloodRequest WHERE request_id = :id", {'id': request_id})
    connection.commit()
    
    cursor.close()
    connection.close()
    
    return jsonify({"message": "Blood request deleted successfully."}), 200

if __name__ == '__main__':
    app.run(debug=True)