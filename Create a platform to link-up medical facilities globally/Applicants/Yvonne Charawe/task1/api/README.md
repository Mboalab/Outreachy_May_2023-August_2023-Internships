# Global Hospitals Api


##### Project Description
This is a REST API application for global hospitals with complete CRUD implementation


> HOST: https://global-hospitals.onrender.com

> To access a route add it to the end of the host then go to the link.

> Example: To get all hospitals:
https://global-hospitals.onrender.com/api/v1/hospitals
##

| Method | Route | Purpose |
| ---- | ----- | ------- |
| GET | /api/v1/hospitals | returns a list of all hospitals |
| GET | /api/v1/hospitals/{id} | returns a hospital with the specified id(replace `{id}` with id number |
| GET | /api/v1/hospitals/names/{name} | returns a hospital/list of hospitals that contain the name specified |
| GET | /api/v1/hospitals/countries/{country} | returns a hospital/list of hospitals whose countries start with letter/letters specified |
| GET | /api/v1/hospitals/services/{service} | returns a list of hospitals that offer the service specified |
| POST | /api/v1/hospitals/new | adds a new hospital to the database |
| PUT | /api/v1/hospitals/{id} | updates an existing hospital in the database |
| DELETE | /api/v1/hospitals/delete/{id} | deletes an existing hospital from the database |
---

## Author
- Yvonne C.W. : [Github](github.com/Charawey-X)
---

## Requirements
- `ubuntu` or any Operating System with `Go`

## Setup Instructions
- After cloning the project:

```
cd Create a platform to link-up medical facilities globally/Applicants/Yvonne Charawe/task1/api

go build .

go run .
```

# Technologies Used

- Go (golang)
- Gorilla(mux)   _for routing_
- mysql          _database_
- GORM           _ORM to access the database_
- Viper          _for loading configurations_
- Rest Client    _for testing endpoints_
- Render	 _for hosting_



## Contact Information

<a href="mailto:charawey@gmail.com">charawey@gmail.com</a>



© Charawey-X
