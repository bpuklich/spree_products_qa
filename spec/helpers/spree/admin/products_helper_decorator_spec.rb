require "spec_helper"

describe Spree::Admin::ProductsHelper do
  describe "#qna_tab_label" do
    it 'works' do
      expect(helper.qna_tab_label).to eq "#{Spree.t(:questions_and_answers)} (0)"
    end
  end
end
