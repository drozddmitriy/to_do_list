

# Group Authentications


## Authentications [/api/v1/authentications]


### Login user [POST /api/v1/authentications]


+ Request login user
**POST**&nbsp;&nbsp;`/api/v1/authentications`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=Kelvin&password=password

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODE2OTQwMDJ9.7pqx1s2GXMziAVIgtM3EbiarJ17bNZYyeW-U2iLH6ss",
              "exp": "2020-02-14T15:26:42.443Z",
              "username": "Kelvin"
            }

+ Request do not register user
**POST**&nbsp;&nbsp;`/api/v1/authentications`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=Fahrenheit&password=

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid password"
            }

### Logout user [DELETE /api/v1/authentications]


+ Request logout user
**DELETE**&nbsp;&nbsp;`/api/v1/authentications`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 204

# Group Comments


## Comments [api/v1/comments]


### Get comments [GET /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `1` (number, required)

+ Request is expected to eq 3
**GET**&nbsp;&nbsp;`/api/v1/tasks/1/comments`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "text": "Incidunt sunt et vel possimus.",
                "file": {
                  "url": null
                },
                "task_id": 1,
                "created_at": "2020-02-13T15:26:42.491Z",
                "updated_at": "2020-02-13T15:26:42.491Z"
              },
              {
                "id": 2,
                "text": "Et iure dolor libero omnis odio.",
                "file": {
                  "url": null
                },
                "task_id": 1,
                "created_at": "2020-02-13T15:26:42.493Z",
                "updated_at": "2020-02-13T15:26:42.493Z"
              },
              {
                "id": 3,
                "text": "Odit ut quia atque iste perspiciatis.",
                "file": {
                  "url": null
                },
                "task_id": 1,
                "created_at": "2020-02-13T15:26:42.495Z",
                "updated_at": "2020-02-13T15:26:42.495Z"
              }
            ]

+ Request is expected to match json schema "comments"
**GET**&nbsp;&nbsp;`/api/v1/tasks/2/comments`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 4,
                "text": "Quasi excepturi culpa dolor aut quia maiores.",
                "file": {
                  "url": null
                },
                "task_id": 2,
                "created_at": "2020-02-13T15:26:42.517Z",
                "updated_at": "2020-02-13T15:26:42.517Z"
              },
              {
                "id": 5,
                "text": "Aut totam accusantium doloremque et omnis reiciendis.",
                "file": {
                  "url": null
                },
                "task_id": 2,
                "created_at": "2020-02-13T15:26:42.519Z",
                "updated_at": "2020-02-13T15:26:42.519Z"
              },
              {
                "id": 6,
                "text": "Commodi id eveniet quae natus nisi sunt dolores saepe.",
                "file": {
                  "url": null
                },
                "task_id": 2,
                "created_at": "2020-02-13T15:26:42.520Z",
                "updated_at": "2020-02-13T15:26:42.520Z"
              }
            ]

+ Request is expected to respond with a not_found status code (404)
**GET**&nbsp;&nbsp;`/api/v1/tasks/0/comments`

    + Headers

            Accept: application/json

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Couldn't find Task with 'id'=0"
            }

### Create a comment [POST /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `4` (number, required)

+ Request is expected to respond with status code :created (201)
**POST**&nbsp;&nbsp;`/api/v1/tasks/4/comments`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            text=Ab+voluptatem+nisi+qui+officia+perferendis+qui+earum+architecto.

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 13,
              "text": "Ab voluptatem nisi qui officia perferendis qui earum architecto.",
              "file": {
                "url": null
              },
              "task_id": 4,
              "created_at": "2020-02-13T15:26:42.569Z",
              "updated_at": "2020-02-13T15:26:42.569Z"
            }

+ Request is expected to match json schema "comment"
**POST**&nbsp;&nbsp;`/api/v1/tasks/5/comments`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            text=Dolorem+autem+veritatis+laborum+et.

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 17,
              "text": "Dolorem autem veritatis laborum et.",
              "file": {
                "url": null
              },
              "task_id": 5,
              "created_at": "2020-02-13T15:26:42.589Z",
              "updated_at": "2020-02-13T15:26:42.589Z"
            }

