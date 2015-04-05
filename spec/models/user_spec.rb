require 'rails_helper'

describe User do
  
  include TestFactories
  
  describe "#favorited(post)" do
    
    before do
      @post = associated_post
      @post2 = associated_post title: "The second title."
      @user = authenticated_user
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
end