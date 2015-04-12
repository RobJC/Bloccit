require 'rails_helper'

describe "Visiting Profiles" do
  
  include TestFactories
  
  before do 
    @user = authenticated_user
    @post = associated_post(user: @user)
    @comment = Comment.create(user: @user, post: @post, body: "A Comment")
    allow(@comment).to receive(:send_favorite_emails)
    @comment.save!
  end
  
  describe "not signed in" do
    
    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)
    end
    
  end
  
  before do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    user.confirmed_at = Time.now
    user.save
  end
  
  describe "sign in" do
    
    it "shows profile" do
      isit user_path(@user)
      expect(current_path).to eq(user_path(@user))
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)
    end
    
  end
end