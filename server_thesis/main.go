package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	l "server_thesis/logic"
	s "server_thesis/structure"

	_ "github.com/go-sql-driver/mysql"
)

func HandleResquest() {
	http.HandleFunc("/getUserInfo", getUser)
	http.HandleFunc("/register", register)

	fmt.Println("Server start listening on port :8080")
	http.ListenAndServe(":8080", nil)

}
func register(w http.ResponseWriter, r *http.Request) {
	var userData map[string]interface{}
	w.Header().Set("Content-Type", "application/json")
	json.NewDecoder(r.Body).Decode(&userData)
	fmt.Println(userData)
	Err, resp := l.RegisterUser(userData)

	registerResp := s.ResponseRegister{
		Resp:  resp,
		Error: Err,
	}
	fmt.Println(registerResp)

	json.NewEncoder(w).Encode(registerResp)
}
func getUser(w http.ResponseWriter, r *http.Request) {
	var userData map[string]interface{}
	w.Header().Set("Content-Type", "application/json")
	json.NewDecoder(r.Body).Decode(&userData)

	data, resp := l.GetUserInfo(userData)
	resData := s.ResponseUser{
		UserData: data,
		Response: resp,
	}
	fmt.Println(resData)
	json.NewEncoder(w).Encode(resData)

}

func main() {
	HandleResquest()

	//db, _ := sql.Open("mysql", "root:root@tcp(localhost:3306)/koura") // s.SqlSettings)
	// if err != nil {
	// 	fmt.Println("error============>", err)
	// }

	// defer db.Close()
	// fmt.Println(db.Stats())

	// result, err := db.Query("SELECT * FROM jufe.users")
	// if err != nil {
	// 	fmt.Println("error============>", err)
	// }
	//fmt.Println(l.OptionExist("studentID", "12304"))

}
