# spec/controllers/registrations_controller_spec.rb
require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new user to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) do
        {
          user: {
            first_name: 'John',
            last_name: 'Doe',
            email: 'john.doe@example.com',
            phone_number: '1234567890',
            password: 'password123',
            password_confirmation: 'password123'
          }
        }
      end

      it 'creates a new user' do
        expect do
          post :create, params: valid_params
        end.to change(User, :count).by(1)
      end

      it 'redirects to the root path with a notice' do
        post :create, params: valid_params
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to be_present
      end
    end

    context 'with invalid params' do
      let(:invalid_params) do
        {
          user: {
            first_name: 'John',
            last_name: 'Doe',
            email: 'invalid_email', # Invalid email format
            phone_number: '1234567890',
            password: 'password',
            password_confirmation: 'password'
          }
        }
      end

      it 'does not create a new user' do
        expect do
          post :create, params: invalid_params
        end.not_to change(User, :count)
      end

      it 'renders the new template with unprocessable_entity status' do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
