require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'can be created' do
    # creating the teacher
    john = instance_double(Teacher)
    allow(john).to receive(:save).and_return(true)

    # creating the student
    francois = instance_double(Student)
    allow(francois).to receive(:save).and_return(true)

    # creating the course
    testCourse = Course.new(teacher: john, student: francois, class_language: "EN")

    # testing the course
    expect(testCourse).to be_valid
  end
end
