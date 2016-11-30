require 'rails_helper'

describe UsersController, type: :controller do
  describe 'with user login' do
    # context 'GET #show' do
    #   it "assigns the requested to @user" do
    #     user = create(:user)
    #     get :show, id: user
    #     expect(assigns(:user)).to eq user
    #   end

    #   it "renders the :show templates" do
    #     user = create(:user)
    #     get :show, id: user
    #     expect(response).to render_template :show
    #   end
    # end
    context 'GET #edit' do
      user = login_user
      it "assigns the requested user to @user" do
        get :edit, id: user
        expect(assigns(:user)).to eq user
      end

      it "renders the :edit template" do
        binding.pry
        get :edit, id: user
        expect(response).to render_template :edit
      end
    end
    context 'PATCH #update' do
      user = login_user
      it "assigns the requested user to @user" do
        patch :update
        expect(assigns(:user)).to eq(user)
      end

      it "changes @user's attributes" do
        patch :update, user: attributes_for(:user, username: "Mike")
          user.reload
        expect(user.username).to eq('Mike')
      end

      it "redirects root path" do
        patch :update, user: attributes_for(:user, username: "bike")
          user.reload
        expect(response).to redirect_to root_path
      end

      it "sends flash messages" do
        patch :update, user: attributes_for(:user, username: "nike")
          user.reload
        expect(flash[:success]).to be_present
      end
    end
  end

  describe 'without user login' do
    context 'GET #edit' do
      it "redirects sign_in page" do
        user = create(:user)
        get :edit
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'PATCH #update' do
      it "redirects sign_in page" do
        user = create(:user)
        patch :update
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
