require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  describe "user model" do
    context 'validations' do
      it 'requires a name,lastname,email,password' do
        u = User.new

        u.valid?

        expect(u.errors).to have_key(:first_name,:last_name,:email,:password)
      end

      it 'valid email' do
        u = User.new email: "aldo@gmail.com"
        u.valid?

        expect(u.erros.full_messages[0]).to eq("Email is invalid")
      end
    end
    it "returns the first_name and last_name concatenated" do
      u = User.new ({first_name: "aldo", last_name: "solorzano"})
      expect(u.full_name).to eq("Aldo Solorzano")
    end

    it 'email uniquieness'
      create(:user, first_name: "aldo", last_name: "solorzano",
              email:"aldo@gmail.com")

      u = User.new ({first_name: "aldo", last_name: "solorzano",
                    email:"aldo@gmail.com"})
      u.valid?
      expect(u.errors).to have_key(:title)
  end

end
