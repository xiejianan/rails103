class PostsController < ApplicationController
  before_action :authenticate_user!,:only => [:new,:create]

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post_group = @group
  end

  def update
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post.group = @group
    @post.user = current_user

    if @post.update(post_params)
  redirect_to account_posts_path, notice: "編輯成功"
else
  render :edit
end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "删除文章成功"
    redirect_to groups_path
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
end

private

def post_params
  params.require(:post).permit(:content)
end

end
