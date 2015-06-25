module Spree
  class QaQuestionMailer < BaseMailer
    def question_email(question)
      @question = question
      @user = question.user unless question.user.nil?
      mail(to: @question.email, from: from_address, cc: from_address, subject: Spree.t('question_email.subject'))
    end
  end
end
