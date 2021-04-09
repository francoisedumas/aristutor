require 'rails_helper'

RSpec.describe Course, type: :model do
  before do
    # Teacher
    @teacher = FactoryBot.create(:teacher)
    # Students
    @sophiejambon = FactoryBot.create(:student)
    # For below students need to pass specific names in order to test PGsearch
    @jaimespa = FactoryBot.create(:student, first_name: "jaime")
    @bradjaime = FactoryBot.create(:student, last_name: "jaime")
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
        # see specific names passed to student with factory bot
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
