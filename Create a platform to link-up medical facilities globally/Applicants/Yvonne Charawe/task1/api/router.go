package main

import (
	"golang-crud-rest-api/controllers"
	"github.com/gorilla/mux"
)

func HospitalRoutes(router *mux.Router) {
	router.HandleFunc("/api/hospitals", controllers.GetAllHospitals).Methods("GET");
	router.HandleFunc("/api/hospitals/{id}", controllers.GetHospitalById).Methods("GET");
	router.HandleFunc("/api/hospitals/new", controllers.AddHospital).Methods("POST");
	router.HandleFunc("/api/hospitals/{id}", controllers.UpdateHospital).Methods("PUT");
	router.HandleFunc("/api/hospitals/delete/{id}", controllers.DeleteHospital).Methods("DELETE");
}