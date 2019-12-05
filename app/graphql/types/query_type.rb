module Types
  class QueryType < Types::BaseObject
    field :items,
          [Types::ItemType],
          null: true,
          description: "Returns a list of items in the martian library"
    field :users,
          [Types::UserType],
          null: true,
          description: "Returns a list of users of the martian library"

    def items
      Item.all.preload(:user)
    end

    def users
      User.all
    end
  end
end
