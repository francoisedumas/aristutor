require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe 'creation' do
    it 'can be created' do
      teacher = Teacher.create(first_name: "John", last_name: "Doe", password: "azerty", email: "john@lewagon.com")

      expect(teacher).to be_valid
    end
  end
end

