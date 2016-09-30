require 'rails_helper'
require 'support/macros'

RSpec.describe CommentsController, type: :controller do

  describe "POST #create" do
    before do 
      @joe = User.create(email: "joe@example.com", password: "password")
    end

    context "signed in user" do
      it "can create a comment" do
        login_user(@joe)

        posts = Post.create(title: "The Title", content: "The content of my post", user: @joe)

        post :create, comment: { content: "Great Post"}, post_id: posts.id
        expect(flash[:success]).to eq("Comment created!")
      end
    end

    context "non-signed in user" do
      it "is redirected to the sign in page" do
        login_user nil
        posts = Post.create(title: "The Title", content: "The content of my post", user: @joe)

        post :create, comment: { content: "Great Post"},
        post_id: posts.id
        expect(response).to redirect_to new_user_session_path
      end
    end 
  end
end
