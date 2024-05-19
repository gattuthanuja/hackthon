<!DOCTYPE html>
<html>
<head>
    <title>Apply for Jobs</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <script type="text/javascript">
        function validateForm() {
            var firstName = document.forms["applyForm"]["first_name"].value;
            var lastName = document.forms["applyForm"]["last_name"].value;
            var email = document.forms["applyForm"]["email"].value;
            var phone = document.forms["applyForm"]["phone"].value;
            var address = document.forms["applyForm"]["address"].value;
            var city = document.forms["applyForm"]["city"].value;
            var state = document.forms["applyForm"]["state"].value;
            var zip = document.forms["applyForm"]["zip"].value;
            var country = document.forms["applyForm"]["country"].value;
            var eduLevel = document.forms["applyForm"]["edu_level"].value;
            var eduType = document.forms["applyForm"]["edu_type"].value;
            var resume = document.forms["applyForm"]["resume"].value;
            var employed = document.forms["applyForm"]["employed"].checked;
            var employer = document.forms["applyForm"]["current_employer"].value;
            var yearsOfExp = document.forms["applyForm"]["years_of_exp"].value;

            if (firstName == "" || lastName == "" || email == "" || phone == "" || address == "" || city == "" || state == "" || zip == "" || country == "" || eduLevel == "" || eduType == "" || resume == "") {
                alert("All fields marked with * are required.");
                return false;
            }

            if (isNaN(zip)) {
                alert("ZIP code must be a number.");
                return false;
            }

            if (employed && (employer == "" || isNaN(yearsOfExp))) {
                alert("Current employer and years of experience are required for employed applicants.");
                return false;
            }

            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            var phonePattern = /^\d{10}$/;
            if (!phonePattern.test(phone)) {
                alert("Please enter a valid 10-digit phone number.");
                return false;
            }

            return true;
        }

        function toggleEmployerFields() {
            var employed = document.getElementById("employed").checked;
            var employerFields = document.getElementById("employerFields");
            if (employed) {
                employerFields.style.display = "block";
            } else {
                employerFields.style.display = "none";
            }
        }
    </script>
</head>
<body>
    <h1>Apply for Jobs</h1>
    <form name="applyForm" action="submit_application.jsp" onsubmit="return validateForm()" method="post" enctype="multipart/form-data">
        <label for="first_name">First Name*:</label><br>
        <input type="text" id="first_name" name="first_name"><br><br>

        <label for="last_name">Last Name*:</label><br>
        <input type="text" id="last_name" name="last_name"><br><br>

        <label for="email">Email*:</label><br>
        <input type="text" id="email" name="email"><br><br>

        <label for="phone">Phone*:</label><br>
        <input type="text" id="phone" name="phone"><br><br>

        <label for="address">Address*:</label><br>
        <input type="text" id="address" name="address"><br><br>

        <label for="city">City*:</label><br>
        <input type="text" id="city" name="city"><br><br>

        <label for="state">State*:</label><br>
        <input type="text" id="state" name="state"><br><br>

        <label for="zip">ZIP*:</label><br>
        <input type="text" id="zip" name="zip"><br><br>

        <label for="country">Country*:</label><br>
        <select id="country" name="country">
            <option value="">Select Country</option>
            <option value="US">United States</option>
            <option value="CA">Canada</option>
            <option value="DE">Germany</option>
            <option value="FR">France</option>
        </select><br><br>

        <label for="edu_level">Education Level*:</label><br>
        <select id="edu_level" name="edu_level">
            <option value="">Select Level</option>
            <option value="HS">High School</option>
            <option value="GRAD">Graduate</option>
            <option value="POSTGRAD">Post Graduate</option>
            <option value="PHD">Doctorate/PhD</option>
        </select><br><br>

        <label for="edu_type">Education Type*:</label><br>
        <select id="edu_type" name="edu_type">
            <option value="">Select Type</option>
            <option value="CIVENG">Civil Engineering</option>
            <option value="COMPENG">Computer Engineering</option>
            <option value="BUSADM">Business Administration</option>
            <option value="ECON">Economics</option>
            <option value="GEN">General</option>
        </select><br><br>

        <label for="resume">Resume*:</label><br>
        <input type="file" id="resume" name="resume"><br><br>

        <label for="cover_letter">Cover Letter:</label><br>
        <textarea id="cover_letter" name="cover_letter"></textarea><br><br>

        <label for="employed">Are you employed?</label>
        <input type="checkbox" id="employed" name="employed" onclick="toggleEmployerFields()"><br><br>

        <div id="employerFields" style="display: none;">
            <label for="current_employer">Current Employer:</label><br>
            <input type="text" id="current_employer" name="current_employer"><br><br>

            <label for="years_of_exp">Years of Experience:</label><br>
            <input type="text" id="years_of_exp" name="years_of_exp"><br><br>
        </div>

        <label for="job_ids">Jobs you want to apply for*:</label><br>
        <select id="job_ids" name="job_ids[]" multiple>
            <!-- Assuming job options will be dynamically populated -->
            <option value="1">Job 1</option>
            <option value="2">Job 2</option>
        </select><br><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
