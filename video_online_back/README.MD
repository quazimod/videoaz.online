### Database migration ###
We use db-migrate node module (https://db-migrate.readthedocs.io/en/latest).
As we have one DB for now for all modules all migration scripts must be in under db_migrations folder

One needs to follow the next steps if any migration needs to be conducted:
1. Go to the *migration* folder
2. Create empty sql file and corresponding js file with the following command:
 ```
 #!shell
node node_modules/db-migrate/bin/db-migrate create <migration_name>  --sql-file
 ```
There will be one .js file and two .sql files generated. We rarely go "down" so  "down"
migration is not necessary for complex migration but it's better to provide one for adding / removing / cganging
columns.

3. Add needed SQL file into the generated file. (don't forget to add generated sql and js files into the git repository)
4. Test migration locally with the following command:
 ```
 #!shell
node node_modules/db-migrate/bin/db-migrate up
 ```

* Migration will be applied automatically to stage and prod upon deployment.