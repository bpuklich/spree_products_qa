module Spree
  class Answer < Spree::Base
    belongs_to :question

    validates :content, presence: true

    after_create :send_email #, if: ->() { SpreeProductsQa.send_email? }

    def send_email
      Spree::QaMailerWorker.perform_async(self.question.id) if self.question.present?
    end
  end
end
