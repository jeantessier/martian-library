# Martian Library

Following [this tutorial](https://evilmartians.com/chronicles/graphql-on-rails-1-from-zero-to-the-first-query).

* Ruby version: `2.6.5`
* Rails version: `6.0.1`

## MySQL

This command will create a new database named
`martian_library_development` and populate it with seed data.

```bash
$ bin/rake db:setup db:seed
```

## Running the Server

You can start the application with:

```bash
$ bin/rails server
```

And use the base URL http://localhost:3000.

You can issue GraphQL queries with http://localhost:3000/graphiql.
