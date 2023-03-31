package utils

import (
	"errors"
	"golang-crud-rest-api/database"
	"golang-crud-rest-api/entities"

	emailverifier "github.com/AfterShip/email-verifier"
)


var (
	verifier = emailverifier.NewVerifier();
)

func EmailIsValid(email string) (bool, error) {
	ret, err := verifier.Verify(email);
	switch {
		case !ret.Syntax.Valid : return false, errors.New("email address does not exist");
		case err == nil : return true, nil;
		default : return false, errors.New("verify email address failed, please try again");
	}
}

func EmailAlreadyExists(hospitalEmail string) bool {
	var hospital entities.Hospital;
	database.Instance.First(&hospital, hospitalEmail);
	return hospital.ID == 0;
}

func IsAuthorized(email string) bool {
	var admin entities.Admin;
	database.Instance.First(&admin, email);
	return admin.ID != 0;
}
