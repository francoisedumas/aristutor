require 'rails_helper'

RSpec.describe Course, type: :model do
  before do
    @teacher = Teacher.create(
      first_name: "John",
      last_name: "Doe",
      email: "johnd@lewagon.com",
      password: "azerty"
    )

    @sophiejambon = Student.create(
      first_name: "Sophie",
      last_name: "Jambon",
      email: "jambon@lewagon.com",
      password: "azerty",
      phone_number: "0101010101",
      mother_language: "FR"
    )

    @jaimespa = Student.create(
      first_name: "Jaime",
      last_name: "Spa",
      email: "spa@lewagon.com",
      password: "azerty",
      phone_number: "0201010101",
      mother_language: "FR"
    )

    @bradjaime = Student.create(
      first_name: "Brad",
      last_name: "Jaime",
      email: "pitt@lewagon.com",
      password: "azerty",
      phone_number: "0301010101",
      mother_language: "FR"
    )
  end

  it "is valid with a teacher, a student and a class language" do
    course = Course.new(
      teacher: @teacher,
      student: @sophiejambon,
      class_language: "EN"
    )
    expect(course).to be_valid
  end

  it "is invalid without a class language" do
    course = Course.new(class_language: nil)
    course.valid?
    expect(course.errors[:class_language]).to include("can't be blank")
  end

  describe "search course for a student" do
    before do
      @course = Course.create(
        teacher: @teacher,
        student: @sophiejambon,
        class_language: "EN"
      )
      @course1 = Course.create(
        teacher: @teacher,
        student: @jaimespa,
        class_language: "EN"
      )
      @course2 = Course.create(
        teacher: @teacher,
        student: @bradjaime,
        class_language: "EN"
      )
    end

    context "when a match is found" do
      it "returns students that match the search" do
        expect(Course.where(teacher: @teacher).search_by_first_and_last_name("Jaime")).to include(@course1, @course2)
      end
    end

    context "when no match is found" do
      it "returns an empty collection" do
        expect(Course.where(teacher: @teacher).search_by_first_and_last_name("francois")).to be_empty
      end
    end
  end
end
