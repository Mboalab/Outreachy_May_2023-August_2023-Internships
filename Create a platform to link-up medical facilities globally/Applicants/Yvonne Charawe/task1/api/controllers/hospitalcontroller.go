package controllers

import (
	"encoding/json"
	"golang-crud-rest-api/database"
	"golang-crud-rest-api/entities"
	"net/http"

	"github.com/gorilla/mux"
)

//AddHospital adds a hospital to the database (CREATE)
func AddHospital(w http.ResponseWriter, r *http.Request) {
	var hospital entities.Hospital;
	json.NewDecoder(r.Body).Decode(&hospital)
	database.Instance.Create(&hospital);
	w.Header().Set("Content-Type", "application/json");
	json.NewEncoder(w).Encode(hospital);
}


//checkIfHospitalExists returns true if a hospital with the specified id exists in the database
func checkIfHospitalExists(hospitalId string) bool {
	var hospital entities.Hospital;
	database.Instance.First(&hospital, hospitalId);
	return hospital.ID != 0;
}


//GetHospitalById returns a hospital in the database with the specified id (READ)
func GetHospitalById(w http.ResponseWriter, r *http.Request) {
	hospitalId := mux.Vars(r)["id"];
	if !checkIfHospitalExists(hospitalId) {
		json.NewEncoder(w).Encode("Hospital Not Found!");
		return
	}
	var hospital entities.Hospital;
	database.Instance.First(&hospital, hospitalId);
	w.Header().Set("Content-Type", "application/json");
	json.NewEncoder(w).Encode(hospital);
}


//GetAllHospitals returns all hospitals in the database (READ)

func GetAllHospitals(w http.ResponseWriter, r *http.Request) {
	var hospitals []entities.Hospital;
	database.Instance.Find(&hospitals);
	hospitalList := entities.HospitalList{Title:"Global list of Hospitals", Hospitals: hospitals};
	w.Header().Set("Content-Type", "application/json");
	w.WriteHeader(http.StatusOK); 
	json.NewEncoder(w).Encode(hospitalList);
}

//UpdateHospital updates a hospital in the database (UPDATE)
func UpdateHospital(w http.ResponseWriter, r *http.Request) {
	hospitalId := mux.Vars(r)["id"];
	if !checkIfHospitalExists(hospitalId) {
		json.NewEncoder(w).Encode("Hospital Not Found!");
		return
	}
	var hospital entities.Hospital;
	database.Instance.First(&hospital, hospitalId);
	json.NewDecoder(r.Body).Decode(&hospital);
	database.Instance.Save(&hospital);
	w.Header().Set("Content-Type", "application/json");
	json.NewEncoder(w).Encode(hospital);
}

//DeleteHospital deletes a hospital in the database (DELETE)
func DeleteHospital(w http.ResponseWriter, r *http.Request) {
	hospitalId := mux.Vars(r)["id"];
	if !checkIfHospitalExists(hospitalId) {
		json.NewEncoder(w).Encode("Hospital Not Found!");
		return
	}
	var hospital entities.Hospital;
	database.Instance.First(&hospital, hospitalId);
	database.Instance.Delete(&hospital);
	w.Header().Set("Content-Type", "application/json");
	json.NewEncoder(w).Encode("Hospital Deleted Successfully!");
}