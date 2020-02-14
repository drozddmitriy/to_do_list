

# Group Authentications


## Authentications [/api/v1/authentications]


### Login user [POST /api/v1/authentications]


+ Request login user
**POST**&nbsp;&nbsp;`/api/v1/authentications`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "username": "Fahrenheit",
              "password": "password"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODE3NjIzOTJ9.mV1telE3IF4dWVQHT3Bj34FLp6nyYHr-O9OKICi76HU",
              "exp": "2020-02-15T10:26:32.748Z",
              "username": "Fahrenheit"
            }

+ Request do not register user
**POST**&nbsp;&nbsp;`/api/v1/authentications`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "username": "Kelvin",
              "password": ""
            }

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid password"
            }

### Logout user [DELETE /api/v1/authentications]


+ Request is expected to respond with status code :no_content (204)
**DELETE**&nbsp;&nbsp;`/api/v1/authentications`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request is expected to respond with status code :unauthorized (401)
**DELETE**&nbsp;&nbsp;`/api/v1/authentications`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid token"
            }

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
                "text": "Perferendis atque rerum vel sequi.",
                "file": {
                  "url": null
                },
                "task_id": 1,
                "created_at": "2020-02-14T10:26:32.801Z",
                "updated_at": "2020-02-14T10:26:32.801Z"
              },
              {
                "id": 2,
                "text": "Tenetur fugiat dolorum itaque illo unde.",
                "file": {
                  "url": null
                },
                "task_id": 1,
                "created_at": "2020-02-14T10:26:32.803Z",
                "updated_at": "2020-02-14T10:26:32.803Z"
              },
              {
                "id": 3,
                "text": "Explicabo vero laudantium tempora voluptas reiciendis quis voluptate.",
                "file": {
                  "url": null
                },
                "task_id": 1,
                "created_at": "2020-02-14T10:26:32.804Z",
                "updated_at": "2020-02-14T10:26:32.804Z"
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
                "text": "Ut est velit quisquam ad qui ea.",
                "file": {
                  "url": null
                },
                "task_id": 2,
                "created_at": "2020-02-14T10:26:32.828Z",
                "updated_at": "2020-02-14T10:26:32.828Z"
              },
              {
                "id": 5,
                "text": "Aliquid molestiae cum natus consequuntur dolores quis itaque.",
                "file": {
                  "url": null
                },
                "task_id": 2,
                "created_at": "2020-02-14T10:26:32.830Z",
                "updated_at": "2020-02-14T10:26:32.830Z"
              },
              {
                "id": 6,
                "text": "Eum fugiat rerum molestiae necessitatibus consequatur libero consequuntur optio.",
                "file": {
                  "url": null
                },
                "task_id": 2,
                "created_at": "2020-02-14T10:26:32.831Z",
                "updated_at": "2020-02-14T10:26:32.831Z"
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

+ Request is expected to respond with status code :unauthorized (401)
**GET**&nbsp;&nbsp;`/api/v1/tasks/4/comments`

    + Headers

            Accept: application/json

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid token"
            }

+ Request is expected to respond with status code :forbidden (403)
**GET**&nbsp;&nbsp;`/api/v1/tasks/5/comments`

    + Headers

            Accept: application/json

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Access denied"
            }

### Create a comment [POST /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `6` (number, required)

+ Request is expected to match json schema "comment"
**POST**&nbsp;&nbsp;`/api/v1/tasks/6/comments`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "text": "Corporis est provident et non voluptatum sint."
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 19,
              "text": "Corporis est provident et non voluptatum sint.",
              "file": {
                "url": null
              },
              "task_id": 6,
              "created_at": "2020-02-14T10:26:32.910Z",
              "updated_at": "2020-02-14T10:26:32.910Z"
            }

+ Request is expected to respond with status code :unprocessable_entity (422)
**POST**&nbsp;&nbsp;`/api/v1/tasks/7/comments`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "text": null
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "text": [
                "can't be blank"
              ]
            }

+ Request is expected to respond with status code :unauthorized (401)
**POST**&nbsp;&nbsp;`/api/v1/tasks/8/comments`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "text": "Eius illo perspiciatis voluptatem odio tempore similique assumenda."
            }

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid token"
            }

