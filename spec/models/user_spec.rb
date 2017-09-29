require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it { is_expected.to have_many(:topics) }
  it { is_expected.to have_many(:bookmarks) }
  
end
