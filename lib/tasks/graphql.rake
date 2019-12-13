require "graphql/rake_task"

GraphQL::RakeTask.new(
    load_schema: ->(_task) {
      require File.expand_path("../../config/environment", __dir__)
      MartianLibrarySchema
    },
    directory: "app/graphql",
    idl_outfile: "martian_library_schema.graphql",
    json_outfile: "martian_library_schema.json",
)
