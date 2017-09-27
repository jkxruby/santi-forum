class PostsController < ApplicationController
before_action :authenticate_user!

def new
  @group = Group.find(params[:id])
  @post.group = @group
  @post = Post.new
end

def create
  @group = Group.find(params[:id])
  @post.group = @group
  @post.user = current_user
  @post = Post.new(post_params)
  if @post.save
    redirect_to group_path(group),notice: "ok, new post"
  else
    render :new
  end
end




end
