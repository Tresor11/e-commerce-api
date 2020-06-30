require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:item_id) }
  it { should belong_to(:user) }
  it { should belong_to(:item) }
end
