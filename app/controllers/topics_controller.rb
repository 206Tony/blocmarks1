class TopicsController < ApplicationController

	# GET /topics
  def index
  	@topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
  	@topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  	
  end

  # POST /topics
  def create 
  	@topic = Topic.new(topic_params)
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
  	
    if @topic.destroy
  		flash[:notice] = 'Topic was successfully deleted.'
  	else
  		flash.now[:alert] = "There was an error deleting the topic."
  	end
  end

  private 

  def topic_params 
  	params.require(:topic).permit(:title)
  end
end
