class FavoriteMailer < ActionMailer::Base
  default from: "robert.jcb.cole@gmail.com"
  
  def new_comment(user, post, comment)
    
    # New headers
    headers["Message-ID"] = "<comments/#{comment.id}@robcole-bloccit.herokuapp.com"
    headers["In-Reply-To"] = "<post/#{post.id}@robcole-bloccit.herokuapp.com"
    headers["References"] = "<post/#{post.id}@robcole-bloccit.herokuapp.com"
    
    @user = user
    @post = post
    @comment = comment
    
    mail(to: user.email, subject: "New comment on #{post.title}")
  end
  
end
