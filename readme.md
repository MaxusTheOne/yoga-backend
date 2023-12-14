<!-- Hosted: https://yogabackend.azurewebsites.net/
Bit of a lazy site, since it's free

Running it locally:
Create a new .env file in root dir with the variables
MYSQL_HOST=localhost
MYSQL_USER={user}
MYSQL_PASSWORD={password}
MYSQL_DATABASE=yogadb
MYSQL_PORT=3000

and fill in the {} with ur local db credentials
The db can be created by running the yogaDB.sql file

then run: tsc
after: npm start

Congrats! ur backend should now be hosted on http://localhost:3000 -->

# YogaBackend

This repository hosts the backend for our yoga platform. You can also find a live version [here](https://yogabackend.azurewebsites.net/), but it's a bit basic since we're using a free hosting service.

## Running Locally

1. Create a new `.env` file in the root directory with the following variables:

    ```env
    MYSQL_HOST=localhost
    MYSQL_USER={user}
    MYSQL_PASSWORD={password}
    MYSQL_DATABASE=yogadb
    MYSQL_PORT=3000
    ```

    Replace `{user}` and `{password}` with your local database credentials.

2. Create the database by executing the `yogaDB.sql` file.

3. Run the following commands in your terminal:

    ```bash
    tsc
    npm start
    ```

Congratulations! Your backend should now be up and running at [http://localhost:3000](http://localhost:3000). Feel free to explore and customize as needed!
