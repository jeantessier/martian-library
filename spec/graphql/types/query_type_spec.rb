require "rails_helper"

RSpec.describe Types::QueryType do
  describe "items" do
    let!(:items) { create_pair(:item) }

    context "all items" do
      let(:query) do
        %(query {
          items {
            title
          }
        })
      end

      subject(:result) do
        MartianLibrarySchema.execute(query).as_json
      end

      it "returns all items" do
        expect(result.dig("data", "items")).to match_array(
            items.map { |item| { "title" => item.title } }
        )
      end
    end

    context "user's items" do
      let((:user)) { items.first.user }

      let(:query) do
        %(query GetItemsForUser($forUser: ID) {
          items(forUser: $forUser) {
            title
          }
        })
      end

      subject(:result) do
        MartianLibrarySchema.execute(query, variables: { forUser: user.id }).as_json
      end

      it "returns items for a specific user" do
        expect(result.dig("data", "items")).to match_array(
            items.find_all { |item| item.user == user }.map { |item| { "title" => item.title } }
        )
      end
    end
  end

  describe "users" do
    let!(:users) { create_pair(:user) }

    context "all users" do
      let(:query) do
        %(query {
          users {
            fullName
          }
        })
      end

      subject(:result) do
        MartianLibrarySchema.execute(query).as_json
      end

      it "returns all users" do
        expect(result.dig("data", "users")).to match_array(
            users.map { |user| { "fullName" => "#{user.first_name} #{user.last_name}" } }
        )
      end
    end

    context "specific user" do
      let((:user)) { users.first }

      let(:query) do
        %(query GetUserById($userId: ID) {
          users(userId: $userId) {
            fullName
          }
        })
      end

      subject(:result) do
        MartianLibrarySchema.execute(query, variables: { userId: user.id }).as_json
      end

      it "returns a specific user" do
        expect(result.dig("data", "users")).to match_array(
            [ { "fullName" => "#{user.first_name} #{user.last_name}" } ]
        )
      end
    end
  end
end
