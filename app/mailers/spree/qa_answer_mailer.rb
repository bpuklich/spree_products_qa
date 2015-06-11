module Spree
  class QaAnswerMailer < BaseMailer
    def answer_email(question)
      @question = question
      @user = question.user
      mail(to: @user.email, from: from_address, subject: Spree.t('answer_email.subject'))
    end
  end
end
