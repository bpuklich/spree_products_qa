shared_context "custom products" do
  before(:each) do
    taxonomy = FactoryGirl.create(:taxonomy, :name => 'Categories')
    root = taxonomy.root
    clothing_taxon = FactoryGirl.create(:taxon, :name => 'Clothing', :parent_id => root.id)
    mugs_taxon = FactoryGirl.create(:taxon, :name => 'Mugs', :parent_id => root.id)

    taxonomy = FactoryGirl.create(:taxonomy, :name => 'Brands')
    root = taxonomy.root
    rails_taxon = FactoryGirl.create(:taxon, :name => 'Ruby on Rails', :parent_id => root.id)

    FactoryGirl.create(:custom_product, :name => 'Ruby on Rails Ringer T-Shirt', :price => '19.99', :taxons => [rails_taxon, clothing_taxon])
    FactoryGirl.create(:custom_product, :name => 'Ruby on Rails Mug', :price => '15.99', :taxons => [rails_taxon, mugs_taxon])
  end
end
