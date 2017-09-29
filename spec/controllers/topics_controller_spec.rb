require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:user) { create(:topic) }
  let(:topic) { create(:topic)}

  describe "GET #index" do
    it "assigns all @topics as topics" do
      topic = Topic.create! 
      get :index
      expect(assigns(:topics)).to eq([topic])
    end
  end

  describe "GET #show" do
    it "assigns the requested topic as @topic" do
      topic = Topic.create!
      get :show, { id: topic.to_params }
      expect(assigns(:topic)).to eq(topic_id)
    end
  end

  describe "GET #new" do
    it "assigns new topic as @topic" do
      topic = Topic.create!
      get :new
      expect(assigns(:topic)).to be_a_new(Topic)
    end
  end

  describe "GET #edit" do
    it "assigns requested topic as @topics" do
      topic = Topic.create!
      get :edit, { id: topic.to_params }
      expect(assigns(:topic)).to eq(topic)
    end
  end
end
