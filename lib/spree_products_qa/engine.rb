module SpreeProductsQa
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_products_qa'

    config.autoload_paths += %W(#{config.root}/lib)

    # initializer "spree.products_qa.preferences", :after => "spree.environment" do |app|
    #   module Spree::ProductsQa
    #     Config = Spree::ProductsQaConfiguration.new
    #   end
    # end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
