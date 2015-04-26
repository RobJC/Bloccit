require 'rails_helper'

include Warden::Test::Helpers
  Warden.test_mode!

describe "Visiting Profiles" do
  
  before do 
    @user = create(:user)
    @post = create(:post, user: @user, title: "Post title")
    @comment = create(:comment, user: @user, post: @post, body: 'A Comment')
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
      @user = create(:user)
      login_as(@user, :scope => :user)
      @post = create(:post, user: @user, title: "Post title")
      @comment = create(:comment, user: @user, post: @post, body: 'A Comment')      
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)
    end
    
  end

end