require 'rails_helper'

RSpec.describe Video, type: :model do
  let(:video) { build :video }
  subject { video }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :description }
  it { is_expected.to respond_to :video }
  it { is_expected.to respond_to :user_id }
  it { is_expected.to respond_to :user }
  it { is_expected.to respond_to :views }

  it { is_expected.to be_valid }

  describe 'when name is not present' do
    before { video.name = ' ' }
    it { is_expected.to_not be_valid }
  end

  describe 'when user_id is not present' do
    before { video.user_id = nil }
    it { is_expected.to_not be_valid }
  end
end
