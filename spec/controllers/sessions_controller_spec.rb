require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:user) { create :user }

      it 'redirects to videos_path' do
        post :create, email: user.email, password: '123456'
        expect(response).to redirect_to videos_path
      end
    end

    context 'with invalid params' do
      it 'renders the new template' do
        post :create
        expect(response).to render_template :new
      end

      it 'sets error message' do
        post :create
        expect(flash[:error]).to_not be_blank
      end
    end
  end

end
