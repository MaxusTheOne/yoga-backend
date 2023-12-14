# YogaBackend

This repository hosts the backend for our yoga platform. You can also find a live version [here](https://yogabackend.azurewebsites.net/events), but it's a bit basic since we're using a free hosting service.

## Running Locally

1. Clone this repository to your local machine and open the file

2. Create a new `.env` file in the root directory with the following variables:

    ```env
    MYSQL_HOST=localhost
    MYSQL_USER={user}
    MYSQL_PASSWORD={password}
    MYSQL_DATABASE=yogadb
    MYSQL_PORT=3000
    ```

    Replace `{user}` and `{password}` with your local database credentials.

3. Create the database by executing the `yogaDB.sql` file.

4. Run the following commands in your terminal:

    ```bash
    tsc
    npm start
    ```

5. Go to the frontend at: https://github.com/MaxusTheOne/Yoga-frontend and follow the steps to complete the setup.

Congratulations! Your backend should now be up and running at [http://localhost:3000](http://localhost:3000). Feel free to explore and customize as needed!
