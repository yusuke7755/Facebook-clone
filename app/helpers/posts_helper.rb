module PostsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_posts_path
    end
  end

  def confirm_new_or_edit
    unless @post.id?
      posts_path
    else
      post_path(@post)
    end
  end
    
end
