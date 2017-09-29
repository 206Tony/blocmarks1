require 'rails_helper'

RSpec.describe Topic, type: :model do
 
 let(:user) { create(:user) }
 let(:topic) { create(:topic, user: user) }

 it { is_expected.to belong_to(:user) }
 it { is_expected.to validate_presence_of(:title) }
 it { is_expected.to validate_uniqueness_of(:title) }

 describe "attributes" do
 	it "has attributes" do
 		expect(topic).to have_attributes(title: topic.title, user: topic.user)
 	end
 end
end
