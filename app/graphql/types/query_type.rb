module Types
  class QueryType < Types::BaseObject
    field :items,
        [Types::ItemType],
        null: true,
        description: "Returns a list of items in the martian library"do
      argument :for_user, ID, 'The ID of the desired user', required: false
    end
    field :users,
        [Types::UserType],
        null: true,
        description: "Returns a list of users of the martian library"do
      argument :user_id, ID, 'The ID of the desired user', required: false
    end
    field :me,
        Types::UserType,
        null: true,
        description: "Returns the currently logged in user"

    def items(for_user: nil)
      (for_user ? Item.where(user_id: for_user) : Item.all).preload(:user)
    end

    def users(user_id: nil)
      user_id ? User.where(id: user_id) : User.all
    end

    def me
      context[:current_user]
    end
  end
end
