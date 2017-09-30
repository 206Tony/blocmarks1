class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_user!

  def create
    # Find user email using params[:sender]
    # Find topic using params[:subject]
    # Assign url to var after retreival from params["body-plain"]

    @user = User.find_by_email(params[:sender])
    @topic = Topic.find_by_title(params[:subject])
    @url = params["body-plain"]

    # Check for user, if so, create and save new user
    if @user.nil?
    	@user = User.new(
    		email: params[:sender],
    		password: params[:sender],
    		password_confirmation: params[:sender]
    	)
    	@user.save!
    end

    # Check for topic and create
    if @topic.nil?
    	@topic = @user.topics.build(title: params[:subject])
    	@topic.save!
    end

    # Once validity of user and topic is set, build/save new bookmarks
    @bookmark = @topic.bookmarks.build(url: @url)
    @bookmark.save
    head 200
  end
end