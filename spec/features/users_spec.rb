require 'spec_helper'
describe "Users pages" do

  describe "signup" do

    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit signup_path 
          fill_in "user_name", :with=>""
          fill_in "user_email", :with=>""
          fill_in "user_password", :with=>""
          fill_in "user_password_confirmation", :with=>""
          click_on 'Submit'
          #response.should render_template('users/new')
          #response.should have_selector('div#error_explanation')
          #page.should have_content('submit')
        end.should_not change(User, :count)

      end
    end

    describe "success" do
      it "should make a new user" do
        lambda do
          visit signup_path 
          fill_in "user_name", :with=>"test"
          fill_in "user_email", :with=>"test@gmail.com"
          fill_in "user_password", :with=>"123456"
          fill_in "user_password_confirmation", :with=>"123456"
          click_on 'Submit'
          #response.should render_template('users/new')
          #response.should have_selector('div#error_explanation')
          #page.should have_content('submit')
        end.should_not change(User, :count).by(1)

      end
    end

  end

  describe "signin" do

    describe "failure" do
      it "should not sign in" do
        visit login_path 
        fill_in "username", :with=>""
        fill_in "password", :with=>""
        click_button 'submit'
        response.should render_template('sessions/new')
      end
    end

    describe "success" do
      it "should sign in" do
        visit login_path 
        #user = Factory(:user)
        #fill_in "username", :with=>user.name
        #fill_in "password", :with=>user.password
        #click_button 
        #controller.should be_signed_in
      end
    end

  end
end
