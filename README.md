# Test case for Prisma Issue

This is a repo showing how prisma's setting of the postgresql `search_path` to
handle schemas does not work if extensions are installed in a separate
namespace.  For example [on heroku](https://devcenter.heroku.com/changelog-items/2446).

# Using

- download the repo
- make sure you have postgresql installed locally
- run `./make-heroku-like-environment.sh`
- run `nvm use`
- run `npm install`
- run `npx prisma migrate dev`


Watch it explode:

```
% npx prisma migrate dev
Prisma schema loaded from db/schema.prisma
Datasource "db": PostgreSQL database "extension_test", schema "myschema" at "localhost:5432"

✔ Enter a name for the new migration: …
Applying migration `20220804172713_`
Error: P3018

A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve

Migration name: 20220804172713_

Database error code: 42704

Database error:
ERROR: type "citext" does not exist

Position:
  0
  1 -- CreateTable
  2 CREATE TABLE "users" (
  3     "id" UUID NOT NULL DEFAULT gen_random_uuid(),
  4     "email" CITEXT,

DbError { severity: "ERROR", parsed_severity: Some(Error), code: SqlState(E42704), message: "type \"citext\" does not exist", detail: None, hint: None, position: Some(Original(101)), where_: None, schema: None, table: None, column: None, datatype: None, constraint: None, file: Some("parse_type.c"), line: Some(274), routine: Some("typenameType") }
```
