require 'rails_helper'

RSpec.feature "Home Page", type: :feature do
  it 'shows the static text Welcome to Aristutor' do
    visit root_path
    expect(page).to have_content('Welcome to Aristutor')
  end

  scenario "teacher can connect and access courses page" do
    teacher = FactoryBot.create(:teacher)

    visit root_path
    click_link "Connexion"
    fill_in "Email", with: teacher.email
    fill_in "Password", with: teacher.password
    click_button "Sign In"
    # uncomment to get screenshot
    # save_and_open_page

    expect(page).to have_content('All students')
  end
end
