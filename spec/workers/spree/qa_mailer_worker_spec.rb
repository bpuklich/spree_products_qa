require 'spec_helper'

describe Spree::QaMailerWorker do
  describe '#perform', sidekiq: :inline do
    let!(:store)   { create(:store) }
    let(:question) { create(:question_with_answer) }
    let(:user)     { double('User', email: 'email@example.com') }

    context 'basic mail configuration' do
      it 'will deliver an email' do
        allow_any_instance_of(Spree::Question).to receive(:user).and_return(user)
        expect {
          subject.perform(question.id)
        }.to change(ActionMailer::Base.deliveries, :size)
      end

      context 'without a user' do
        it 'will not deliver an email' do
          expect {
            subject.perform(question.id)
          }.to_not change(ActionMailer::Base.deliveries, :size)
        end
      end
    end
  end
end
