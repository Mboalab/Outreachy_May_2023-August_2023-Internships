package main

import (
	"log"
	"github.com/spf13/viper"
)

//Config contains Port and ConnectionString for configuring connection to database.
// The mapstructure tags specify the name of each config field. 
// In order to get the value of the variables and store them in this struct, we need to use the unmarshaling feature of Viper.
// The mapstructure package works under the hood 
// to decode generic map values from some data stream (JSON, Gob, etc.) to structures
type Config struct {
	Port string `mapstructure:"port"`
	ConnectionString string `mapstructure:"connection string"`
}

//AppConfig is a pointer to the Config struct and is therefore, an instance of the Config struct
var AppConfig *Config;

//LoadAppConfig loads configurations from the config.json file  and assign its values to Config through the AppConfig pointer. 
func LoadAppConfig() {
	log.Println("Loading Server Configurations...");
	// Tells Viper the location of the config file.
	viper.AddConfigPath(".");
	// Tells Viper the name of the config file to look for.
	viper.SetConfigName("config");
	// Tells Viper the type of config file.
	viper.SetConfigType("json");
	err := viper.ReadInConfig();
	if err != nil {
		log.Fatal(err);
	}
	err = viper.Unmarshal(&AppConfig);
	if err != nil {
		log.Fatal(err);
	}
}