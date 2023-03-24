package main

import (
	"log"
	"github.com/spf13/viper"
)

//Config contains Port and ConnectionString for configuring connection to database
type Config struct {
	Port string `json:"port"`
	ConnectionString string `json:"connection string"`
}

//AppConfig is a pointer to the Config struct
var AppConfig *Config;

//LoadAppConfig loads configurations from the config.json file  and assign its values to Config through the AppConfig pointer. 
func LoadAppConfig() {
	log.Println("Loading Server Configurations...")
	viper.AddConfigPath(".")
	viper.SetConfigName("config")
	viper.SetConfigType("json")
	err := viper.ReadInConfig()
	if err != nil {
		log.Fatal(err)
	}
	err = viper.Unmarshal(&AppConfig)
	if err != nil {
		log.Fatal(err)
	}
}