+ Request is expected to respond with status code :forbidden (403)
**POST**&nbsp;&nbsp;`/api/v1/tasks/9/comments`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "text": "Cumque ut necessitatibus et consequatur repellendus distinctio."
            }

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Access denied"
            }

### Delete a comment [DELETE /api/v1/comments/{id}]

+ Parameters
    + id: `29` (number, required)

+ Request is expected to respond with status code :no_content (204)
**DELETE**&nbsp;&nbsp;`/api/v1/comments/29`

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

+ Request is expected to respond with status code :unauthorized (401)
**DELETE**&nbsp;&nbsp;`/api/v1/comments/35`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid token"
            }

+ Request is expected to respond with status code :forbidden (403)
**DELETE**&nbsp;&nbsp;`/api/v1/comments/38`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Access denied"
            }

# Group Projects


## Projects [api/v1/projects]


### Get projects [GET /api/v1/projects]


+ Request is expected to eq 3
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 16,
                "name": "Project 16",
                "created_at": "2020-02-14T10:26:33.065Z",
                "updated_at": "2020-02-14T10:26:33.065Z",
                "user_id": 20
              },
              {
                "id": 15,
                "name": "Project 15",
                "created_at": "2020-02-14T10:26:33.064Z",
                "updated_at": "2020-02-14T10:26:33.064Z",
                "user_id": 20
              },
              {
                "id": 14,
                "name": "Project 14",
                "created_at": "2020-02-14T10:26:33.063Z",
                "updated_at": "2020-02-14T10:26:33.063Z",
                "user_id": 20
              }
            ]

+ Request is expected to match json schema "projects"
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 19,
                "name": "Project 19",
                "created_at": "2020-02-14T10:26:33.079Z",
                "updated_at": "2020-02-14T10:26:33.079Z",
                "user_id": 21
              },
              {
                "id": 18,
                "name": "Project 18",
                "created_at": "2020-02-14T10:26:33.077Z",
                "updated_at": "2020-02-14T10:26:33.077Z",
                "user_id": 21
              },
              {
                "id": 17,
                "name": "Project 17",
                "created_at": "2020-02-14T10:26:33.076Z",
                "updated_at": "2020-02-14T10:26:33.076Z",
                "user_id": 21
              }
            ]

+ Request is expected to respond with status code :unauthorized (401)
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid token"
            }

+ Request is expected to respond with status code :forbidden (403)
**PUT**&nbsp;&nbsp;`/api/v1/projects/26`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Access denied"
            }

### Create a project [POST /api/v1/projects]


+ Request is expected to match json schema "project"
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "Project 30"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 30,
              "name": "Project 30",
              "created_at": "2020-02-14T10:26:33.124Z",
              "updated_at": "2020-02-14T10:26:33.124Z",
              "user_id": 25
            }

+ Request is expected to respond with status code :unprocessable_entity (422)
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": null
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "name": [
                "can't be blank"
              ]
            }

+ Request is expected to respond with status code :unauthorized (401)
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "Project 37"
            }

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid token"
            }

### Edit a project [PUT /api/v1/projects/{id}]

+ Parameters
    + id: `40` (number, required)

+ Request is expected to include "Test_name"
**PUT**&nbsp;&nbsp;`/api/v1/projects/40`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "Test_name"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 40,
              "user_id": 28,
              "name": "Test_name",
              "created_at": "2020-02-14T10:26:33.160Z",
              "updated_at": "2020-02-14T10:26:33.165Z"
            }

+ Request is expected to match json schema "project"
**PUT**&nbsp;&nbsp;`/api/v1/projects/44`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "Test_name"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 44,
              "user_id": 29,
              "name": "Test_name",
              "created_at": "2020-02-14T10:26:33.175Z",
              "updated_at": "2020-02-14T10:26:33.180Z"
            }

+ Request is expected to respond with status code :unprocessable_entity (422)
**PUT**&nbsp;&nbsp;`/api/v1/projects/48`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": null
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "name": [
                "can't be blank"
              ]
            }

+ Request is expected to respond with status code :unauthorized (401)
**PUT**&nbsp;&nbsp;`/api/v1/projects/52`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=Project+54

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid token"
            }

+ Request is expected to respond with status code :forbidden (403)
**PUT**&nbsp;&nbsp;`/api/v1/projects/56`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "Project 59"
            }

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Access denied"
            }

