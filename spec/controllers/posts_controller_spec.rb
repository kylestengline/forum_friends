require 'rails_helper'
require 'support/macros'

RSpec.describe PostsController, type: :controller do
  
  describe "Get edit" do
    before do 
      @joe = User.create(email: "joe@example.com", password: "password")
    end

    context "only the owner can edit their posts" do
      it "renders the edit template" do
        login_user(@joe)

        post = Post.create(title: "Title of post", content: "Content of my post", user: @joe)

        get :edit, id: post
        expect(response).to render_template :edit
      end
    end

    context "non owner is not allowed to edit posts" do
      it "redirects to the root path" do
        greg = User.create(email: "greg@example.com", password: "password")
        login_user(greg)

        post = Post.create(title: "Title of post", content: "Content of my post", user: @joe)

        get :edit, id: post
        expect(response).to redirect_to(root_path) 
        message = "You can't edit other users posts"
        expect(flash[:danger]).to eq message
      end
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
