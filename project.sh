# Md Shahriar Mannan Prottoy
# ID 0242220005101490
# Azim Ullah Tamim
#ID 0242220005101705
ban="EMPLOYEE MANAGEMENT"
if [ ! -n "$(dpkg -l | grep sysvbanner | awk -F ' ' '{print $2}')" ]; then
    sudo apt install sysvbanner
fi
banner $ban
if [ ! -f mydb ]; then
    touch mydb
fi

Login() {
    echo -e "\n\n\t1. Login"
    echo -e "\t2. Exit"
    echo -e "\tEnter choice: \c"
    read a
    case $a in
    1)
        clear
        banner $ban
        echo -e "\tUsername: \c"
        read user
        echo -e "\tPassword: \c"
        read -s pass
        if ((user == "Explorers" && pass == "2025")); then
            clear
            banner $ban
            Indroduction
        else
            clear
            banner $ban
            echo "Username or Password is not correct , please try again..."
            Login
        fi
        ;;
    2)
        clear
        exit 
        

        ;;
    *)
        clear
        banner $ban
        Login
        ;;
    esac
}
Indroduction() {
    echo -e "\t1. Display Employee Information"
    echo -e "\t2. Add New Employee"
    echo -e "\t3. Modify Employee Information"
    echo -e "\t4. Delete Employee Information"
    echo -e "\t5. Exit"
    echo -e "\tChoice: \c"
    read ch
    case $ch in
    1)
        clear
        banner $ban
        Show
        ;;
    2)
        clear
        banner $ban
        Insertion
        ;;
    3)
        clear
        banner $ban
        Modification
        ;;
    4)
        clear
        banner $ban
        Deletion
        ;;
    5)
        clear
        exit
        ;;

    *)
        clear
        banner $ban
        Indroduction
        ;;
    esac

}
Insertion() {
    printf "Please fill the following form: "
    printf "\nEmployee ID : "
    read eid
    printf "First Name : "
    read fname
    printf "Last Name : "
    read lname
    printf "Address : "
    read addr
    printf "Date Of Birth : "
    read dob
    printf "Sex : "
    read sex
    printf "Department : "
    read dept
    printf "Salary : "
    read sal
    printf "Designation : "
    read des
    printf "Joining Date : "
    read jdate
    data=$(echo -n -e "$eid\t$fname\t$lname\t$addr\t$dob\t$sex\t$dept\t$sal\t$des\t$jdate\n")
    echo $data >>mydb
    printf "\nRecord successfully added."
    printf "\nEnter any key to go back..."
    read a
    clear
    banner $ban
    Indroduction
}
header() {
    printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n"
    printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n"
    printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n"
}
Show() {
    echo -e "\t1. Display details of all employees"
    echo -e "\t2. Display details of employees of a particular department"
    echo -e "\t3. Display details of employees whose salary is between A & B"
    echo -e "\t4. Display details of all male employees"
    echo -e "\t5. Display details of all female employees"
    echo -e "\t6. Display details of all employees of a particular designation"
    echo -e "\t7. Display maximum salary offered to an employee with corresponding details"
    echo -e "\t8. Sort employee details in increasing order of salary"
    echo -e "\t9. Search employee by name"
    echo -e "\t10 Search Employee by ID"
    echo -e "\t11. Back"
    echo -e "\tChoice: \c"
    read ch
    case $ch in
    1)
        clear
        banner $ban
        acheki=$(wc mydb | awk -F ' ' '{print $1;}')
        (
            gacheki=$(wc mydb | awk -F ' ' '{print $1;}')
            if (($gacheki != 0)); then
                header
            fi
            awk '{print;}' mydb
        ) | column -t
        if (($acheki == 0)); then
            printf "\n\n\n\t\t\t\tNO RECORDS FOUND!\n\n\n"
        fi
        printf "\nEnter any key to go back..."
        read a
        clear
        banner $ban
        Show
        ;;
    2)
        clear
        banner $ban
        printf "Enter Department : "
        read des
        khojo=$(awk -v ds=$des '{if($7==ds)print;}' mydb | wc | awk -F ' ' '{print $1}')
        (
            cnt=$(awk -v ds=$des '{if($7==ds)print;}' mydb | wc | awk -F ' ' '{print $1}')
            if (($cnt != 0)); then
                header
            fi
            awk -v ds=$des '{if($7==ds)print;}' mydb
        ) | column -t
        if (($khojo == 0)); then
            printf "\n\n\n\t\t\t\tNO RECORDS FOUND!\n\n\n"
        fi
        printf "\nEnter any key to go back..."
        read a
        clear
        banner $ban
        Show
        ;;
    3)
        clear
        banner $ban
        printf "Start Salary : "
        read st
        printf "End Salary: "
        read end
        khoj=$(awk -v min=$st -v max=$end '{if($8>=min && $8<=max) print;}' mydb | wc | awk -F ' ' '{print $1}')
        (
            khojo=$(awk -v min=$st -v max=$end '{if($8>=min && $8<=max) print;}' mydb | wc | awk -F ' ' '{print $1}')
            if (($khojo != 0)); then
                header
            fi
            awk -v min=$st -v max=$end '{if($8>=min && $8<=max) print;}' mydb
        ) | column -t
        if (($khoj == 0)); then
            printf "\n\n\n\t\t\t\tNO RECORDS FOUND WITH THIS SALARY RANGE!\n\n\n"
        fi
        printf "\nEnter any key to go back..."
        read a
        clear
        banner $ban
        Show
        ;;
    4)
        clear
        banner $ban
        khojo=$(awk '{if($6=="Male")print;}' mydb | wc | awk -F ' ' '{print $1}')
        (
            cnt=$(awk '{if($6=="Male")print;}' mydb | wc | awk -F ' ' '{print $1}')
            if (($cnt != 0)); then
                header
            fi
            awk '{if($6=="Male")print;}' mydb
        ) | column -t
        if (($khojo == 0)); then
            printf "\n\n\n\t\t\t\tNO RECORDS FOUND!\n\n\n"
        fi
        printf "\nEnter any key to go back..."
        read a
        clear
        banner $ban
        Show
        ;;
    5)
        clear
        banner $ban
        khojo=$(awk '{if($6=="Female")print;}' mydb | wc | awk -F ' ' '{print $1}')
        (
            cnt=$(awk '{if($6=="Female")print;}' mydb | wc | awk -F ' ' '{print $1}')
            if (($cnt != 0)); then
                header
            fi
            awk '{if($6=="Female")print;}' mydb
        ) | column -t
        if (($khojo == 0)); then
            printf "\n\n\n\t\t\t\tNO RECORDS FOUND!\n\n\n"
        fi
        printf "\nEnter any key to go back..."
        read a
        clear
        banner $ban
        Show
        ;;
    6)
        clear
        banner $ban
        printf "Enter Designition : "
        read des
        khojo=$(awk -v ds=$des '{if($9==ds)print;}' mydb | wc | awk -F ' ' '{print $1}')
        (
            cnt=$(awk -v ds=$des '{if($9==ds)print;}' mydb | wc | awk -F ' ' '{print $1}')
            if (($cnt != 0)); then
                header
            fi
            awk -v ds=$des '{if($9==ds)print;}' mydb
        ) | column -t
        if (($khojo == 0)); then
            printf "\n\n\n\t\t\t\tNO RECORDS FOUND!\n\n\n"
        fi
        printf "\nEnter any key to go back..."
        read a
        clear
        banner $ban
        Show
        ;;
    7)
        clear
        banner $ban
        acheki=$(wc mydb | awk -F ' ' '{print $1;}')
        (
            gacheki=$(wc mydb | awk -F ' ' '{print $1;}')
            if (($gacheki != 0)); then
                header
            fi
            max=$(sort -n -rk 8 mydb | head -1 | awk '{print $8}')
            awk -v koto=$max '{if($8==koto) print;}' mydb
        ) | column -t
        if (($acheki == 0)); then
            printf "\n\n\n\t\t\t\tNO RECORDS FOUND!\n\n\n"
        fi
        printf "\nEnter any key to go back..."
        read a
        clear
        banner $ban
        Show
        ;;
    8)
        clear
        banner $ban
        acheki=$(wc mydb | awk -F ' ' '{print $1;}')
        (
            gacheki=$(wc mydb | awk -F ' ' '{print $1;}')
            if (($gacheki != 0)); then
                header
            fi
            sort -n -k 8 mydb
        ) | column -t
        if (($acheki == 0)); then
            printf "\n\n\n\t\t\t\tNO RECORDS FOUND!\n\n\n"
        fi
        printf "\nEnter any key to go back..."
        read a
        clear
        banner $ban
        Show
        ;;
    9)
        clear
        banner $ban
        printf "Enter First Name : "
        read fname
        printf "Enter Last Name : "
        read lname

        khojo=$(awk -v fn=$fname -v ln=$lname '{if($2==fn && $3==ln)print;}' mydb | wc | awk -F ' ' '{print $1}')
        (
            cnt=$(awk -v fn=$fname -v ln=$lname '{if($2==fn && $3==ln)print;}' mydb | wc | awk -F ' ' '{print $1}')
            if (($cnt != 0)); then
                header
            fi
            awk -v fn=$fname -v ln=$lname '{if($2==fn && $3==ln)print;}' mydb
        ) | column -t
        if (($khojo == 0)); then
            printf "\n\n\n\t\t\t\tNO RECORDS FOUND!\n\n\n"
        fi
        printf "\nEnter any key to go back..."
        read a
        clear
        banner $ban
        Show
        ;;
    10)
        clear
        banner $ban
        printf "Enter Employee ID: "
        read empid

        # Check if the Employee ID exists in the file
        khojo=$(awk -v id=$empid '{if($1==id)print;}' mydb | wc | awk -F ' ' '{print $1}')
        
        # If record found, display employee details
        if (($khojo != 0)); then
            echo "Employee details:"
            header
            awk -v id=$empid '{if($1==id)print;}' mydb | column -t
        else
            echo -e "\n\n\n\t\t\t\tNO RECORD FOUND FOR EMPLOYEE ID: $empid\n\n\n"
        fi

        printf "\nEnter any key to go back..."
        read a
        clear
        banner $ban
        Show
        ;;

    11)
        clear
        banner $ban
        Indroduction
        ;;
    *)
        clear
        banner $ban
        Show
        ;;
    esac
}
Modification() {
    clear
    banner $ban
    printf "Enter Emp_ID of the employee whose record has to be modified : "
    read mod
    khojo=$(awk -v md=$mod '{if($1==md)print;}' mydb | wc | awk -F ' ' '{print $1}')
    if (($khojo == 0)); then
        printf "\n\n\n\t\t\t\tNO RECORDS FOUND TO MODIFY!\n\n\n"
    else
        printf "\nOld details : \n"
        (
            printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n"
            printf "1\t2\t3\t4\t5\t6\t7\t8\t9\t10\n"
            printf "Emp_ID\tFirst_Name\tLast_Name\tAddress\tDate_Of_Birth\tSex\tDepartment\tSalary\tDesignation\tJoining_Date\n"
            printf "\n-------------\t----------\t---------\t-------\t-------------\t---\t----------\t------\t-----------\t------------\n"
            awk -v md=$mod '{if($1==md)print;}' mydb
        ) | column -t
        printf "\nWhich field do you want to modify? Enter the field number: "
        read field
        printf "\nEnter new detail : "
        read nw
        awk -v f=$field -v m=$mod -v dibo=$nw '{if($1==m) $f=dibo;print;}' mydb >tmp && mv tmp mydb
        printf "\nRecord successfully modified."
        printf "\nUpdated details : \n"

        (
            header
            awk -v md=$mod '{if($1==md)print;}' mydb
        ) | column -t
    fi
    printf "\nEnter any key to go back..."
    read a
    clear
    banner $ban
    Indroduction
}
Deletion() {
   
    printf "\nEnter Emp_ID which you want to delete: "
    read emp
    # Check if the employee ID exists
    khojo=$(awk -v em=$emp '{if($1==em)print;}' mydb)
    
    if [[ -z "$khojo" ]]; then
        # If no record found, print error
        printf "\n\n\n\t\t\t\tNO RECORDS FOUND TO DELETE!\n\n\n"
    else
        # If record found, delete it
        sed -i "/^$emp\s/d" mydb
        printf "\nRecord deleted successfully.\n"
    fi
    
    printf "\nEnter any key to go back..."
    read a
    clear
    banner $ban
    Indroduction

SearchByID() {
    clear
    banner $ban
    printf "Enter Employee ID: "
    read empid
    result=$(awk -v id=$empid '{if($1==id)print;}' mydb)
    
    if [[ -z "$result" ]]; then
        printf "\nNo record found for Employee ID: $empid\n"
    else
        echo -e "\nEmployee details for ID $empid:"
        header
        echo "$result" | column -t
    fi

    printf "\nPress any key to go back..."
    read a
    clear
    banner $ban
    Indroduction
}

}



Login
