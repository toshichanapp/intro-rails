class BlogMailer < ApplicationMailer

  def create_mail(blog)
    @blog = blog
    mail to:@blog.user.email, subject:"#{@blog.title}が作成されました"
  end

  # def deliver_later!
  #   deliver_now!
  # end

  # def deliver_late
  #   deliver_now
  # end
end
