require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:student)).to be_valid
  end
end
