# API Intro - Database Connection

## IN CLASS

[Jupyter Notebook Original](https://studio.ironhack.school/asset-v1:IRONHACK+DAFT+202004_SAO+type@asset+block@sql-connection-original.ipynb)

[data](https://studio.ironhack.school/asset-v1:IRONHACK+DAFT+202004_SAO+type@asset+block@sql_db.zip)

## IN CLASS

## READING DATA FROM DATABASES

In addition to reading data from various types of files, Pandas also provides us with the ability to read data from MySQL databases. To do so, we need to import the `pymysql` library and the `create_engine` function from the `sqlalchemy` library.

```python
from sqlalchemy import create_engine
```
We must then call the create_engine function and pass it the string below, replacing `username` and `password` with the actual username and password for the MySQL database on your local machine. We will assign the result to a variable called `engine`.

The engine can be

Copy

engine = create_engine('postgresql+psycopg2://username:password@localhost/database')

From there, we can use the Pandas `read_sql_query` function, pass it a SQL statement, and specify that it is to run that statement on the engine connection we created to our MySQL database. In the example below, we are querying all records from the employee table in our publications database.

Copy

data = pd.read_sql_query('SELECT * FROM database.employee', engine)

## [](http://studio.ironhack.school/container/block-v1:IRONHACK+DAPT+201906_SAO+type@vertical+block@e239a599aec54ba2a2fd1dc874eb08bc#writing-data-to-databases)WRITING DATA TO DATABASES

Once you have data in a data frame and you have your MySQL database connections saved to the `engine` variable, writing the data to a table in the database is pretty straightforward. You can use Pandas' `to_sql` method and specify the table name you want to give the data set, the database connection, what you want to happen if the table already exists (replace, append, fail, etc.) and whether you want to include or exclude the indexes.

Copy

data.to_sql('employee2', engine, if_exists='replace', index=False)

If you refresh the publications database, you should now see a table named "employee2."

## NOTES

You'll have to install psycopg2 (using `pip install psycopg2`), which is the default driver for the database connection. For MacOS operating systems, you'll probably need to install psycopg2 via `pip install psycopg2-binary.`
