class BlogMailer < ApplicationMailer

  def create_mail(blog)
    @blog = blog
    mail to:@blog.user.email, subject:"#{@blog.title}が作成されました"
  end
end
