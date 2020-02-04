

# Group Authentications


## Users [/api/v1/authentications]


###  [POST /api/v1/authentications]


+ Request login user
**POST**&nbsp;&nbsp;`/api/v1/authentications`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=Celsius&password=password

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODA5MDk0NDJ9.GKuGz1qDEciT2OT83t7OPHKIOy6R60y3ziSbv_4Mq6s",
              "exp": "2020-02-05T13:30:42.649Z",
              "username": "Celsius"
            }

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

+ Request is expected to respond with status code :ok (200)
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
                "text": "Voluptatem velit expedita velit qui.",
                "file": {
                  "url": null
                },
                "task_id": 1,
                "created_at": "2020-02-04T13:30:42.707Z",
                "updated_at": "2020-02-04T13:30:42.707Z"
              },
              {
                "id": 2,
                "text": "Sapiente inventore eos nulla quasi.",
                "file": {
                  "url": null
                },
                "task_id": 1,
                "created_at": "2020-02-04T13:30:42.709Z",
                "updated_at": "2020-02-04T13:30:42.709Z"
              },
              {
                "id": 3,
                "text": "Ea quibusdam fuga eum deleniti iusto.",
                "file": {
                  "url": null
                },
                "task_id": 1,
                "created_at": "2020-02-04T13:30:42.712Z",
                "updated_at": "2020-02-04T13:30:42.712Z"
              }
            ]

+ Request is expected to eq 3
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
                "text": "Qui laudantium sunt ut sint quibusdam.",
                "file": {
                  "url": null
                },
                "task_id": 2,
                "created_at": "2020-02-04T13:30:42.739Z",
                "updated_at": "2020-02-04T13:30:42.739Z"
              },
              {
                "id": 5,
                "text": "Sunt quaerat quisquam repudiandae earum labore nobis et et.",
                "file": {
                  "url": null
                },
                "task_id": 2,
                "created_at": "2020-02-04T13:30:42.741Z",
                "updated_at": "2020-02-04T13:30:42.741Z"
              },
              {
                "id": 6,
                "text": "Beatae in esse et enim aut sed.",
                "file": {
                  "url": null
                },
                "task_id": 2,
                "created_at": "2020-02-04T13:30:42.743Z",
                "updated_at": "2020-02-04T13:30:42.743Z"
              }
            ]

+ Request is expected to match json schema "comments"
**GET**&nbsp;&nbsp;`/api/v1/tasks/3/comments`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 7,
                "text": "Aut culpa sit unde neque delectus sint dolorem numquam.",
                "file": {
                  "url": null
                },
                "task_id": 3,
                "created_at": "2020-02-04T13:30:42.765Z",
                "updated_at": "2020-02-04T13:30:42.765Z"
              },
              {
                "id": 8,
                "text": "Et enim vel saepe doloremque unde corporis laboriosam quos.",
                "file": {
                  "url": null
                },
                "task_id": 3,
                "created_at": "2020-02-04T13:30:42.767Z",
                "updated_at": "2020-02-04T13:30:42.767Z"
              },
              {
                "id": 9,
                "text": "Pariatur natus perspiciatis magnam ut eligendi sed.",
                "file": {
                  "url": null
                },
                "task_id": 3,
                "created_at": "2020-02-04T13:30:42.769Z",
                "updated_at": "2020-02-04T13:30:42.769Z"
              }
            ]

### Create a comment [POST /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `4` (number, required)

+ Request is expected to respond with status code :created (201)
**POST**&nbsp;&nbsp;`/api/v1/tasks/4/comments`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            text=Fugit+quibusdam+rerum+occaecati+facilis+voluptates+qui+voluptas+tenetur.

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 13,
              "text": "Fugit quibusdam rerum occaecati facilis voluptates qui voluptas tenetur.",
              "file": {
                "url": null
              },
              "task_id": 4,
              "created_at": "2020-02-04T13:30:42.813Z",
              "updated_at": "2020-02-04T13:30:42.813Z"
            }

+ Request is expected to match json schema "comment"
**POST**&nbsp;&nbsp;`/api/v1/tasks/5/comments`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            text=Neque+magnam+ducimus+nihil+est.

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 17,
              "text": "Neque magnam ducimus nihil est.",
              "file": {
                "url": null
              },
              "task_id": 5,
              "created_at": "2020-02-04T13:30:42.842Z",
              "updated_at": "2020-02-04T13:30:42.842Z"
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


### Get projects [GET /api/v1/projects]