### Get a project [GET /api/v1/projects/{id}]

+ Parameters
    + id: `60` (number, required)

+ Request is expected to match json schema "project"
**GET**&nbsp;&nbsp;`/api/v1/projects/60`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 60,
              "name": "Project 63",
              "created_at": "2020-02-14T10:26:33.233Z",
              "updated_at": "2020-02-14T10:26:33.233Z",
              "user_id": 34
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

+ Request is expected to respond with status code :unauthorized (401)
**GET**&nbsp;&nbsp;`/api/v1/projects/67`

    + Headers

            Accept: application/json

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid token"
            }

+ Request is expected to respond with status code :forbidden (403)
**GET**&nbsp;&nbsp;`/api/v1/projects/71`

    + Headers

            Accept: application/json

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Access denied"
            }

### Delete a project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `72` (number, required)

+ Request is expected to respond with status code :no_content (204)
**DELETE**&nbsp;&nbsp;`/api/v1/projects/72`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request is expected to respond with a not_found status code (404)
**DELETE**&nbsp;&nbsp;`/api/v1/projects/0`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Couldn't find Project with 'id'=0"
            }

+ Request is expected to respond with status code :unauthorized (401)
**DELETE**&nbsp;&nbsp;`/api/v1/projects/78`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid token"
            }

+ Request is expected to respond with status code :forbidden (403)
**DELETE**&nbsp;&nbsp;`/api/v1/projects/81`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Access denied"
            }

# Group Tasks


## Tasks [api/v1/tasks]


### Get tasks [GET /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `84` (number, required)

+ Request is expected to eq 3
**GET**&nbsp;&nbsp;`/api/v1/projects/84/tasks`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 14,
                "name": "impedit",
                "project_id": 84,
                "created_at": "2020-02-14T10:26:33.351Z",
                "updated_at": "2020-02-14T10:26:33.351Z",
                "complete": false,
                "position": 1,
                "deadline": null
              },
              {
                "id": 15,
                "name": "non",
                "project_id": 84,
                "created_at": "2020-02-14T10:26:33.353Z",
                "updated_at": "2020-02-14T10:26:33.353Z",
                "complete": false,
                "position": 2,
                "deadline": null
              },
              {
                "id": 16,
                "name": "dolorum",
                "project_id": 84,
                "created_at": "2020-02-14T10:26:33.356Z",
                "updated_at": "2020-02-14T10:26:33.356Z",
                "complete": false,
                "position": 3,
                "deadline": null
              }
            ]

+ Request is expected to match json schema "tasks"
**GET**&nbsp;&nbsp;`/api/v1/projects/85/tasks`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 17,
                "name": "voluptates",
                "project_id": 85,
                "created_at": "2020-02-14T10:26:33.370Z",
                "updated_at": "2020-02-14T10:26:33.370Z",
                "complete": false,
                "position": 1,
                "deadline": null
              },
              {
                "id": 18,
                "name": "perferendis",
                "project_id": 85,
                "created_at": "2020-02-14T10:26:33.373Z",
                "updated_at": "2020-02-14T10:26:33.373Z",
                "complete": false,
                "position": 2,
                "deadline": null
              },
              {
                "id": 19,
                "name": "aut",
                "project_id": 85,
                "created_at": "2020-02-14T10:26:33.375Z",
                "updated_at": "2020-02-14T10:26:33.375Z",
                "complete": false,
                "position": 3,
                "deadline": null
              }
            ]

+ Request is expected to respond with status code :unauthorized (401)
**GET**&nbsp;&nbsp;`/api/v1/projects/86/tasks`

    + Headers

            Accept: application/json

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid token"
            }

+ Request is expected to respond with status code :forbidden (403)
**GET**&nbsp;&nbsp;`/api/v1/projects/87/tasks`

    + Headers

            Accept: application/json

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Access denied"
            }

### Create a task [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `88` (number, required)

+ Request is expected to match json schema "task"
**POST**&nbsp;&nbsp;`/api/v1/projects/88/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "doloribus",
              "complete": false
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 29,
              "name": "doloribus",
              "project_id": 88,
              "created_at": "2020-02-14T10:26:33.432Z",
              "updated_at": "2020-02-14T10:26:33.432Z",
              "complete": false,
              "position": 4,
              "deadline": null
            }

+ Request is expected to respond with status code :unprocessable_entity (422)
**POST**&nbsp;&nbsp;`/api/v1/projects/89/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": null
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "name": [
                "can't be blank"
              ]
            }

