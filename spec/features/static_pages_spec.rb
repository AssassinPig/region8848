require 'spec_helper'
describe "Static pages" do

  describe "Home page" do
    it "should have the content" do
       visit root_path 
       page.should have_content('主页')
    end
  end

  #describe "Posts page" do
  #  it "should have the content" do
  #    visit posts_path
  #    page.should have_content('新建日志')
  #  end
  #end

  describe "thanks page" do
    it "should have the content" do
      visit static_pages_thanks_path  
      page.should have_content('感谢')
    end
  end

  describe "about_me page" do
    it "should have the content" do
      visit static_pages_about_me_path  
      page.should have_content('关于我')
    end
  end

end
