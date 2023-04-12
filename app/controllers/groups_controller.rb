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
    @group = current_user.groups.build(group_params)
    @group.process_icon_data

    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      render :new
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
    params.require(:group).permit(:name, :icon_data, :description, :user_id).merge(user: current_user)
  end
end
