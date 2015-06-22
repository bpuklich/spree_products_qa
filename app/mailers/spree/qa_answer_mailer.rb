module Spree
  class QaAnswerMailer < BaseMailer
    def answer_email(question)
      @question = question
      @user = question.user unless question.user.nil?
      mail(to: @question.email, from: from_address, subject: Spree.t('answer_email.subject'))
    end
  end
end
