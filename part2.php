<HTML>

<HEAD>
    <META charset = 'UTF-8'>
    <TITLE> Employee's Salary </TITLE>
</HEAD>

<BODY>
    <?php
        if (isset($_POST['submitButton2']) ){
            $html = ' ';
            $db_hostname = "localhost";		
            $db_name = "mycompany";	
            $db_user = "root";		
            $db_pass = "root";			
            $link = mysqli_connect($db_hostname, $db_user, $db_pass, $db_name) or die("Unable to connect to database");
            $query = 'SELECT E.emp_id, E.first_name, E.last_name, E.hire_date, D.dept_name, FORMAT(AVG(S.salary),2) AS Average
                    FROM 
                        employee AS E
                        INNER JOIN salary AS S ON E.emp_id = S.emp_id
                        INNER JOIN department AS D ON D.dept_id = E.dept_id
                    GROUP BY
                        S.emp_id ';
            if ($_POST['avg_salary'] == 1)
                $query .= 'HAVING AVG(S.salary) < 50000';
            else if ($_POST['avg_salary'] == 2)
                $query .= 'HAVING AVG(S.salary) BETWEEN 50000.01 AND 60000.00';
            else if ($_POST['avg_salary'] == 3)
                $query .= 'HAVING AVG(S.salary) BETWEEN 60000.01 AND 70000.00';
            else if ($_POST['avg_salary'] == 4)
                $query .= 'HAVING AVG(S.salary) BETWEEN 70000.01 AND 80000.00';
            else if ($_POST['avg_salary'] == 5)
                $query .= 'HAVING AVG(S.salary) BETWEEN 80000.01 AND 90000';
            else
                $query .= 'HAVING AVG(S.salary) > 90000';
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
                                <TD bgcolor="#F0F0F0"> Average salary </TD>
                            </TR>';
                while ($row = mysqli_fetch_object($results)) {
                    $html .='<TR>
                                <TD> '.$row->emp_id.' </TD>
                                <TD> '.$row->first_name.' </TD>
                                <TD> '.$row->last_name.' </TD>
                                <TD> '.$row->hire_date.' </TD>
                                <TD> '.$row->dept_name.' </TD>
                                <TD> '.$row->Average.' </TD>
                            </TR>';
                }
                $html .= '</TABLE>';
            }
            else {
                $html .='Δεν βρέθηκαν αποτελέσματα για αυτήν την αναζήτηση.';
            }
            mysqli_close($link);
            print $html;
        }
    ?>
    <BR/> Για επιστροφή στην αρχική φόρμα, πατήστε <a href="index.php">εδώ</a>.
</BODY>
</HTML>