+ Request get projects
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 11,
                "name": "Project 11",
                "created_at": "2020-02-04T13:30:42.939Z",
                "updated_at": "2020-02-04T13:30:42.939Z",
                "user_id": 11
              },
              {
                "id": 10,
                "name": "Project 10",
                "created_at": "2020-02-04T13:30:42.938Z",
                "updated_at": "2020-02-04T13:30:42.938Z",
                "user_id": 11
              },
              {
                "id": 9,
                "name": "Project 9",
                "created_at": "2020-02-04T13:30:42.936Z",
                "updated_at": "2020-02-04T13:30:42.936Z",
                "user_id": 11
              }
            ]

### Create a project [POST /api/v1/projects]


+ Request is expected to match json schema "project"
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=Project+15

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 15,
              "name": "Project 15",
              "created_at": "2020-02-04T13:30:43.003Z",
              "updated_at": "2020-02-04T13:30:43.003Z",
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
    + id: `22` (number, required)

+ Request is expected to match json schema "project"
**PUT**&nbsp;&nbsp;`/api/v1/projects/22`

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
              "id": 22,
              "user_id": 14,
              "name": "Test_name",
              "created_at": "2020-02-04T13:30:43.044Z",
              "updated_at": "2020-02-04T13:30:43.052Z"
            }

+ Request is expected to respond with status code :unprocessable_entity (422)
**PUT**&nbsp;&nbsp;`/api/v1/projects/26`

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
    + id: `30` (number, required)

+ Request is expected to match json schema "project"
**GET**&nbsp;&nbsp;`/api/v1/projects/30?name=Project 31`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 30,
              "name": "Project 30",
              "created_at": "2020-02-04T13:30:43.094Z",
              "updated_at": "2020-02-04T13:30:43.094Z",
              "user_id": 16
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
    + id: `34` (number, required)

+ Request is expected to respond with status code :no_content (204)
**DELETE**&nbsp;&nbsp;`/api/v1/projects/34`

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
    + project_id: `40` (number, required)

+ Request is expected to match json schema "tasks"
**GET**&nbsp;&nbsp;`/api/v1/projects/40/tasks`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 9,
                "name": "amet",
                "project_id": 40,
                "created_at": "2020-02-04T13:30:43.168Z",
                "updated_at": "2020-02-04T13:30:43.168Z",
                "complete": false,
                "position": 1,
                "deadline": null
              },
              {
                "id": 10,
                "name": "exercitationem",
                "project_id": 40,
                "created_at": "2020-02-04T13:30:43.171Z",
                "updated_at": "2020-02-04T13:30:43.171Z",
                "complete": false,
                "position": 2,
                "deadline": null
              },
              {
                "id": 11,
                "name": "autem",
                "project_id": 40,
                "created_at": "2020-02-04T13:30:43.174Z",
                "updated_at": "2020-02-04T13:30:43.174Z",
                "complete": false,
                "position": 3,
                "deadline": null
              }
            ]

### Create a task [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `41` (number, required)

+ Request is expected to match json schema "task"
**POST**&nbsp;&nbsp;`/api/v1/projects/41/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=sed&complete=false

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 15,
              "name": "sed",
              "project_id": 41,
              "created_at": "2020-02-04T13:30:43.219Z",
              "updated_at": "2020-02-04T13:30:43.219Z",
              "complete": false,
              "position": 4,
              "deadline": null
            }

+ Request is expected to respond with status code :unprocessable_entity (422)
**POST**&nbsp;&nbsp;`/api/v1/projects/42/tasks`

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
    + id: `22` (number, required)

+ Request is expected to match json schema "task"
**PUT**&nbsp;&nbsp;`/api/v1/tasks/22`

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
              "id": 22,
              "project_id": 43,
              "name": "Test_name",
              "position": 4,
              "created_at": "2020-02-04T13:30:43.273Z",
              "updated_at": "2020-02-04T13:30:43.282Z",
              "complete": false,
              "deadline": null
            }

+ Request is expected to respond with status code :unprocessable_entity (422)
**PUT**&nbsp;&nbsp;`/api/v1/tasks/26`

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
    + id: `30` (number, required)

+ Request is expected to match json schema "task"
**GET**&nbsp;&nbsp;`/api/v1/tasks/30?complete=false&name=maxime`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 30,
              "name": "similique",
              "project_id": 45,
              "created_at": "2020-02-04T13:30:43.337Z",
              "updated_at": "2020-02-04T13:30:43.337Z",
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
    + id: `34` (number, required)

+ Request is expected to respond with status code :no_content (204)
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/34`

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

            username=Kelvin&password=password&password_confirmation=password

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 29,
              "username": "Kelvin",
              "password_digest": "$2a$04$/3b3e1lePle4I3CpxtRZ.eiOwsMDivAVMrAudX0LBbeiWDCK.lalS",
              "created_at": "2020-02-04T13:30:43.463Z",
              "updated_at": "2020-02-04T13:30:43.463Z"
            }
