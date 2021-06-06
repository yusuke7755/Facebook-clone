module PostsHelper

  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_posts_path

    elsif action_name == 'edit' || action_name == 'update'
      confirm_post_path(@post.id)
    end
  end

  def confirm_new_or_edit
    unless @post.id?
      posts_path
    else
      post_path(@post)
    end
 end

 def confirm_form_method
  @post.id ? 'patch' : 'post'
end

end
