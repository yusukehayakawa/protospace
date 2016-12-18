require 'rails_helper'

feature "Spec for Sign up" do
    background do
      visit '/'
    end
    given(:sign_up_user){ build(:user) }
  scenario "should create new user account" do
    click_link 'Get Started'
    click_link 'Sign up now'
    fill_in 'Username', with: sign_up_user.username
    attach_file 'user[avatar]', "spec/fixtures/aaproto4-2.jpg"
    fill_in 'E-Mail', with: sign_up_user.email
    fill_in 'Password', with: sign_up_user.password
    fill_in 'Member', with: sign_up_user.member
    fill_in 'Profile', with: sign_up_user.profile
    fill_in 'Works', with: sign_up_user.works
    click_button 'Save'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end


feature "Spec for Sign in and crate prototype" do
    background do
      visit '/'
    end
    given(:sign_in_user){ create(:user) }
    given(:prototype){ build(:prototype, id: 1) }
  scenario 'sign in' do
    click_link 'Get Started'
    fill_in 'Email address', with: sign_in_user.email
    fill_in 'Password', with: sign_in_user.password
    click_button 'Sign in'

    click_link 'New Proto'
    fill_in 'Title', with: prototype.name
    fill_in 'Catch Copy', with: prototype.catch_copy
    fill_in 'Concept', with: prototype.concept
    attach_file 'prototype[images_attributes][0][image]', "spec/fixtures/aaproto4-2.jpg"
    click_button 'Publish'
    expect(page).to have_content "Successfully created your prototype."
  end
end
