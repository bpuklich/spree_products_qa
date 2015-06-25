require 'spec_helper'

describe Spree::QaQuestionMailer, type: :mailer do
  it "renders product information" do
    question = build(:question)
    mail = Spree::QaQuestionMailer.question_email(question)
    expect(mail.body.encoded).to match(question.product.name)
    expect(mail.body.encoded).to match(spree.product_path(question.product))
  end
end
