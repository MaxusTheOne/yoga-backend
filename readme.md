# YogaBackend

This repository hosts the backend for our yoga platform. You can also find a live version [here](https://yogabackend.azurewebsites.net/events), but it's a bit basic since we're using a free hosting service.

## Running Locally

1.  Clone this repository to your local machine and open the folder

2.  Create a new `.env` file in the root directory with the following variables:

    ```env
    MYSQL_HOST=localhost
    MYSQL_USER={user}
    MYSQL_PASSWORD={password}
    MYSQL_DATABASE=yogadb
    MYSQL_PORT={port}
    ```

    Replace `{user}`, `{password}` and `{port}` with your local database credentials.

3.  Open your IDE for databases, setup the connection and create the database by executing the `yogaDB.sql` file.

4.  Run the following commands in your terminal:

        ```bash
        npm install
        tsc
        npm start
        ```

        The message below should display in the terminal now:
        "
        > yoga-backend@1.0.0 start
        > node ./dist/main.js

        host:yogadbserver.mysql.database.azure.com
        Hello world :)
        app running on http://localhost:300
        "

5.  Go to the frontend repository at: https://github.com/MaxusTheOne/Yoga-frontend and follow the steps on the README.md file to complete the setup.

Congratulations! Your backend should now be up and running at [http://localhost:3000](http://localhost:3000). Feel free to explore and customize as needed!
