require 'spec_helper'

describe Spree::QaAnswerMailer, type: :mailer do
  it "renders product information" do
    question = build(:question)
    answer = build(:answer, question: question)
    mail = Spree::QaAnswerMailer.answer_email(question)
    expect(mail.body.encoded).to match(question.product.name)
    expect(mail.body.encoded).to match(spree.product_path(question.product))
  end
end
