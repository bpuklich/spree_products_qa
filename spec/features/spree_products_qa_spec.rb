require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe 'Product page', type: :feature do
  include_context "custom products"

  context "with user login required" do
    before :each do
      SpreeProductsQa.require_login = true
    end

    it 'does not display products QA form when user not logged in' do
      product = Spree::Product.find_by_name("Ruby on Rails Ringer T-Shirt")
      visit spree.product_path(product)
      page.should_not have_selector "form#new_question"
    end

    it 'displays products QA form properly when user logged in' do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :spree_user)
      product = Spree::Product.find_by_name("Ruby on Rails Ringer T-Shirt")
      visit spree.product_path(product)
      within "form#new_question" do
        page.should_not have_field "question[email]"
        page.should have_field "question[content]"
      end
    end
  end

  context "with user login NOT required" do
    before :each do
      SpreeProductsQa.require_login = false
    end

    it 'displays the full products qa form when user not logged in' do
      product = Spree::Product.find_by_name("Ruby on Rails Ringer T-Shirt")
      visit spree.product_path(product)
      within "form#new_question" do
        page.should have_field "question[email]"
        page.should have_field "question[content]"
      end
    end

    it 'displays products qa form with readonly email input when user is logged in' do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :spree_user)
      product = Spree::Product.find_by_name("Ruby on Rails Ringer T-Shirt")
      visit spree.product_path(product)
      within "form#new_question" do
        page.should have_field "question[email]", with: user.email
        page.should have_field "question[content]"
      end
    end
  end
end
