package controllers

import (
	"encoding/json"
	"fmt"
	"golang-crud-rest-api/database"
	"golang-crud-rest-api/entities"
	"golang-crud-rest-api/utils"
	"net/http"

	"github.com/gorilla/mux"
)

//AddHospital adds a hospital to the database (CREATE)
func AddHospital(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*");
	var hospital entities.Hospital;
	json.NewDecoder(r.Body).Decode(&hospital);
	valid, err := utils.EmailIsValid(hospital.Email);
	if valid {
		if utils.EmailAlreadyExists(hospital.Email) || checkIfHospitalExistsByName(hospital.Name){
			json.NewEncoder(w).Encode("Hospital Already Exists!");
			return
		}
		database.Instance.Create(&hospital);
		w.Header().Set("Content-Type", "application/json");
		json.NewEncoder(w).Encode(hospital);
	}
	if err != nil {
		json.NewEncoder(w).Encode(err.Error());
	}
	
}


//checkIfHospitalExists returns true if a hospital with the specified id exists in the database
func checkIfHospitalExists(hospitalId string) bool {
	var hospital entities.Hospital;
	database.Instance.First(&hospital, hospitalId);
	return hospital.ID == 0;
}

//checkIfHospitalExistsByName returns true if a hospital with the specified name exists in the database
func checkIfHospitalExistsByName(hospitalName string) bool {
	var hospital entities.Hospital;
	database.Instance.First(&hospital, hospitalName);
	return hospital.ID == 0;
}

//GetHospitalById returns a hospital in the database with the specified id (READ)
func GetHospitalById(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*");
	hospitalId := mux.Vars(r)["id"];
	if checkIfHospitalExists(hospitalId) {
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
	w.Header().Set("Access-Control-Allow-Origin", "*");
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
	w.Header().Set("Access-Control-Allow-Origin", "*");
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
	w.Header().Set("Access-Control-Allow-Origin", "*");
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
	w.Header().Set("Access-Control-Allow-Origin", "*");
	var hospitals []entities.Hospital;
	database.Instance.Find(&hospitals);
	hospitalList := entities.HospitalList{Title:"Global list of Hospitals", Hospitals: hospitals};
	w.Header().Set("Content-Type", "application/json");
	w.WriteHeader(http.StatusOK); 
	json.NewEncoder(w).Encode(hospitalList);
}

//UpdateHospital updates a hospital in the database (UPDATE)
func UpdateHospital(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*");
	hospitalId := mux.Vars(r)["id"];
	if checkIfHospitalExists(hospitalId) {
		json.NewEncoder(w).Encode("Hospital Not Found!");
		return
	}
	var hospital entities.Hospital;
	database.Instance.First(&hospital, hospitalId);
	json.NewDecoder(r.Body).Decode(&hospital);
	valid, err := utils.EmailIsValid(hospital.Email);
	if valid {
		database.Instance.Save(&hospital);
		w.Header().Set("Content-Type", "application/json");
		json.NewEncoder(w).Encode(hospital);
	}
	if err != nil {
		json.NewEncoder(w).Encode(err.Error());
	}
	
}

//DeleteHospital deletes a hospital in the database (DELETE)
func DeleteHospital(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*");
	hospitalId := mux.Vars(r)["id"];
	if checkIfHospitalExists(hospitalId) {
		json.NewEncoder(w).Encode("Hospital Not Found!");
		return
	}
	var hospital entities.Hospital;
	database.Instance.First(&hospital, hospitalId);
	if !utils.IsAuthorized(hospital.Email) {
		json.NewEncoder(w).Encode("Unauthorized!");
		return
	}
	database.Instance.Delete(&hospital);
	w.Header().Set("Content-Type", "application/json");
	json.NewEncoder(w).Encode("Hospital Deleted Successfully!");
}
