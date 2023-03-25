package entities

type Admin struct {
	ID uint64 `json:"id"`
	Email string `json:"email"`
	Name string `json:"name"`
}