class GroupsController < ApplicationController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]

  def create
    group = Group.new(group_params)
    @current_user.group = group
    if group.save && @current_user.save
      render json: {name: group.name, id: group.id}
    end
  end


  private
  def group_params
    params.require(:group).permit(:name)
  end

end
