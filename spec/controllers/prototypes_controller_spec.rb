require 'rails_helper'

describe PrototypesController, type: :controller do

  describe 'GET #new' do
    before do
      login_user
    end
    it "assigns the requested prototypes to @prototype" do
        get :new
        expect(assigns(:prototype)).to be_a_new(Prototype)
    end

    it "renders the :new template" do
        get :new
        expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attriubtes' do
      before do
        login_user
        @images = [attributes_for(:image, status: "main"),
                   attributes_for(:image, status: "sub")]
      end
      let(:prototype){ create(:prototype) }
      it "saves the new prototype in the database" do
        expect{ post :create, prototype: prototype.id, prototype: attributes_for(:prototype) }.to change(Prototype, :count).by(1)
      end

      it "redirects to root_path" do
        post :create, prototype: prototype.id, prototype: attributes_for(:prototype, images_attributes: @images)
        expect(response).to redirect_to root_path
      end

      it "shows flash messages to show save the prototype successfully" do
        post :create, prototype: prototype.id, prototype: attributes_for(:prototype, images_attributes: @images)
        expect(flash[:success]).to eq "Successfully created your prototype."
      end
    end

    context 'with invalid attriubtes' do
      before do
        login_user
      end
      let(:prototype){ build(:prototype) }
      it "dose not save the new prototype in the database" do
        post :create, prototype: attributes_for(:prototype)
        expect{post :create, prototype: attributes_for(:prototype)}.not_to change(Prototype, :count)
      end

      it "render template new_prototype_path" do
        post :create, prototype: attributes_for(:prototype)
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    let(:prototype){ create(:prototype) }
    it "assigns the requested prototype to @prototype" do
      get :show, id: prototype
      expect(assigns(:prototype)).to eq prototype
    end

    it "assigns the requested comment to @comment" do
      comment = create(:comment, prototype: prototype)
      get :show, id: prototype
      expect(assigns(:prototype)).to eq prototype
    end

    it "assigns likes associated with prototype to @likes" do
      like = create(:like, prototype: prototype)
      get :show, id: prototype
      expect(assigns(:prototype)).to eq prototype
    end

    it "renders the :show template" do
      get :show, id: prototype
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    let(:prototype){ create(:prototype) }
    before do
      login_user
    end
    it "assigns the requested prototype to @prototype" do
      get :edit, id: prototype
      expect(assigns(:prototype)).to eq prototype
    end

    it "assigns the main_image to @main_image" do
      image =build(:image, status: 0, prototype: prototype)
      image2 =build(:image, status: 1, prototype: prototype)
      get :edit, id: prototype
      expect(assigns(:prototype)).to eq prototype
    end

    it "assigns the sub_images to @sub_images" do
      image =build(:image, status: 0, prototype: prototype)
      image2 =build(:image, status: 1, prototype: prototype)
      get :edit, id: prototype
      expect(assigns(:prototype)).to eq prototype
    end

    it "renders the :edit template" do
      get :edit, id: prototype
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    before do
        login_user
        @prototype = create(:prototype, name: "yusuke")
      end
    context 'with valid attriubtes' do
      it "assigns the requested prototype to @prototype" do
        patch :update, id: @prototype, prototype: attributes_for(:prototype)
        expect(assigns(:prototype)).to eq(@prototype)
      end

      it "assigns the requested comment to @comment" do
        comment = create(:comment, prototype: @prototype)
        patch :update, id: @prototype.id, prototype: attributes_for(:prototype)
        expect(@prototype.comments).to include comment
      end

      it "updates attriubtes of prototype" do
        patch :update, id: @prototype, prototype: attributes_for(:prototype, name: "hayakawa")
        @prototype.reload
        expect(@prototype.name).to eq("hayakawa")
      end

      it "redirects to root_path" do
        patch :update, id: @prototype, prototype: attributes_for(:prototype)
        expect(response).to redirect_to root_path
      end

      it "shows flash messages to show updates prototype successfully" do
        patch :update, id: @prototype, prototype: attributes_for(:prototype)
        expect(flash[:success]).to eq "Prototype was successfully updated."
      end
    end

    context 'with invalid attriubtes' do
      it "dose not save the new prototype" do
        patch :update, id: @prototype, prototype: attributes_for(:prototype, name: "hayakawa")
        expect{ @prototype.reload }.to change(Prototype, :count).by(0)
      end

      it "renders the :edit template" do
        patch :update, id: @prototype, prototype: attributes_for(:prototype, name: "")
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      login_user
      @prototype = create(:prototype)
    end

    it "deletes the prototype" do
      expect{delete :destroy, id: @prototype}.to change(Prototype, :count).by(-1)
    end

    it "redirects to root_path" do
        delete :destroy, id: @prototype
        expect(response).to redirect_to root_path
    end

    it "shows flash messages to show delete prototype successfully" do
        delete :destroy, id: @prototype
        expect(flash[:success]).to eq "Prototype was successfully deleted."
    end
  end

  describe 'without user login' do
    let(:prototype){ create(:prototype) }
    context 'GET #new' do
      it "redirects sign_in page" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'POST #create' do
      it "redirects sign_in page" do
        post :create
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'GET #edit' do
      it "redirects sign_in page" do
        get :edit, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'PATCH #update' do
      it "redirects sign_in page" do
        patch :update, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'DELETE #destroy' do
      it "redirects sign_in page" do
        delete :destroy, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
