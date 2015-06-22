class AddEmailToSpreeQuestions < ActiveRecord::Migration
  def change
    add_column :spree_questions, :email, :string
  end
end
