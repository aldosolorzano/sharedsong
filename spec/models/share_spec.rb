require 'rails_helper'

RSpec.describe Share, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "share model" do
    it "requires a title" do
      s = Share.new
      s.valid?

      expect(s.errors).to have_key(:title)
    end
  end
end
