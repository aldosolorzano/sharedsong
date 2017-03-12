require 'rails_helper'

RSpec.describe SharesController, type: :controller do
  describe "#new" do
    before do
      get :new
    end
    it "renders a new template" do
      expect(response).to render_template(:new)
    end

    it "contains @share variable " do
      get :new

      expect(assigns(:share)).to be_a_new Share
    end
  end
    describe '#create'do
      context 'with valid attr' do

        it 'cerates a new share in db' do
          count_before = Share.count
          post(:create, params: { share: {
            title: "test"
            }})
          count_after = Share.count
          expect(count_after).to eq(count_before + 1)
        end

        it "redirects to dashboard:root" do
          post(:create, params: { share: {
            title: "test",
            }})
          expect(response).to redirect_to(root_path)
        end
      end

      context 'with invalid attr' do
        it "doesnt creates a new share in db" do
          count_before = Share.count
          post(:create, params:{ share:{
            }})
          count_after = Share.count
          expect(count_after).to eq(count_before+1)
        end
        it "renders :new" do
          post(:create, params:{ share:{
            }})
          expect(response).to render_temple(:new)
        end
      end
    end

end
