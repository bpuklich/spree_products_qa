require 'sidekiq'

module Spree
  class QaMailerWorker
    include Sidekiq::Worker

    def perform(question_id)
      question = Spree::Question.find(question_id)
      if question.user.present?
        Spree::QaAnswerMailer.answer_email(question).deliver_now
      end
    end
  end
end
