class PostPolicy
  def initialize(user, post)
    @user = user
    @post = post
  end
  
  def can_edit_or_delete?
    @user.children.any? { |child| child.id == @post.child_id }
  end
end