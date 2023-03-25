package database

import (
	"golang-crud-rest-api/entities"
	"log"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

//Instance of the database
var Instance *gorm.DB;
//Error if connection to database fails
var err error;

//Connect attempts to connect to the database via GORM helpers
func Connect(connectionString string) {
	Instance, err = gorm.Open(mysql.Open(connectionString), &gorm.Config{});
	if err != nil {
		log.Fatal(err);
		panic("Cannot connect to DB");
	}
	log.Println("Connected to Database...");
}

//AutoMigrate attempts to create a table (based) on the struct in the database
func Migrate(){	
	Instance.AutoMigrate(&entities.Hospital{});
	log.Println("Database Migration Completed...");
}