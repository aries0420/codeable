require 'spec_helper'

describe ContentController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @user.add_role :silver # gives the user a role. tests pass regardless of role
  end

  describe "GET 'silver'" do
    it "returns http success" do
      get 'silver'
      response.should @user.has_role?(:silver) ? be_success : redirect_to(root_url)
    end
  end

  describe "GET 'gold'" do
    it "returns http success" do
      get 'gold'
      response.should @user.has_role?(:gold) ? be_success : redirect_to(root_url)
    end
  end

  describe "GET 'evening'" do
    it "returns http success" do
      get 'evening'
      response.should @user.has_role?(:evening) ? be_success : redirect_to(root_url)
    end
  end

end
