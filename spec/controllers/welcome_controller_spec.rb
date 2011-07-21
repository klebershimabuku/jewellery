require 'spec_helper'

describe WelcomeController do
  
  render_views

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it "gets the correct index view template" do
      get "index"
      response.should render_template("welcome/index")
    end
    
    it "should have the right title" do
      get 'index'
      response.should have_selector('title', :content => ' | Home')
    end
  end
  
  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    it 'should have the right title' do
      get 'about'
      response.should have_selector('title', :content => ' | About')
    end
  end

end
