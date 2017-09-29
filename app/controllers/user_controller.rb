class UserController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@my_bookmarks = @user.bookmarks.group_by(&:topic)
  end
end
