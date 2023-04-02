package main

import (
	"golang-crud-rest-api/controllers"
	"github.com/gorilla/mux"
)

func HospitalRoutes(router *mux.Router) {
	router.HandleFunc("/api/v1/hospitals", controllers.GetAllHospitals).Methods("GET");
	router.HandleFunc("/api/v1/hospitals/{id}", controllers.GetHospitalById).Methods("GET");
	router.HandleFunc("/api/v1/hospitals/names/{name}", controllers.GetHospitalByName).Methods("GET");
	router.HandleFunc("/api/v1/hospitals/countries/{country}", controllers.GetHospitalByCountry).Methods("GET");
	router.HandleFunc("/api/v1/hospitals/services/{service}", controllers.GetHospitalByService).Methods("GET");
	router.HandleFunc("/api/v1/hospitals/new", controllers.AddHospital).Methods("POST");
	router.HandleFunc("/api/v1/hospitals/{id}", controllers.UpdateHospital).Methods("PUT");
	router.HandleFunc("/api/v1/hospitals/delete/{id}", controllers.DeleteHospital).Methods("DELETE");
}