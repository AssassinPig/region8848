require 'spec_helper'

describe User do

  before(:each) do 
    @attr = {
     :name => 'test_spec', 
     :email => 'testSpec@gmail.com',
     :password => '123456',
     :password_confirmation => '123456'
    }
  end

  it "should create user with validata params" do
    User.create!(@attr)
  end

  it "should require name" do
    no_name_user = User.new(@attr.merge(:name=>''))
    no_name_user.should_not be_valid
  end

  it "should require email" do
    no_email_user = User.new(@attr.merge(:email=>''))
    no_email_user.should_not be_valid
  end

  it "should accept validate email" do
    emails = %w[testxspec@gmail.com test@153.com test@hotmail.cn]
    emails.each do |e|
      validate_email_user = User.new(@attr.merge(:email=>e))
      validate_email_user.should be_valid
    end
  end

  it "should reject invalidate email" do
    emails = %w[sfo@SDFM,com]
    emails.each do |e|
      invalidate_email_user = User.new(@attr.merge(:email=>e))
      invalidate_email_user.should_not be_valid
    end
  end

end
