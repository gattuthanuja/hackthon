<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter Job Data</title>
    <style>
        /* CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        h1 {
            text-align: center;
            color: #333;
        }
        
        form {
            max-width: 500px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        label {
            font-weight: bold;
        }
        
        .input-field {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        button[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        
        button[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Enter Job Data</h1>
    <form action="your-servlet-url" method="post" onsubmit="return validateJobForm()">
        <label for="title">Title*</label>
        <input type="text" id="title" name="title" class="input-field" required><br>

        <label for="type">Type</label>
        <select id="type" name="type" class="input-field" required>
            <option value="">Select type</option>
            <option value="Full-time">Full-time</option>
            <option value="Part-time">Part-time</option>
            <option value="Contract">Contract</option>
            <option value="Internship">Internship</option>
        </select><br>

        <label for="department">Department</label>
        <select id="department" name="department" class="input-field" required>
            <option value="">Select department</option>
            <option value="HR">HR</option>
            <option value="Engineering">Engineering</option>
            <option value="Marketing">Marketing</option>
            <option value="Sales">Sales</option>
            <option value="Finance">Finance</option>
            <option value="IT">IT</option>
            <option value="Customer Service">Customer Service</option>
        </select><br>

        <label for="country">Country</label>
        <select id="country" name="country" class="input-field" required>
            <option value="">Select country</option>
            <option value="USA">USA</option>
            <option value="Canada">Canada</option>
            <option value="UK">UK</option>
            <option value="Australia">Australia</option>
            <option value="Germany">Germany</option>
            <option value="France">France</option>
            <option value="India">India</option>
            <option value="China">China</option>
            <option value="Japan">Japan</option>
        </select><br>

        <label for="description">Description</label>
        <textarea id="description" name="description" class="input-field" required></textarea><br>

        <label for="opening_date">Opening Date</label>
        <input type="date" id="opening_date" name="opening_date" class="input-field" required><br>

        <button type="submit">Submit</button>
    </form>
</body>
</html>