<HTML>

<HEAD> 
    <TITLE> Company </TITLE>
    <META charset="utf-8" </>
</HEAD>

<BODY bgcolor="#FFFFCC" >
    </BR>1. ΑΝΑΖΗΤΗΣΗ ΥΠΑΛΛΗΛΩΝ ΜΕ ΒΑΣΗ ΤΟ ΟΝΟΜΑ/ΕΠΩΝΥΜΟ: </BR>
    <FORM METHOD="POST" ACTION="part1.php">
        &nbsp;&nbsp;&nbsp;&nbsp;Όνομα/Επώνυμο:&nbsp;
        <input type="text" name="search_field" placeholder="Όνομα ή Επώνυμο προς αναζήτηση" style="width: 240px;" />
        <input type="submit" name="submitButton1" value="Αναζήτηση" />
    </FORM>
    </BR></BR></BR>2. ΑΝΑΖΗΤΗΣΗ ΥΠΑΛΛΗΛΩΝ ΜΕ ΒΑΣΗ ΤΟΝ ΜΕΣΟ ΜΙΣΘΟ: </BR>
    <FORM METHOD="POST" ACTION="part2.php">
        &nbsp;&nbsp;&nbsp;&nbsp;Μισθός:&nbsp;&nbsp;&nbsp;
        <SELECT name="avg_salary" style="width: 200px;" required>
            <OPTION value="" disabled selected > Μέσος Μισθός </OPTION>
            <OPTION value="1">    &lt; 50000,00€ </OPTION>
            <OPTION value="2"> 50000,01€ - 60000,00€ </OPTION>
            <OPTION value="3"> 60000,01€ - 70000,00€ </OPTION>
            <OPTION value="4"> 70000,01€ - 80000,00€ </OPTION>
            <OPTION value="5"> 80000,01€ - 90000,00€ </OPTION>
            <OPTION value="6">   > 90000,01€ </OPTION>
        </SELECT>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" name="submitButton2" value="Αναζήτηση" />
    </FORM>
    </BR></BR></BR>3. ΕΙΣΑΓΩΓΗ ΝΕΟΥ ΥΠΑΛΛΗΛΟΥ:</BR>
    <FORM METHOD="POST" ACTION="part3.php">
        <TABLE cellpadding="1" cellspacing="0" width="500" >
            <TR>
                <TD valign="middle"> &nbsp;&nbsp;&nbsp;&nbsp; Κωδικός αριθμός: </TD>
                <TD valign="middle"> <input type="text" name="id" placeholder="Κωδικός αριθμός" style="width: 200px;" required/> </TD>
            </TR>
            <TR>
                <TD valign="middle"> &nbsp;&nbsp;&nbsp;&nbsp; Όνομα: </TD>
                <TD valign="middle"> <input type="text" name="name" placeholder="Όνομα" style="width: 200px;" required/> </TD>
            </TR>
            <TR>
                <TD valign="middle"> &nbsp;&nbsp;&nbsp;&nbsp; Επώνυμο: </TD>
                <TD valign="middle"> <input type="text" name="last_name" placeholder="Επώνυμο" style="width: 200px;" required/> </TD>
            </TR>
            <TR>
                <TD valign="middle"> &nbsp;&nbsp;&nbsp;&nbsp; Ημερομηνία γέννησης: </TD>
                <TD valign="middle"> <input type="date" name="b_date" placeholder="Ημερομηνία γέννησης" style="width: 200px;" required/> </TD>
            </TR>
            <TR>
                <TD valign="middle"> &nbsp;&nbsp;&nbsp;&nbsp; Φύλο: </TD>
                <TD valign="middle">
                    <input type="radio" name="gender" value="M" required> Άνδρας
                    <input type="radio" name="gender" value="F" > Γυναίκα
                </TD>
            </TR>
            <TR>
                <TD valign="middle"> &nbsp;&nbsp;&nbsp;&nbsp; Ημερομηνία πρόσληψης: </TD>
                <TD valign="middle"> <input type="date" name="h_date" placeholder="Ημερομηνία πρόσληψης" style="width: 200px;" required/> </TD>
            </TR>
            <TR>
                <TD valign="middle"> &nbsp;&nbsp;&nbsp;&nbsp; Μισθός: </TD>
                <TD valign="middle"> <input type="text" name="salary" placeholder="Μισθός" style="width: 200px;" required/> </TD>
            </TR>
            <TR>
                <TD valign="middle"> &nbsp;&nbsp;&nbsp;&nbsp; Τμήμα: </TD>
                <TD valign="middle">
                    <SELECT name="dept" style="width: 200px;" required>
                        <?php
                            $html = '<OPTION value="" disabled selected > Τμήμα </OPTION>';
                            $db_hostname = "localhost";
                            $db_name = "mycompany";		
                            $db_user = "root";			
                            $db_pass = "root";
                            $link = mysqli_connect($db_hostname, $db_user, $db_pass, $db_name) or die("Unable to connect to database");
                            $query = "SELECT dept_id,dept_name FROM department ORDER BY dept_name;";
                            $results = mysqli_query($link,$query) or die("Query failed");
                            while ($row = mysqli_fetch_object($results))
                                $html .= "<OPTION value='$row->dept_id' > $row->dept_name </OPTION>";
                            mysqli_close($link);
                            print $html;
                        ?>
                    </SELECT>
                </TD>
            </TR>
        </TABLE>
        </BR>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="reset" name="resetButton" value="Καθαρισμός"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" name="submitButton3" value="Εισαγωγή"/>
    </FORM>
</BODY>

</HTML>