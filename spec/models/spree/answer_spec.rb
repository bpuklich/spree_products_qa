require 'spec_helper'

describe Spree::Answer, type: :model do
  describe '#send_email' do
    let(:answer) { build(:answer, question: create(:question)) }

    it 'should email the answer' do
      reset_spree_preferences do |config|
        config.enable_mail_delivery = true
      end
      allow_any_instance_of(Spree::BaseMailer).to receive(:from_address).and_return("spree@example.com")
      expect {
        answer.save
      }.to change(ActionMailer::Base.deliveries, :size).by(1)
    end
  end
end