+ Request is expected to respond with status code :unprocessable_entity (422)
**POST**&nbsp;&nbsp;`/api/v1/tasks/6/comments`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            text

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "text": [
                "can't be blank"
              ]
            }

### Delete a comment [DELETE /api/v1/comments/{id}]

+ Parameters
    + id: `21` (number, required)

+ Request is expected to respond with status code :no_content (204)
**DELETE**&nbsp;&nbsp;`/api/v1/comments/21`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request is expected to respond with a not_found status code (404)
**DELETE**&nbsp;&nbsp;`/api/v1/comments/0`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Couldn't find Comment with 'id'=0"
            }

# Group Projects


## Projects [api/v1/projects]


### Create a project [POST /api/v1/projects]


+ Request is expected to match json schema "project"
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=Project+12

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 12,
              "name": "Project 12",
              "created_at": "2020-02-13T15:26:42.692Z",
              "updated_at": "2020-02-13T15:26:42.692Z",
              "user_id": 12
            }

+ Request is expected to respond with status code :unprocessable_entity (422)
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "name": [
                "can't be blank"
              ]
            }

### Edit a project [PUT /api/v1/projects/{id}]

+ Parameters
    + id: `19` (number, required)

+ Request is expected to include "Test_name"
**PUT**&nbsp;&nbsp;`/api/v1/projects/19`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=Test_name

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 19,
              "user_id": 14,
              "name": "Test_name",
              "created_at": "2020-02-13T15:26:42.723Z",
              "updated_at": "2020-02-13T15:26:42.729Z"
            }

+ Request is expected to match json schema "project"
**PUT**&nbsp;&nbsp;`/api/v1/projects/23`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=Test_name

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 23,
              "user_id": 15,
              "name": "Test_name",
              "created_at": "2020-02-13T15:26:42.739Z",
              "updated_at": "2020-02-13T15:26:42.744Z"
            }

+ Request is expected to respond with status code :unprocessable_entity (422)
**PUT**&nbsp;&nbsp;`/api/v1/projects/27`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "name": [
                "can't be blank"
              ]
            }

### Get a project [GET /api/v1/projects/{id}]

+ Parameters
    + id: `31` (number, required)

+ Request is expected to match json schema "project"
**GET**&nbsp;&nbsp;`/api/v1/projects/31?name=Project 32`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 31,
              "name": "Project 31",
              "created_at": "2020-02-13T15:26:42.774Z",
              "updated_at": "2020-02-13T15:26:42.774Z",
              "user_id": 17
            }

+ Request is expected to respond with a not_found status code (404)
**GET**&nbsp;&nbsp;`/api/v1/projects/0`

    + Headers

            Accept: application/json

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Couldn't find Project with 'id'=0"
            }

### Delete a project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `35` (number, required)

+ Request is expected to respond with status code :no_content (204)
**DELETE**&nbsp;&nbsp;`/api/v1/projects/35`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request is expected to respond with a not_found status code (404)
**DELETE**&nbsp;&nbsp;`/api/v1/comments/0`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Couldn't find Comment with 'id'=0"
            }

# Group Tasks


## Tasks [api/v1/tasks]


### Get tasks [GET /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `41` (number, required)

+ Request is expected to eq 3
**GET**&nbsp;&nbsp;`/api/v1/projects/41/tasks`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 9,
                "name": "dolore",
                "project_id": 41,
                "created_at": "2020-02-13T15:26:42.827Z",
                "updated_at": "2020-02-13T15:26:42.827Z",
                "complete": false,
                "position": 1,
                "deadline": null
              },
              {
                "id": 10,
                "name": "omnis",
                "project_id": 41,
                "created_at": "2020-02-13T15:26:42.829Z",
                "updated_at": "2020-02-13T15:26:42.829Z",
                "complete": false,
                "position": 2,
                "deadline": null
              },
              {
                "id": 11,
                "name": "et",
                "project_id": 41,
                "created_at": "2020-02-13T15:26:42.831Z",
                "updated_at": "2020-02-13T15:26:42.831Z",
                "complete": false,
                "position": 3,
                "deadline": null
              }
            ]

