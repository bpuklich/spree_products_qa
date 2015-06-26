module Spree
  class Answer < Spree::Base
    belongs_to :question, required: true, touch: true

    validates :content, presence: true

    after_create :send_email #, if: ->() { SpreeProductsQa.send_email? }

    after_touch :touch_product

    def send_email
      Spree::QaAnswerMailer.answer_email(question).deliver_later
      # Spree::QaMailerWorker.perform_async(self.question.id) if self.question.present?
    end

    private

    def touch_product
      question.product.update_all(updated_at: Time.current)
    end
  end
end
