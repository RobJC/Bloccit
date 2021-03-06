require 'rails_helper'

describe User do
  
  describe "#favorited(post)" do
    
    before do
      @user = create(:user)
      @post = create(:post, user: @user)
      @post2 = create(:post, user: @user, title: "The second title.")
    end
    
    it "returns 'nil' if the user has not favorited the post" do
      expect( @user.favorited(@post) ).to be_nil
 
    end
    
    it "returns the appropriate favorite if it exists" do
      @user.favorites.where(post: @post).create
      
      expect(@user.favorited(@post)).to eq(@post.favorites.first)
    end
    
    it "returns 'nil' if the user has favorited a different post" do
      @user.favorites.where(post: @post2).create
      
      expect(@user.favorited(@post)).to be_nil
    end 
  end
  
  describe ".top_rated" do
 
     before do
       @user1 = create(:user_with_post_and_comment)
 
       @user2 = create(:user_with_post_and_comment)
       create(:comment, user: @user2)
     end
 
     it "returns users ordered by comments + posts" do
       expect( User.top_rated ).to eq([@user2, @user1])
     end
 
     it "stores a `posts_count` on user" do
       users = User.top_rated
       expect( users.first.posts_count ).to eq(1)
     end
 
     it "stores a `comments_count` on user" do
       users = User.top_rated
       expect( users.first.comments_count ).to eq(2)
     end
   end
end