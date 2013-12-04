require "test_helper"

feature "A fully functional home page" do
  scenario "As a visitor I want to get started" do

    visit root_path

    click_on "Get Started"

    page.text.must_include "Subscribe"

  end

  scenario "As a visitor I want to contact someone with my questions" do

    visit root_path

    click_on "Contact"

    page.text.must_include "Contact Us"

  end

  scenario "As a visitor I want to contact someone with my questions from a different link" do

    visit root_path

    click_on "contact us"

    page.text.must_include "Contact Us"

  end

  scenario "As a visitor I want to subscribe for the evening class" do

    visit root_path

    click_on "subscribe"

    fill_in "Email", with: "user1000@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Credit Card Number", with: "4242424242424242"
    fill_in "Card Security Code (CVV)", with: "4242"

    click_on "Sign up"

  end

  scenario "As a user I want to sign in" do

    visit new_user_session_path
    fill_in "Email", with: "user2@example.com"
    fill_in "Password", with: "password"
    click_on "Sign in"

  end

end
