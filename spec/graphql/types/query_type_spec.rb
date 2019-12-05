require "rails_helper"

RSpec.describe Types::QueryType do
  describe "items" do
    let!(:items) { create_pair(:item) }

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

  describe "users" do
    let!(:users) { create_pair(:user) }

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
end
