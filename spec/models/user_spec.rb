require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }
  subject { user }

  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :password }
  it { is_expected.to respond_to :videos }

  it { is_expected.to be_valid }

  describe 'when email is not present' do
    before { user.email = ' ' }
    it { is_expected.to_not be_valid }
  end

  describe 'when email is taken' do
    before do
      create :user, email: user.email
    end
    it { is_expected.to_not be_valid }
  end

  describe 'when password is not present' do
    before { user.password = ' ' }
    it { is_expected.to_not be_valid }
  end
end
