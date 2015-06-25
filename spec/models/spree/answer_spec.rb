require 'spec_helper'

describe Spree::Answer, type: :model do
  describe '#send_email' do
    let(:answer) { build(:answer, question: create(:question)) }

    it 'should email the answer AND original question' do
      expect {
        answer.save
      }.to change(ActionMailer::Base.deliveries, :size).by(2)
    end
  end
end
