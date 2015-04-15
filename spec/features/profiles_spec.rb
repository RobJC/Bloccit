require 'rails_helper'

describe "Visiting Profiles" do
  
  include TestFactories
  
  before do 
    @user = authenticated_user
    @post = associated_post(user: @user, title: "Post title")
    @comment = comment_without_email(user: @user, post: @post, body: 'A Comment')
  end
  
  after do    
    Warden.test_reset! 
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
  
  
  describe "sign in" do
    
    it "shows profile" do
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user)
      @user.confirmed_at = Time.now
      @user.save
      @post = associated_post(user: @user, title: "Post title")
      @comment = comment_without_email(user: @user, post: @post, body: 'A Comment')      
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)
    end
    
  end

end