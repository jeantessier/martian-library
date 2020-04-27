# Martian Library

Following [this tutorial](https://evilmartians.com/chronicles/graphql-on-rails-1-from-zero-to-the-first-query).

* Ruby version: `2.6.6`
* Rails version: `6.0.2`

## MySQL

This command will create a new database named
`martian_library_development` and populate it with seed data.

```bash
$ bin/rake db:setup
```

## Running the Tests

You can run all the tests with:

```bash
$ bundle exec rspec
```

## Running the Server

You can start the application with:

```bash
$ bin/rails server
```

And use the base URL http://localhost:3000.

You can issue GraphQL queries with http://localhost:3000/graphiql.

## Sample Queries

### See All Users

```graphql
query GetUsers {
  users {
    id
    fullName
    email
  }
}
```

Or just:

```graphql
{
  users {
    id
    fullName
    email
  }
}
```

### See A Specific User

```graphql
query GetUserById($userId: ID) {
  users(userId: $userId) {
    id
    fullName
    email
  }
}
```

with variables:

```json
{"userId": 1}
```

### See All Items

```graphql
query GetItems {
  items {
    title
    description
    user {
      fullName
      email
    }
  }
}
```

Or just:

```graphql
{
  items {
    title
    description
    user {
      fullName
      email
    }
  }
}
```

### See Items Belonging To A User

```graphql
query GetItemsForUser($forUser: ID) {
  items(forUser: $forUser) {
    title
    description
    user {
      fullName
      email
    }
  }
}
```

with variables:

```json
{"forUser": 1}
```

## Extracting the Schema

This will write the schema as
GraphQL Schema Language to `app/graphql/martian_library_schema.graphql`.

```bash
$ bin/rake graphql:schema:idl
```

This will write the schema as
GraphQL Schema Language to `app/graphql/martian_library_schema.graphql`
and as
JSON to `app/graphql/martian_library_schema.json`.

```bash
$ bin/rake graphql:schema:dump
```