+ Request is expected to match json schema "tasks"
**GET**&nbsp;&nbsp;`/api/v1/projects/42/tasks`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 12,
                "name": "aut",
                "project_id": 42,
                "created_at": "2020-02-13T15:26:42.846Z",
                "updated_at": "2020-02-13T15:26:42.846Z",
                "complete": false,
                "position": 1,
                "deadline": null
              },
              {
                "id": 13,
                "name": "perferendis",
                "project_id": 42,
                "created_at": "2020-02-13T15:26:42.847Z",
                "updated_at": "2020-02-13T15:26:42.847Z",
                "complete": false,
                "position": 2,
                "deadline": null
              },
              {
                "id": 14,
                "name": "ullam",
                "project_id": 42,
                "created_at": "2020-02-13T15:26:42.849Z",
                "updated_at": "2020-02-13T15:26:42.849Z",
                "complete": false,
                "position": 3,
                "deadline": null
              }
            ]

### Create a task [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `43` (number, required)

+ Request is expected to match json schema "task"
**POST**&nbsp;&nbsp;`/api/v1/projects/43/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=architecto&complete=false

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 18,
              "name": "architecto",
              "project_id": 43,
              "created_at": "2020-02-13T15:26:42.879Z",
              "updated_at": "2020-02-13T15:26:42.879Z",
              "complete": false,
              "position": 4,
              "deadline": null
            }

+ Request is expected to respond with status code :unprocessable_entity (422)
**POST**&nbsp;&nbsp;`/api/v1/projects/44/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "name": [
                "can't be blank"
              ]
            }

### Edit a task [PUT /api/v1/tasks/{id}]

+ Parameters
    + id: `25` (number, required)

+ Request is expected to include "Test_name"
**PUT**&nbsp;&nbsp;`/api/v1/tasks/25`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=Test_name

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 25,
              "project_id": 45,
              "name": "Test_name",
              "position": 4,
              "created_at": "2020-02-13T15:26:42.919Z",
              "updated_at": "2020-02-13T15:26:42.927Z",
              "complete": false,
              "deadline": null
            }

+ Request is expected to match json schema "task"
**PUT**&nbsp;&nbsp;`/api/v1/tasks/29`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=Test_name

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 29,
              "project_id": 46,
              "name": "Test_name",
              "position": 4,
              "created_at": "2020-02-13T15:26:42.943Z",
              "updated_at": "2020-02-13T15:26:42.952Z",
              "complete": false,
              "deadline": null
            }

+ Request is expected to respond with status code :unprocessable_entity (422)
**PUT**&nbsp;&nbsp;`/api/v1/tasks/33`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "name": [
                "can't be blank"
              ]
            }

### Get a task [GET /api/v1/tasks/{id}]

+ Parameters
    + id: `37` (number, required)

+ Request is expected to match json schema "task"
**GET**&nbsp;&nbsp;`/api/v1/tasks/37?complete=false&name=illo`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 37,
              "name": "exercitationem",
              "project_id": 48,
              "created_at": "2020-02-13T15:26:43.013Z",
              "updated_at": "2020-02-13T15:26:43.013Z",
              "complete": false,
              "position": 4,
              "deadline": null
            }

+ Request is expected to respond with a not_found status code (404)
**GET**&nbsp;&nbsp;`/api/v1/tasks/0`

    + Headers

            Accept: application/json

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Couldn't find Task with 'id'=0"
            }

### Delete a task [DELETE /api/v1/tasks/{id}]

+ Parameters
    + id: `41` (number, required)

+ Request is expected to respond with status code :no_content (204)
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/41`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request is expected to respond with a not_found status code (404)
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/0`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Couldn't find Task with 'id'=0"
            }

# Group Users


## Users [/api/v1/users]


### Create a user [POST /api/v1/users]


+ Request register new user
**POST**&nbsp;&nbsp;`/api/v1/users`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=Fahrenheit&password=password&password_confirmation=password

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 32,
              "username": "Fahrenheit",
              "password_digest": "$2a$04$k9FrsVD2yhfj1jtywaw00e6cSAkyQw6FEyQPwqnMv0VqmyZpTxUSq",
              "created_at": "2020-02-13T15:26:43.087Z",
              "updated_at": "2020-02-13T15:26:43.087Z"
            }
