

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
                "created_at": "2019-12-17T10:20:52.534Z",
                "updated_at": "2019-12-17T10:20:52.534Z"
              },
              {
                "id": 2,
                "text": "Comment_test_text",
                "file": {
                  "url": "/uploads/comment/file/2/test.jpg"
                },
                "task_id": 1,
                "created_at": "2019-12-17T10:20:52.539Z",
                "updated_at": "2019-12-17T10:20:52.539Z"
              },
              {
                "id": 3,
                "text": "Comment_test_text",
                "file": {
                  "url": "/uploads/comment/file/3/test.jpg"
                },
                "task_id": 1,
                "created_at": "2019-12-17T10:20:52.544Z",
                "updated_at": "2019-12-17T10:20:52.544Z"
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

            text=Comment_test_text&file=%23%3CFile%3A0x0000558a98df50c0%3E

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
              "created_at": "2019-12-17T10:20:52.627Z",
              "updated_at": "2019-12-17T10:20:52.627Z"
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
              "created_at": "2019-12-17T10:20:52.661Z",
              "updated_at": "2019-12-17T10:20:52.673Z"
            }

### Get a comment [GET /api/v1/projects/{project_id}/tasks/{task_id}/comments/{id}]

+ Parameters
    + project_id: `4` (number, required)
    + task_id: `4` (number, required)
    + id: `15` (number, required)

+ Request get comment
**GET**&nbsp;&nbsp;`/api/v1/projects/4/tasks/4/comments/15?file=#<File:0x0000558a987e1580>&text=Comment_test_text`

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
              "created_at": "2019-12-17T10:20:52.708Z",
              "updated_at": "2019-12-17T10:20:52.708Z"
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
                "created_at": "2019-12-17T10:20:52.771Z",
                "updated_at": "2019-12-17T10:20:52.771Z",
                "user_id": 6
              },
              {
                "id": 7,
                "name": "Project 7",
                "created_at": "2019-12-17T10:20:52.773Z",
                "updated_at": "2019-12-17T10:20:52.773Z",
                "user_id": 6
              },
              {
                "id": 8,
                "name": "Project 8",
                "created_at": "2019-12-17T10:20:52.776Z",
                "updated_at": "2019-12-17T10:20:52.776Z",
                "user_id": 6
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
              "created_at": "2019-12-17T10:20:52.804Z",
              "updated_at": "2019-12-17T10:20:52.804Z",
              "user_id": 7
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
              "user_id": 8,
              "id": 16,
              "name": "Test_name",
              "created_at": "2019-12-17T10:20:52.821Z",
              "updated_at": "2019-12-17T10:20:52.828Z"
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
              "created_at": "2019-12-17T10:20:52.844Z",
              "updated_at": "2019-12-17T10:20:52.844Z",
              "user_id": 9
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
                "created_at": "2019-12-17T10:20:52.886Z",
                "updated_at": "2019-12-17T10:20:52.886Z",
                "complete": false,
                "position": 1,
                "deadline": null
              },
              {
                "id": 7,
                "name": "Task_test",
                "project_id": 24,
                "created_at": "2019-12-17T10:20:52.889Z",
                "updated_at": "2019-12-17T10:20:52.889Z",
                "complete": false,
                "position": 2,
                "deadline": null
              },
              {
                "id": 8,
                "name": "Task_test",
                "project_id": 24,
                "created_at": "2019-12-17T10:20:52.893Z",
                "updated_at": "2019-12-17T10:20:52.893Z",
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
              "created_at": "2019-12-17T10:20:52.933Z",
              "updated_at": "2019-12-17T10:20:52.933Z",
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
              "created_at": "2019-12-17T10:20:52.962Z",
              "updated_at": "2019-12-17T10:20:52.974Z",
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
              "created_at": "2019-12-17T10:20:52.997Z",
              "updated_at": "2019-12-17T10:20:52.997Z",
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
