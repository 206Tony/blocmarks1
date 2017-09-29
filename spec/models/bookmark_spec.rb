require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:topic) { create(:topic) }
  let(:bookmark) { create(:bookmark, topic: topic) }

  it { is_expected.to belong_to(:topic) }
  it { is_expected.to validate_presence_of(:url) }

  describe "attributes" do
 	it "has attributes" do
 		expect(bookmark).to have_attributes(url: bookmark.url, topic: topic)
 	end
 end
end
