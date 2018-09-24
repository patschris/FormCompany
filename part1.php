<HTML>

<HEAD>
    <META charset = 'UTF-8'>
    <TITLE> Employee's Name/Surname </TITLE>
</HEAD>

<BODY>
    <?php
        if (isset($_POST['submitButton1']) ){
            $html = ' ';
            $db_hostname = "localhost";		
            $db_name = "mycompany";	
            $db_user = "root";		
            $db_pass = "root";			
            $link = mysqli_connect($db_hostname, $db_user, $db_pass, $db_name) or die("Unable to connect to database!");
            $query ='SELECT e.emp_id, e.first_name, e.last_name, e.hire_date, d.dept_name  
                    FROM employee e INNER JOIN department d ON e.dept_id = d.dept_id 
                    WHERE (e.first_name LIKE "%'.$_POST["search_field"].'%" or e.last_name LIKE "%'.$_POST["search_field"].'%");';
            $results = mysqli_query($link,$query) or die('Query failed');
            if (mysqli_num_rows($results) > 0) {
                $html .= '<BR/> <b> AΠΟΤΕΛΕΣΜΑΤΑ: </b> <BR/><BR/>
                            <TABLE cellpadding="0" cellspacing="0" border="2" width="900" bgcolor="#EEF6FA">
                            <TR>
                                <TD bgcolor="#F0F0F0"> Employee id </TD> 
                                <TD bgcolor="#F0F0F0"> First Name </TD> 
                                <TD bgcolor="#F0F0F0"> Last Name </TD>
                                <TD bgcolor="#F0F0F0"> Hire date </TD> 
                                <TD bgcolor="#F0F0F0"> Department name </TD>
                            </TR>';
                while ($row = mysqli_fetch_object($results)) {
                    $html .='<TR>
                                <TD> '.$row->emp_id.' </TD>
                                <TD> '.$row->first_name.' </TD>
                                <TD> '.$row->last_name.' </TD>
                                <TD> '.$row->hire_date.' </TD>
                                <TD> '.$row->dept_name.' </TD>
                            </TR>';
                }
                $html .= '</TABLE>';
            }
            else {
                $html .= 'Δεν βρέθηκαν αποτελέσματα για αυτήν την αναζήτηση.';
            }
            mysqli_close($link);
            print $html;
        }
    ?>
    <BR/> Για επιστροφή στην αρχική φόρμα, πατήστε <a href="index.php">εδώ</a>.
</BODY>

</HTML>