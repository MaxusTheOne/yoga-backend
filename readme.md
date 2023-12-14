# YogaBackend

This repository hosts the backend for our yoga platform. You can also explore the live version [here](https://yogabackend.azurewebsites.net/events), although it's a bit basic as we're using a free hosting service.

## Running Locally

1. **Clone this repository:**

    - Clone this repository to your local machine and open the folder.

2. **Create a new `.env` file:**

    - In the root directory, create a new `.env` file with the following variables:

    ```env
    MYSQL_HOST=localhost
    MYSQL_USER={user}
    MYSQL_PASSWORD={password}
    MYSQL_DATABASE=yogadb
    MYSQL_PORT={port}
    ```

    Replace `{user}`, `{password}`, and `{port}` with your local database credentials.

3. **Setup the Database:**

    - Open your database IDE, set up the connection, and create the database by executing the `yogaDB.sql` file.

4. **Run Commands in Terminal:**

    - Run the following commands in your terminal:

    ```bash
    npm install
    tsc
    npm start
    ```

    You should see the following message in the terminal:

    ```
    yoga-backend@1.0.0 start
    node ./dist/main.js

    host:yogadbserver.mysql.database.azure.com
    Hello world :)
    app running on http://localhost:300
    ```

5. **Frontend Setup:**
    - Go to the frontend repository at: [https://github.com/MaxusTheOne/Yoga-frontend](https://github.com/MaxusTheOne/Yoga-frontend) and follow the steps in the README.md file to complete the setup.

Congratulations! Your backend is now up and running at [http://localhost:3000](http://localhost:3000). Feel free to explore and customize as needed!
