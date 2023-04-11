class GroupsController < ApplicationController
  load_and_authorize_resource

  # display default cartegory
  def index
    @groups = Group.all
  end

  # display a specific group
  def show; end

  # display the form to create a new group
  def new
    @group = Group.new
  end

  # display the form to edit an existing group
  def edit; end

  # create a new group
  def create
    @group = Group.new(group_params)
    @group.user = current_user

    if @group.save
      redirect_to @group
    else
      render 'new'
    end
  end

  # update an existing group
  def update
    if @group.update(group_params)
      redirect_to @group
    else
      render 'edit'
    end
  end

  # delete an existing group
  def destroy
    @group.destroy
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
