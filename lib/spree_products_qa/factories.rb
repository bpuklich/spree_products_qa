FactoryGirl.define do
  factory :answer, class: Spree::Answer do
    content 'Answer'
    factory :question_with_answer do
      question
    end
  end

  factory :question, class: Spree::Question do
    email 'foo@bar.com'
    content 'What is the question?'
    association :product, factory: :base_product
  end
end
