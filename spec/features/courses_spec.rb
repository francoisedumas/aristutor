require 'rails_helper'

RSpec.feature "Courses", type: :feature do

  scenario "cannot be accessed if disconnected" do
    visit courses_path
    expect(page).to have_content "Sign in to Aristutor"
  end

  scenario 'shows all students and filter by name' do
    # Teacher
    teacher = FactoryBot.create(:teacher)
    # Students
    sophiejambon = FactoryBot.create(:student)
    # For below students need to pass specific names in order to test PGsearch
    jaimepitt = FactoryBot.create(:student, first_name: "Jaime", last_name: "Pitt")
    bradjaime = FactoryBot.create(:student, first_name: "Brad", last_name: "Jaime")
    # Courses
    course = FactoryBot.create(:course, teacher: teacher, student: sophiejambon)
    course1 = FactoryBot.create(:course, teacher: teacher, student: jaimepitt)
    course2 = FactoryBot.create(:course, teacher: teacher, student: bradjaime)

    # Simulate the connection
    visit root_path
    click_link "Connexion"
    fill_in "Email", with: teacher.email
    fill_in "Password", with: teacher.password
    click_button "Sign In"

    # Lands on the courses page
    # # uncomment to get screenshot
    # save_and_open_page
    expect(page).to have_content('All students')
    expect(page).to have_content "Jaime"

    # Simulate the search bar usage
    fill_in "Find a student", with: "Jaime"
    expect(page).to have_selector("input[value='Jaime']")
    click_button ""
    expect(page).not_to have_content("Sophie")
    # # uncomment to get screenshot
    # save_and_open_page
  end

  scenario 'connexion and then go to profil page' do
    # Teacher
    teacher = FactoryBot.create(:teacher)
    # Simulate the connection
    visit root_path
    click_link "Connexion"
    fill_in "Email", with: teacher.email
    fill_in "Password", with: teacher.password
    click_button "Sign In"

    visit teacher_path
    # # uncomment to get screenshot
    # save_and_open_page
  end
end
