require 'rails_helper'

RSpec.describe VideosController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    context 'as not logged in user' do
      it 'requires login' do
        get :new
        expect(response).to require_login
      end
    end

    context 'as logged in user' do
      let(:user) { create :user }
      before { login_user user }

      it 'returns http success' do
        get :new
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST #create' do
    context 'as not logged in user' do
      it 'requires login' do
        post :create
        expect(response).to require_login
      end
    end

    context 'as logged in user' do
      let(:user) { create :user }
      before { login_user user }
      context 'with valid params' do
        let(:video_params) do
          { video: { name: 'test', user_id: user.id } }
        end
        it 'redirects to videos' do
          post :create, video_params
          expect(response).to redirect_to videos_path
        end

        it 'creates a video record' do
          expect{post :create, video_params}.to change{ Video.count }.by 1
        end
      end

      context 'with invalid params' do
        let(:video_params) do
          { video: { name: ' ' } }
        end
        it 'renders the new  template' do
          post :create, video_params
          expect(response).to render_template :new
        end

        it 'does not create a video record' do
          expect{post :create, video_params}.to_not change{ Video.count }
        end
      end

    end
  end

  describe 'GET #show' do
    let(:video) { create :video }
    it 'returns http success' do
      get :show, id: video.id
      expect(response).to have_http_status(:success)
    end

    it 'updates views' do
      expect { get :show, id: video.id }.to change { video.reload.views }.by 1
    end
  end

end
