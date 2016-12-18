require 'rails_helper'

describe UsersController, type: :controller do
  describe 'with user login' do
    context 'GET #show' do
      let(:user){create(:user)}
      it "assigns the requested to @user" do
        get :show, id: user
        expect(assigns(:user)).to eq user
      end

      it "renders the :show templates" do
        get :show, id: user
        expect(response).to render_template :show
      end
    end

    context 'GET #edit' do
      let(:user){ create(:user) }
      before do
        @user = sign_in user
      end
      it "assigns the requested user to @user" do
        get :edit, id: @user
        expect(user).to eq(subject.current_user)
      end

      it "renders the :edit template" do
        get :edit, id: @user
        expect(response).to render_template :edit
      end
    end

    context 'PATCH #update' do
      let(:user){ create(:user) }
      before do
        @user = sign_in user
      end
      it "assigns the requested user to @user" do
        patch :update, id: @user
        expect(user).to eq(subject.current_user)
      end

      it "changes @user's attributes" do
        subject.current_user.username = "Mike"
        patch :update, id: subject.current_user.id
        expect(subject.current_user.username).to eq('Mike')
      end

      it "redirects root path" do
        patch :update, id: @user
        expect(response).to redirect_to root_path
      end

      it "sends flash messages" do
        patch :update, id: @user
        expect(flash[:success]).to eq "Your account has been updated successfully."
      end
    end
   end
end
