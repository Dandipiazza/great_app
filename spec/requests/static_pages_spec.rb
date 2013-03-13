require 'spec_helper'

describe "Static pages" do

	subject { page }

	describe "home page" do

	    before { visit root_path }	

		it { should have_selector('h1', text: 'Welcome to TalkStream Beta') }
		it { should have_selector('title', text: "Talkstream Beta") }
		it { should_not have_selector('title', text: " | Home") }
	
	end	
	

	describe "help page" do

		before { visit help_path }
		
		it { should have_selector('h1', text: 'Help') }
 		it { should have_selector('title', text: "Help") }
	
	end			


	

	describe "About page" do

		before { visit about_path }

		it { should have_selector('h1', text: 'About Us') }
		it { should have_selector('title', text: "About Us") }

	end

	 					
		
	
	describe "Contact page" do

		before { visit contact_path }

		it { should have_selector('h1', text:'Contact') }
		it { should have_selector('title', text: "Contact") }
	 					

	end



	it "should have the right links on the layout" do

		visit root_path
	
		click_link "About"
		page.should have_selector 'title', text: full_title('About')

		click_link "Help"
		page.should have_selector 'title', text: full_title('Help')

		click_link "Contact"
		page.should have_selector 'title', text: full_title('Contact')


		click_link "Sign in"
		page.should have_selector 'title', text: full_title('Sign up')

		click_link "Home"
		click_link "Take the tour!"
		page.should have_selector 'title', text: full_title('Sign up')

	end

end
