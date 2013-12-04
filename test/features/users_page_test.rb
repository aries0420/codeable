require "test_helper"

feature "As an admin I want to change courses and delete users" do
  scenario "As an admin I want to change courses" do

    visit users_path

    click_on "Change Course"
    click_on "Change Role"

    page.text.must_include "User updated."

  end

end
