package entities

//Hospital is a model containing the properties for hospitals 
type Hospital struct {
	ID uint64 `json:"id"`
	Email string `json:"email"`
	Name string `json:"name"`
	Country string `json:"country"`
	Region string `json:"region"`
	OperatingHours string `json:"operatingHours"`
	PhoneNumber string `json:"phoneNumber"`
	Services string `json:"services"`
	Website string `json:"website"`
}