<HTML>

<HEAD>
    <META charset = 'UTF-8'>
    <TITLE> Employee's insertion </TITLE>
</HEAD>

<BODY>
    <?php
        if (isset($_POST['submitButton3'])){
            $t_date = '9999-01-01';
            $html = ' ';
            $db_hostname = "localhost";		
            $db_name = "mycompany";	
            $db_user = "root";		
            $db_pass = "root";			
            $link = mysqli_connect($db_hostname, $db_user, $db_pass, $db_name) or die ("Unable to connect to database!");
            $query = "SELECT emp_id FROM employee WHERE emp_id=".$_POST['id'];
            $results = mysqli_query($link,$query);
            if( mysqli_num_rows($results) != 0) {
                $html .= "ID already exists!";
            }
            else { 
                $query ="INSERT INTO employee(emp_id,birth_date,first_name,last_name,gender,hire_date,dept_id)
                        VALUES('".$_POST['id']."','".$_POST['b_date']."','".$_POST['name']."','".$_POST['last_name']."',
                                '".$_POST['gender']."', '".$_POST['h_date']."', '".$_POST['dept']."')";
                $results = mysqli_query($link,$query) or die('Insertion of employee to database failed.');
                $query = "INSERT INTO salary(emp_id,salary,from_date,to_date)
                            VALUES('".$_POST['id']."','".$_POST['salary']."','".$_POST['h_date']."','".$t_date."')";
                $results = mysqli_query($link,$query) or die ("Insertion of employee's salary to database failed.");
                $html .= "<BR/><b>Η εισαγωγή ήταν επιτυχής. Προστέθηκε ο υπάλληλος: </b><BR/> <font face='verdana' >
                                &nbsp;<i>ID:</i> "				.$_POST['id'].			"<BR/>
                                &nbsp;<i>Name:</i> "			.$_POST["name"].		"<BR/>
                                &nbsp;<i>Last name:</i> "		.$_POST["last_name"].	"<BR/>
                                &nbsp;<i>Birth date:</i> "		.$_POST["b_date"].		"<BR/>
                                &nbsp;<i>Gender:</i> "			.$_POST["gender"].		"<BR/>
                                &nbsp;<i>Department ID:</i> "	.$_POST["dept"].		"<BR/>
                                &nbsp;<i>Salary:</i> "			.$_POST["salary"].		"<BR/>
                            </font>";
            }
            mysqli_close($link);
            print $html;
        }
    ?>
    <BR/><BR/><BR/> Για επιστροφή στην αρχική φόρμα, πατήστε <a href="index.php">εδώ</a>.
</BODY>

</HTML>