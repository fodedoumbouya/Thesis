package logic

import (
	"database/sql"
	"fmt"
	s "server_thesis/structure"

	u "server_thesis/utils"

	_ "github.com/go-sql-driver/mysql"
)

func RegisterUser(userData map[string]interface{}) (bool, string) {
	db, _ := sql.Open("mysql", s.SqlSettings)
	defer db.Close()
	name := fmt.Sprintf("%s", userData["name"])
	email := fmt.Sprintf("%s", userData["email"])
	password := fmt.Sprintf("%s", userData["password"])
	studentID := fmt.Sprintf("%s", userData["studentID"])
	image := fmt.Sprintf("%s", userData["image"])

	if OptionExist("email", email) {
		return false, u.EmailExiste
	}
	if OptionExist("studentID", studentID) {
		return false, u.StudentIDExist

	}
	query := fmt.Sprintf("insert into jufe.users(name,email,studentID,password,image) values('%v','%v','%v','%v','%v')", name, email, studentID, password, image)
	_, err := db.Query(query)

	if err != nil {
		return false, u.Resquesterror
	}

	return true, u.RegisterSucess

}
func GetUserInfo(userData map[string]interface{}) (s.User, string) {
	// get access to the db
	db, _ := sql.Open("mysql", s.SqlSettings)
	defer db.Close()
	// create empty user and variable
	var (
		userEmpty s.User
		user      s.User
		ID        int
		name      string
		email     string
		password  string
		studentiD string
		image     string
	)

	// get our data from request post
	emailRequest := fmt.Sprintf("%s", userData["email"])
	passwordRequest := fmt.Sprintf("%s", userData["password"])

	//checking if E-mail exist
	fmt.Println("===================>", emailRequest)
	if !OptionExist("email", emailRequest) {
		return userEmpty, u.EmailError
	}
	sql := fmt.Sprintf("select * from jufe.users where email ='%v'", emailRequest)

	result, err := db.Query(sql)
	if err != nil {
		return userEmpty, u.Resquesterror
	}
	for result.Next() {
		result.Scan(&ID, &name, &email, &password, &studentiD, image)

		user = s.User{
			ID:        ID,
			Name:      name,
			Email:     email,
			Password:  password,
			StudentID: studentiD,
			Image:     image,
		}
	}
	if passwordRequest == user.Password {
		return user, u.LoginSucess
	} else {
		return userEmpty, u.PasswordError
	}

}

func OptionExist(option string, data string) bool {
	db, _ := sql.Open("mysql", s.SqlSettings)

	var checkOption string

	defer db.Close()
	query := fmt.Sprintf("select %v from jufe.users where %v = '%v'", option, option, data)

	fmt.Println(query)

	result, err := db.Query(query)

	for result.Next() {
		result.Scan(&checkOption)
	}
	if err != nil {
		fmt.Println("Error the run the Query ", err)
	}
	if len(checkOption) > 2 {
		return true
	} else {
		return false
	}

}
