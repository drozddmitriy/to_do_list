

# Group Authentication


## Users [/api/v1/auth/login]


###  [POST /api/v1/auth/login]


+ Request log in user
**POST**&nbsp;&nbsp;`/api/v1/auth/login`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=username&password=password

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NzY2Nzk3NDF9.y4YSJfhwrkvKUwPLUS3xFerZ0wrJrbUW6fAwG_RjTyU",
              "exp": "12-18-2019 14:35",
              "username": "username"
            }

# Group Comments


## Comments [api/v1/comments]


### Get comments [GET /api/v1/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `1` (number, required)
    + task_id: `1` (number, required)

+ Request get comments
**GET**&nbsp;&nbsp;`/api/v1/projects/1/tasks/1/comments`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "text": "Comment_test_text",
                "file": {
                  "url": "/uploads/comment/file/1/test.jpg"
                },
                "task_id": 1,
                "created_at": "2019-12-17T14:35:41.082Z",
                "updated_at": "2019-12-17T14:35:41.082Z"
              },
              {
                "id": 2,
                "text": "Comment_test_text",
                "file": {
                  "url": "/uploads/comment/file/2/test.jpg"
                },
                "task_id": 1,
                "created_at": "2019-12-17T14:35:41.088Z",
                "updated_at": "2019-12-17T14:35:41.088Z"
              },
              {
                "id": 3,
                "text": "Comment_test_text",
                "file": {
                  "url": "/uploads/comment/file/3/test.jpg"
                },
                "task_id": 1,
                "created_at": "2019-12-17T14:35:41.092Z",
                "updated_at": "2019-12-17T14:35:41.092Z"
              }
            ]

### Create a comment [POST /api/v1/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `2` (number, required)
    + task_id: `2` (number, required)

+ Request create comment
**POST**&nbsp;&nbsp;`/api/v1/projects/2/tasks/2/comments`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            text=Comment_test_text&file=%23%3CFile%3A0x00005589cf963508%3E

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 7,
              "text": "Comment_test_text",
              "file": {
                "url": null
              },
              "task_id": 2,
              "created_at": "2019-12-17T14:35:41.152Z",
              "updated_at": "2019-12-17T14:35:41.152Z"
            }

### Edit a comment [PUT /api/v1/projects/{project_id}/tasks/{task_id}/comments/{id}]

+ Parameters
    + project_id: `3` (number, required)
    + task_id: `3` (number, required)
    + id: `11` (number, required)

+ Request update comment
**PUT**&nbsp;&nbsp;`/api/v1/projects/3/tasks/3/comments/11`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            text=Test_text

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "task_id": 3,
              "id": 11,
              "text": "Test_text",
              "file": {
                "url": "/uploads/comment/file/11/test.jpg"
              },
              "created_at": "2019-12-17T14:35:41.184Z",
              "updated_at": "2019-12-17T14:35:41.197Z"
            }

### Get a comment [GET /api/v1/projects/{project_id}/tasks/{task_id}/comments/{id}]

+ Parameters
    + project_id: `4` (number, required)
    + task_id: `4` (number, required)
    + id: `15` (number, required)

+ Request get comment
**GET**&nbsp;&nbsp;`/api/v1/projects/4/tasks/4/comments/15?file=#<File:0x00005589cdc61068>&text=Comment_test_text`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 15,
              "text": "Comment_test_text",
              "file": {
                "url": "/uploads/comment/file/15/test.jpg"
              },
              "task_id": 4,
              "created_at": "2019-12-17T14:35:41.230Z",
              "updated_at": "2019-12-17T14:35:41.230Z"
            }

### Delete a comment [DELETE /api/v1/projects/{project_id}/tasks/{task_id}/comments/{id}]

+ Parameters
    + project_id: `5` (number, required)
    + task_id: `5` (number, required)
    + id: `16` (number, required)

+ Request delete comments
**DELETE**&nbsp;&nbsp;`/api/v1/projects/5/tasks/5/comments/16`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json

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
                "id": 6,
                "name": "Project 6",
                "created_at": "2019-12-17T14:35:41.290Z",
                "updated_at": "2019-12-17T14:35:41.290Z",
                "user_id": 7
              },
              {
                "id": 7,
                "name": "Project 7",
                "created_at": "2019-12-17T14:35:41.292Z",
                "updated_at": "2019-12-17T14:35:41.292Z",
                "user_id": 7
              },
              {
                "id": 8,
                "name": "Project 8",
                "created_at": "2019-12-17T14:35:41.294Z",
                "updated_at": "2019-12-17T14:35:41.294Z",
                "user_id": 7
              }
            ]

