package controllers

import (
	"encoding/json"
	"fmt"
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

//GetHospitalByName returns a hospital in the database with the specified name (READ)
func GetHospitalByName(w http.ResponseWriter, r *http.Request) {
	hospitalName := mux.Vars(r)["name"];
	var hospitals []entities.Hospital;
	hospitalName = fmt.Sprintf("%%%s%%", hospitalName);
	database.Instance.Where("name LIKE ?", hospitalName).Find(&hospitals);
	if len(hospitals) == 0 {
		json.NewEncoder(w).Encode("No Hospital Found!");
		return
	}
	w.Header().Set("Content-Type", "application/json");
	json.NewEncoder(w).Encode(hospitals);
}

//GetHospitalByCountry returns a hospital in the database with the specified country (READ)
func GetHospitalByCountry(w http.ResponseWriter, r *http.Request) {
	hospitalCountry := mux.Vars(r)["country"];
	var hospitals []entities.Hospital;
	hospitalCountry = fmt.Sprintf("%s%%", hospitalCountry);
	database.Instance.Where("country LIKE ?", hospitalCountry).Find(&hospitals);
	if len(hospitals) == 0 {
		json.NewEncoder(w).Encode("No Hospital Found!");
		return
	}
	w.Header().Set("Content-Type", "application/json");
	json.NewEncoder(w).Encode(hospitals);
}

//GetHospitalByService returns a hospital in the database with the specified service (READ)
func GetHospitalByService(w http.ResponseWriter, r *http.Request) {
	hospitalService := mux.Vars(r)["service"];
	var hospitals []entities.Hospital;
	hospitalService = fmt.Sprintf("%%%s%%", hospitalService);
	database.Instance.Where("services LIKE ?", hospitalService).Find(&hospitals);
	if len(hospitals) == 0 {
		json.NewEncoder(w).Encode("No Hospital Found!");
		return
	}
	w.Header().Set("Content-Type", "application/json");
	json.NewEncoder(w).Encode(hospitals);
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