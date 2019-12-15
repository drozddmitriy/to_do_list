

# Group Projects


## Projects [api/v1/projects]


### Get projects [GET /api/v1/projects]


+ Request gets list of projects
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "name": "Project 1",
                "created_at": "2019-12-15T21:18:34.234Z",
                "updated_at": "2019-12-15T21:18:34.234Z",
                "user_id": 1
              },
              {
                "id": 2,
                "name": "Project 2",
                "created_at": "2019-12-15T21:18:34.237Z",
                "updated_at": "2019-12-15T21:18:34.237Z",
                "user_id": 1
              },
              {
                "id": 3,
                "name": "Project 3",
                "created_at": "2019-12-15T21:18:34.239Z",
                "updated_at": "2019-12-15T21:18:34.239Z",
                "user_id": 1
              }
            ]

### Create project [POST /api/v1/projects]


+ Request creates new project
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=Project+7

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 7,
              "name": "Project 7",
              "created_at": "2019-12-15T21:18:34.272Z",
              "updated_at": "2019-12-15T21:18:34.272Z",
              "user_id": 2
            }

### Edit project [PUT /api/v1/projects/{id}]

+ Parameters
    + id: `11` (number, required)

+ Request edit existed project
**PUT**&nbsp;&nbsp;`/api/v1/projects/11`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=Edited+name

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "user_id": 3,
              "id": 11,
              "name": "Edited name",
              "created_at": "2019-12-15T21:18:45.586Z",
              "updated_at": "2019-12-15T21:18:45.612Z"
            }

### Get project [GET /api/v1/projects/{id}]

+ Parameters
    + id: `15` (number, required)

+ Request get project
**GET**&nbsp;&nbsp;`/api/v1/projects/15?name=Project 16`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 15,
              "name": "Project 15",
              "created_at": "2019-12-15T21:18:45.639Z",
              "updated_at": "2019-12-15T21:18:45.639Z",
              "user_id": 4
            }

### Delete project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `16` (number, required)

+ Request delete project
**DELETE**&nbsp;&nbsp;`/api/v1/projects/16`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json
