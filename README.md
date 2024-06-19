# Photo Website Application

This is a Ruby on Rails application that focuses on handling photos. User can like and dislike photos. 

### Start the Rails server:
```bash
rails server
```

The endpoints for the api are in `http://localhost:3000/api/v1`

The endpoint for apipie is `http://localhost:3000/apipie`

Creation of users are accompanied with JWT.

### User Creation:

![image](https://github.com/Bob-Kyle-Rosales/photostocksz/assets/111747795/23a75566-40d1-49de-8db3-9887ed6cf467)

http://127.0.0.1:3000/registrations

```
{
  "user": {
    "firstname": "John",
    "lastname": "John",
    "email": "johndoe@gmail.com",
    "password": "password",
    "password_confirmation": "password",
    "gender": "male"
  }
}
```

After creating a user:

![image](https://github.com/Bob-Kyle-Rosales/photostocksz/assets/111747795/39cb5546-99f1-48fd-b588-5fd435e8f8bc)

Fill in as parameters the email and password you used in user creation. It will produce a auth_token and to be used as auth_token header for every transaction.

![image](https://github.com/Bob-Kyle-Rosales/photostocksz/assets/111747795/a354cb9a-3b49-4b36-8634-651b917931dc)

Supply the auth_token in the header and it will authorize you to make transaction.

When liking and unliking, use this routes:

POST http://127.0.0.1:3000/api/v1/photos/:id/like

DELETE http://127.0.0.1:3000/api/v1/photos/:id/unlike

## CRUD

1. CRUD features on Photo model
2. Sign-in and Sign-up for User with JWT
3. Retrieve all of user's liked photos
4. Retrieve user data along with owned photos
5. Pagination on photos and users index

### Sample

Photo Pagination

![image](https://github.com/Bob-Kyle-Rosales/photostocksz/assets/111747795/dac8eb7c-0270-4618-a814-5f3a674e7d7f)

User Liked Photos

![image](https://github.com/Bob-Kyle-Rosales/photostocksz/assets/111747795/105c9b6c-1cb8-4404-8b6d-a87b162a0e84)