+ Request is expected to respond with status code :unauthorized (401)
**POST**&nbsp;&nbsp;`/api/v1/projects/90/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "facere",
              "complete": false
            }

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid token"
            }

+ Request is expected to respond with status code :forbidden (403)
**POST**&nbsp;&nbsp;`/api/v1/projects/91/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "magnam",
              "complete": false
            }

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Access denied"
            }

### Edit a task [PUT /api/v1/tasks/{id}]

+ Parameters
    + id: `42` (number, required)

+ Request is expected to include "Test_name"
**PUT**&nbsp;&nbsp;`/api/v1/tasks/42`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "Test_name"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 42,
              "project_id": 92,
              "name": "Test_name",
              "position": 4,
              "created_at": "2020-02-14T10:26:33.500Z",
              "updated_at": "2020-02-14T10:26:33.507Z",
              "complete": false,
              "deadline": null
            }

+ Request is expected to match json schema "task"
**PUT**&nbsp;&nbsp;`/api/v1/tasks/46`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "Test_name"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 46,
              "project_id": 93,
              "name": "Test_name",
              "position": 4,
              "created_at": "2020-02-14T10:26:33.522Z",
              "updated_at": "2020-02-14T10:26:33.529Z",
              "complete": false,
              "deadline": null
            }

+ Request is expected to respond with status code :unprocessable_entity (422)
**PUT**&nbsp;&nbsp;`/api/v1/tasks/50`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": null
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "name": [
                "can't be blank"
              ]
            }

+ Request is expected to respond with status code :unauthorized (401)
**PUT**&nbsp;&nbsp;`/api/v1/tasks/54`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "est",
              "complete": false
            }

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid token"
            }

+ Request is expected to respond with status code :forbidden (403)
**PUT**&nbsp;&nbsp;`/api/v1/tasks/58`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "Test_name"
            }

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Access denied"
            }

### Get a task [GET /api/v1/tasks/{id}]

+ Parameters
    + id: `62` (number, required)

+ Request is expected to match json schema "task"
**GET**&nbsp;&nbsp;`/api/v1/tasks/62`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 62,
              "name": "occaecati",
              "project_id": 97,
              "created_at": "2020-02-14T10:26:33.604Z",
              "updated_at": "2020-02-14T10:26:33.604Z",
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

+ Request is expected to respond with status code :unauthorized (401)
**GET**&nbsp;&nbsp;`/api/v1/tasks/69`

    + Headers

            Accept: application/json

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid token"
            }

+ Request is expected to respond with status code :forbidden (403)
**GET**&nbsp;&nbsp;`/api/v1/tasks/73`

    + Headers

            Accept: application/json

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Access denied"
            }

### Delete a task [DELETE /api/v1/tasks/{id}]

+ Parameters
    + id: `74` (number, required)

+ Request is expected to respond with status code :no_content (204)
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/74`

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

+ Request is expected to respond with status code :unauthorized (401)
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/80`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Invalid token"
            }

+ Request is expected to respond with status code :forbidden (403)
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/83`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Access denied"
            }

# Group Users


## Users [/api/v1/users]


### Create a user [POST /api/v1/users]


+ Request register new user
**POST**&nbsp;&nbsp;`/api/v1/users`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "username": "Fahrenheit",
              "password": "password",
              "password_confirmation": "password"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 70,
              "username": "Fahrenheit",
              "password_digest": "$2a$04$craKjPS8peO2PzNP3yWEcOcZxF07F29v1g/Tjh2UPkrGxkVC26IZ2",
              "created_at": "2020-02-14T10:26:33.755Z",
              "updated_at": "2020-02-14T10:26:33.755Z"
            }

+ Request do not create user
**POST**&nbsp;&nbsp;`/api/v1/users`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "username": "",
              "password": "",
              "password_confirmation": ""
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Password can't be blank",
                "Password is the wrong length (should be 8 characters)",
                "Username can't be blank",
                "Username is too short (minimum is 3 characters)",
                "Password confirmation doesn't match Password"
              ]
            }
