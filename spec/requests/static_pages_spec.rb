require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home Page" do
  	before { visit root_path }

    it { should have_selector("title", text: "Rails sample application") }
    it { should have_selector("h1", text: "Sample App") }
    it { should_not have_selector("title", text: "| Home") }
  end

  describe "Help page" do
  	before { visit help_path }

  	it { should have_selector("title", text: "Rails sample application | Help") }
  	it { should have_selector("h1", text: "Help") }  	
  end

  describe "About page" do
  	before { visit about_path }

  	it { should have_selector("title", text: "Rails sample application | About us") }
  	it { should have_selector("h1", text: "About us") }
  end
end
