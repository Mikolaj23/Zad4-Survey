require 'spec_helper'

describe SurveysController do
  include Devise::TestHelpers

  before(:all) do
    @user = (:user)
    sign_in @user
    @survey = Survey.create(:title => 'test')
  end

  it " Survey should be showable" do
      get :show, :id => @survey
      response.should be_success
  end  

end
