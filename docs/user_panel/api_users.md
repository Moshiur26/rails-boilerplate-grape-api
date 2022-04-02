**User API's**
----

#### *BASE_URL = "http://localhost:3000/user_panel"*

### User Login api

* **URL**: `{BASE_URL}/api/v1/login/`
* **Method:** `POST`
* **Headers:** `None`
* **URL Params:**
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
    "token": "eyJhbGciOiJIUzI1NiJ9.IiQyYSQxMiRIc1F5azJIelhmWWtXNS5MWmJvdmR1aEtDaXZXSXN2bUNTVGt4d2pKZm9QNFhWVXU1Vm0xcSI.4zKF5OyoJakNgW5ECSs4aeXUYuRg9LcR7ndwlzYCuXA",
    "name": "Moshiur Rahman",
    "phone": "01725470360",
    "username": "moshiur@gmail.com"
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

### User Logout api

* **URL**: `{BASE_URL}/api/v1/logout/`
* **Method:** `DELETE`
* **Headers:** `Authorization: token`
* **Authorization:** `User Authentication`
* **URL Params:** `None`

* **Success Response:**
* **Code:** `200`
  * **Content:**

```json
{
  "success": true,
  "status": 200,
  "message": "Successfully logout"
}
```


* ** Error Response:**
* **Code:** `200`
  * **If If Logout Failed Then:**
  * **Content:**
```json
{
  "success": false,
  "status_code": 406,
  "message": "User logout failed",
  "data": {}
}
```

* **If If Internal Server Error Then:**
  * **Content:**
```json
{
  "success": false,
  "status_code": 500,
  "message": "User logout failed",
  "data": {}
}
```

