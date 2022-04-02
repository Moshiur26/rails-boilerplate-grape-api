**Admin API's**
----

#### *BASE_URL = "http://localhost:3000"*

* **URL**: `{BASE_URL}/api/v1/login/`

* **Method:** `POST`

* **Headers:**
   ``
* **Params:**
```
params do
    requires :username, type: String
    requires :password, type: String
end
```

* **Success Response:**
* **Code:** `200`
    * **Content:**

```json
{
  "success": true,
  "status_code": 200,
  "message": "Successfully logged in.",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsImV4cCI6MTY4MDQxOTY0NX0.RZDUtXkZluctxKFy4WHxPuaUHQ_H5xymXd0JrJxyBeo",
    "name": "Moshiur Rahman",
    "phone": "01725460361",
    "username": "moshiur@misfit.tech"
  }
}
```


* ** Error Response:**
* **Code:** `200`
    * **If username or password not matched then:**
    * **Content:**
```json
{
  "success": false,
  "status_code": 403,
  "message": "Invalid username or password",
  "data": {}
}
```
