require 'rails_helper'

describe PrototypesController, type: :controller do
  let(:prototype){create(:prototype)}

  # describe 'GET #new' do
  #   it "assigns the requested prototypes to @prototype" do
  #       get :new
  #       expect(assigns(:prototype)).to be_a_new(Prototype)
  #   end

  #   it "renders the :new template" do
  #       get :new, id: 1
  #       expect(response).to render_template :new
  #   end
  # end

  describe 'POST #create' do
    context 'with valid attriubtes' do
        user = login_user
        let(:prototype){create(:prototype)}
      it "saves the new prototype in the database" do
        binding.pry
        expect{post :create, prototype: prototype.id, prototype: attributes_for(:prototype)}.to change(Prototype, :count).by(1)
      end

      # it "redirects to root_path" do
      #   expect(response).to redirect_to new_user_session_path
      # end

      # it "shows flash messages to show save the prototype successfully" do
      #   expect(flash[:success]).to eq "Successfully created your prototype."
      # end
    end

    context 'with invalid attriubtes' do
      it "dose not save the new prototype in the database" do
        post :create, prototype: attributes_for(:prototype)
        expect{post :create, prototype: attributes_for(:prototype)}.not_to change(Prototype, :count)
      end

      it "redirects to new_prototype_path" do
        post :create, prototype: attributes_for(:prototype)
        expect(response).to render_template new_prototype_path(assigns[:prototype])
      end

      it "shows flash messages to show save the prototype unsuccessfully" do
        expect(flash[:alert]).to be_present
      end
    end
  end

  # describe 'GET #show' do
  #   it "assigns the requested prototype to @prototype" do
  #     prototype = create(:prototype)
  #     get :show, id: prototype
  #     expect(assigns(:prototype)).to eq prototype
  #   end

  #   it "assigns the requested comment to @comment" do
  #     prototype = create(:prototype)
  #     comment = create(:comment, prototype: prototype)
  #     get :show, id: prototype
  #     expect(assigns(:prototype)).to eq prototype
  #   end

  #   it "assigns likes associated with prototype to @likes" do
  #     prototype = create(:prototype)
  #     like = create(:like, prototype: prototype)
  #     get :show, id: prototype
  #     expect(assigns(:prototype)).to eq prototype
  #   end

  #   it "renders the :show template" do
  #     prototype = create(:prototype)
  #     get :show, id: prototype
  #     expect(response).to render_template :show
  #   end
  # end

  # describe 'GET #edit' do
  #   it "assigns the requested prototype to @prototype" do
  #     prototype = create(:prototype)
  #     get :edit, id: prototype
  #     expect(assigns(:prototype)).to eq prototype
  #   end

  #   it "assigns the main_image to @main_image" do
  #     prototype = create(:prototype)
  #     image =build(:image, status: 0, prototype: prototype)
  #     image2 =build(:image, status: 1, prototype: prototype)
  #     get :edit, id: prototype
  #     expect(assigns(:prototype)).to eq prototype
  #   end

  #   it "assigns the sub_images to @sub_images" do
  #     prototype = create(:prototype)
  #     image =build(:image, status: 0, prototype: prototype)
  #     image2 =build(:image, status: 1, prototype: prototype)
  #     get :edit, id: prototype
  #     expect(assigns(:prototype)).to eq prototype
  #   end

  #   it "renders the :edit template" do
  #     prototype = create(:prototype)
  #     get :edit, id: prototype
  #     expect(response).to render_template :edit
  #   end
  # end

  # describe 'PATCH #update' do
  #   context 'with valid attriubtes' do
  #     it "assigns the requested prototype to @prototype" do
        
        
  #     end

  #     it "assigns the requested comment to @comment" do
        
        
  #     end

  #     it "updates attriubtes of prototype" do
        
        
  #     end

  #     it "redirects to prototype_path" do
        
        
  #     end

  #     it "shows flash messages to show updates prototype successfully" do
        
        
  #     end
  #   end

  #   context 'with invalid attriubtes' do
  #     it "assigns the requested prototype to @prototype" do
        
        
  #     end

  #     it "dose not save the new prototype" do
        
        
  #     end

  #     it "renders the :show template" do
        
        
  #     end

  #     it "shows flash messages to show updates prototype unsuccessfully" do
        
        
  #     end
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   it "assigns the requested prototypes to @prototype" do
  #     delete :destory, id: prototype
  #     expect(assigns(:prototype)).to eq prototype
  #   end

  #   it "deletes the prototype" do
  #       expect{delete :destroy, id: @prototype}.to change(Prototype, :count).by(-1)
  #   end
  #   it "redirects to root_path" do
  #       delete :destroy, id: @prototype
  #       expect(response).to redirect_to root_path
  #   end

  #   it "shows flash messages to show delete prototype successfully" do
  #       delete :destroy, id: @prototype
  #       expect(prototype.flash[:success]).to include("successfully")
  #   end
  # end

  # describe 'without user login' do
  #   context 'GET #new' do
  #     it "redirects sign_in page" do
  #       get :new
  #       expect(response).to redirect_to new_user_session_path
  #     end
  #   end

  #   context 'POST #create' do
  #     it "redirects sign_in page" do
  #       expect(response).to redirect_to new_user_session_path
  #     end
  #   end

  #   context 'GET #edit' do
  #     it "redirects sign_in page" do
  #       expect(response).to redirect_to new_user_session_path
  #     end
  #   end

  #   context 'PATCH #update' do
  #     it "redirects sign_in page" do
  #       expect(response).to redirect_to new_user_session_path
  #     end
  #   end

  #   context 'DELETE #destroy' do
  #     it "redirects sign_in page" do
  #       expect(response).to redirect_to new_user_session_path
  #     end
  #   end
  # end
end
