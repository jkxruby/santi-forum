class GroupsController < ApplicationController
before_action :authenticate_user!
def index
  @groups = Group.all
end

def new
  @group = Group.new
end

def create
  @group = Group.new(group_params)
  @group.user = current_user
  if @group.save
    redirect_to groups_path
  else
    render :new
  end
end

def edit
  @group = Group.find(params[:id])
end

def update
  @group = Group.find(params[:id])
  if @group.update(group_params)
    redirect_to groups_path,notice: "ok,update success"
  else
    render :edit
  end
end

def show
  @group = Group.find(params[:id])
  @posts = @group.posts 
end

def destroy
  @group = Group.find(params[:id])
  @group.destroy
  redirect_to groups_path(@group), alert: "deleted,say bye"
end

private

def group_params
  params.require(:group).permit(:title, :description)
end



end
