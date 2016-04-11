class GroupsController < ApplicationController
  before_action :authenticate_with_token!

  def create
    name = params[:name]
    if Group.find_by(name: name)
      render json: {error: "That group name already exists"}, status: 421
    end
    group = Group.new(name: name)
    @current_user.group = group
    @current_user.group_pending = false
    if group.save && @current_user.save
      render json: {name: group.name, id: group.id}, status: 200
    end
  end

  def request_join
    request_name = params[:name]
    request_group = Group.find_by(name: request_name)
    if !request_group
      render json: {error: "That group doesn't exist"}, status: 421
    end
    @current_user.group = request_group
    @current_user.group_pending = true
    if @current_user.save
      render json: {message: "Request submitted", user: @current_user.handle}, status: 200
    end
  end

  def approve
    pending_user = User.find_by(email: params[:email])
    pending_user.group_pending = false
    if pending_user.save
      render json: {message: "Member approved"}, status: 200
    end
  end

  def get_members
    group = @current_user.group
    if !group
      render json: {message: "User not in any groups"}, status: 421
    end
    users = group.users
    render json: users, status: 200
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end
