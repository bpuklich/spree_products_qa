module Spree
  class QuestionsController < Spree::StoreController
    before_filter :load_data

    def create
      question = @product.questions.new(allowed_params)
      if current_spree_user.present?
        question.email = current_spree_user.email # discard form input value
        question.user_id = current_spree_user.id
      end
      if question.save
        flash[:notice] = Spree.t(:'question.sent')
        redirect_to @product
      else
        flash[:error] = question.errors.full_messages.to_sentence
        redirect_to @product
      end
    end

    private
    def load_data
      @product = Spree::Product.find(allowed_params[:product_id])
    end

    def allowed_params
      params.require(:question).permit(:email, :content, :product_id)
    end
  end
end
