package structure

var SqlSettings string = "root:root@tcp(localhost:3306)/jufe"

type User struct {
	ID        int    `json:"ID"`
	Name      string `json:"name"`
	Email     string `json:"email"`
	Password  string `json:"password"`
	StudentID string `json:"studentID"`
	Image     string `json:"image"`
}
type ResponseUser struct {
	UserData User
	Response string
}
type ResponseRegister struct {
	Resp  string `json:"Resp"`
	Error bool   `json:"Error"`
}
