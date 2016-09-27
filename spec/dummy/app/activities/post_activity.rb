class PostActivity < Timeful::Activity
  def subscribers
    User.all
  end
end
