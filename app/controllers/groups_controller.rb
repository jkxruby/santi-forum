class GroupsController < ApplicationController

def index
  @groups = Group.all
end

def new
  @group = group.new
end

def create
  @group = group.new(group_params)
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
end

private

def group_params
  params.require(:group).permit(:title, :description)
end



end
