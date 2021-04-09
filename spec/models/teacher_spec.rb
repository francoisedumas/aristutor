require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:teacher)).to be_valid
  end

  subject(:john) {
    Teacher.create(
      first_name: "John",
      last_name: "Doe",
      email: "johnd@lewagon.com",
      password: "azerty"
    )
  }

  it 'is created' do
    expect(john).to be_valid
  end

  it 'can be checked for object attribute and proper values' do
    expect(john).to have_attributes(first_name: 'John', email: 'johnd@lewagon.com')
  end

  it "is invalid without a first name" do
    teacher = FactoryBot.build(:teacher, first_name: nil)
    teacher.valid?
    expect(teacher.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a last name" do
    teacher = FactoryBot.build(:teacher, last_name: nil)
    teacher.valid?
    expect(teacher.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    teacher = FactoryBot.build(:teacher, email: nil)
    teacher.valid?
    expect(teacher.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    # BEFORE
    # Teacher.create(
    #   first_name: "John",
    #   last_name: "Doe",
    #   email: "johnd@lewagon.com",
    #   password: "azerty"
    # )

    # teacher = Teacher.new(
    #   first_name: "Tester",
    #   last_name: "Doe",
    #   email: "johnd@lewagon.com",
    #   password: "azerty"
    # )
    # AFTER
    FactoryBot.create(:teacher, email: "john@example.com")
    teacher = FactoryBot.build(:teacher, email: "john@example.com")
    teacher.valid?
    expect(teacher.errors[:email]).to include("has already been taken")
  end

  context 'new teacher' do
    subject(:nice) {Teacher.create(first_name: "Brice", last_name: "Nice", password: "azerty", email: "bnice@lewagon.com")}

    it 'also has a last name' do
      expect(nice).to have_attributes(last_name: 'Nice')
    end
  end

  context 'a very new teacher' do
    it 'is also added to database with change' do
      expect {
        Teacher.create(first_name: "Lorem", last_name: "Lorem", password: "azerty", email: "lorem@lewagon.com")
      }.to change { Teacher.count }
    end
  end
end
