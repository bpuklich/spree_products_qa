require 'spree_core'
require 'spree_products_qa/engine'

module SpreeProductsQa
  # Enable or Disable user login requirement.
  mattr_accessor :require_login do
    true
  end

#   def self.send_email?
#     defined?(Redis) && Redis.current.connected?
#   end

  def self.setup
    yield self
  end
end
