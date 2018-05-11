require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:user_params) do
        { user: { email: 'test@example.org', password: '123456' } }
      end

      it 'redirects to login' do
        post :create, user_params
        expect(response).to redirect_to login_path
      end

      it 'creates a user' do
        expect{ post :create, user_params }.to change{ User.count }.by 1
      end
    end

    context 'with invalid params' do
      let(:user_params) do
        { user: { email: 'test@example.org' } }
      end

      it 'renders the new template' do
        post :create, user_params
        expect(response).to render_template :new
      end

      it 'does not create a user' do
        expect{ post :create, user_params }.to_not change{ User.count }
      end
    end
  end

end
