class TopicsController < ApplicationController
  before_action :authenticate_user!

	# GET /topics
  def index
  	@topics = Topic.all #search topic table and store ea. row found in @topics instance ob.
  end

  def show
    @topic = Topic.find(params[:id]) #rails find topic with id defined in params
  end

  def new
  	@topic = Topic.new #creating a new object
  end

  def edit
    @topic = Topic.find(params[:id]) 
  	authorize @topic
  end

  # POST /topics
  def create 
  	@topic = Topic.new(topic_params)  #create record in db 
    @topic.user = current_user

  	if @topic.save
  		flash[:notice] = "Topic was successfully created."
  		redirect_to @topic
  	else
  		flash.now[:alert] = "There was an error saving the topic. Please try again."
  		render :new
  	end
  end

  # PATCH/PUT /topics
  def update 
    @topic = Topic.find(params[:id])
    authorize @topic
  	
  	if @topic.update(topic_params)
  		flash[:notice] = 'Topic was successfully updated.'
  		redirect_to @topic
  	else
  		flash.now[:alert] = "There was an error updating the topic. Please try again."
  	end
  end

  # DELETE /topics
  def destroy
  	@topic = Topic.find(params[:id])
    authorize @topic
  	
    if @topic.destroy
  		flash[:notice] = 'Topic was successfully deleted.'
  	else
  		flash.now[:alert] = "There was an error deleting the topic."
  	end
  end

  private 

  def topic_params 
  	params.require(:topic).permit(:title)  #collects all the field s from ob :topics
  end
end
