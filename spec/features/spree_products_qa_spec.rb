require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe 'Products QA page', type: :feature do
  include_context "custom products"

  it 'does not display products qa form' do
    product = Spree::Product.find_by_name("Ruby on Rails Ringer T-Shirt")
    visit spree.product_path(product)
    page.should_not have_selector "form#new_question"
  end

  it 'displays products qa form properly' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :spree_user)
    product = Spree::Product.find_by_name("Ruby on Rails Ringer T-Shirt")
    visit spree.product_path(product)
    within "form#new_question" do
      page.should have_selector "textarea#question_content"
    end
  end
end