### Create a project [POST /api/v1/projects]


+ Request create project
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
              "created_at": "2019-12-17T14:35:41.330Z",
              "updated_at": "2019-12-17T14:35:41.330Z",
              "user_id": 8
            }

### Edit a project [PUT /api/v1/projects/{id}]

+ Parameters
    + id: `16` (number, required)

+ Request edit project
**PUT**&nbsp;&nbsp;`/api/v1/projects/16`

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
              "user_id": 9,
              "id": 16,
              "name": "Test_name",
              "created_at": "2019-12-17T14:35:41.347Z",
              "updated_at": "2019-12-17T14:35:41.354Z"
            }

### Get a project [GET /api/v1/projects/{id}]

+ Parameters
    + id: `20` (number, required)

+ Request get project
**GET**&nbsp;&nbsp;`/api/v1/projects/20?name=Project 21`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 20,
              "name": "Project 20",
              "created_at": "2019-12-17T14:35:41.370Z",
              "updated_at": "2019-12-17T14:35:41.370Z",
              "user_id": 10
            }

### Delete a project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `21` (number, required)

+ Request delete project
**DELETE**&nbsp;&nbsp;`/api/v1/projects/21`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json

# Group Tasks


## Tasks [api/v1/tasks]


### Get tasks [GET /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `24` (number, required)

+ Request get tasks
**GET**&nbsp;&nbsp;`/api/v1/projects/24/tasks`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 6,
                "name": "Task_test",
                "project_id": 24,
                "created_at": "2019-12-17T14:35:41.410Z",
                "updated_at": "2019-12-17T14:35:41.410Z",
                "complete": false,
                "position": 1,
                "deadline": null
              },
              {
                "id": 7,
                "name": "Task_test",
                "project_id": 24,
                "created_at": "2019-12-17T14:35:41.413Z",
                "updated_at": "2019-12-17T14:35:41.413Z",
                "complete": false,
                "position": 2,
                "deadline": null
              },
              {
                "id": 8,
                "name": "Task_test",
                "project_id": 24,
                "created_at": "2019-12-17T14:35:41.417Z",
                "updated_at": "2019-12-17T14:35:41.417Z",
                "complete": false,
                "position": 3,
                "deadline": null
              }
            ]

### Create a task [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `25` (number, required)

+ Request create task
**POST**&nbsp;&nbsp;`/api/v1/projects/25/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=Task_test&complete=false

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 12,
              "name": "Task_test",
              "project_id": 25,
              "created_at": "2019-12-17T14:35:41.456Z",
              "updated_at": "2019-12-17T14:35:41.456Z",
              "complete": false,
              "position": 4,
              "deadline": null
            }

### Edit a task [PUT /api/v1/projects/{project_id}/tasks/{id}]

+ Parameters
    + project_id: `26` (number, required)
    + id: `16` (number, required)

+ Request update tasks
**PUT**&nbsp;&nbsp;`/api/v1/projects/26/tasks/16`

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
              "project_id": 26,
              "id": 16,
              "name": "Test_name",
              "position": 4,
              "created_at": "2019-12-17T14:35:41.479Z",
              "updated_at": "2019-12-17T14:35:41.490Z",
              "complete": false,
              "deadline": null
            }

### Get a task [GET /api/v1/projects/{project_id}/tasks/{id}]

+ Parameters
    + project_id: `27` (number, required)
    + id: `20` (number, required)

+ Request get task
**GET**&nbsp;&nbsp;`/api/v1/projects/27/tasks/20?complete=false&name=Task_test`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 20,
              "name": "Task_test",
              "project_id": 27,
              "created_at": "2019-12-17T14:35:41.512Z",
              "updated_at": "2019-12-17T14:35:41.512Z",
              "complete": false,
              "position": 4,
              "deadline": null
            }

### Delete a task [DELETE /api/v1/projects/{project_id}/tasks/{id}]

+ Parameters
    + project_id: `28` (number, required)
    + id: `21` (number, required)

+ Request delete task
**DELETE**&nbsp;&nbsp;`/api/v1/projects/28/tasks/21`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json

# Group Users


## Users [/api/v1/users]


### Create a user [POST /api/v1/users]


+ Request register new user
**POST**&nbsp;&nbsp;`/api/v1/users`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=username&password=password&password_confirmation=password

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 17,
              "username": "username",
              "password_digest": "$2a$04$wjldHWtLBNnaSFQ9TnhV1eCJnoE4kcjufxBcWq9y139ZH85GfY1FO",
              "created_at": "2019-12-17T14:35:41.565Z",
              "updated_at": "2019-12-17T14:35:41.565Z"
            }
