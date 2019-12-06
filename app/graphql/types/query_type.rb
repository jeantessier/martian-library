module Types
  class QueryType < Types::BaseObject
    field :items,
          [Types::ItemType],
          null: true,
          description: "Returns a list of items in the martian library"
    field :users,
          [Types::UserType],
          null: true,
          description: "Returns a list of users of the martian library"do
      argument :user_id, ID, 'The ID of the desired user', required: false
    end

    def items
      Item.all.preload(:user)
    end

    def users(user_id: nil)
      user_id ? User.where(id: user_id) : User.all
    end
  end
end
