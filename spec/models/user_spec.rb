require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { create(:user) }

    it { is_expected.to have_many(:addresses).dependent(:destroy) }
    it { is_expected.to have_secure_password }
    # it { is_expected.to belong_to(:creator).class_name('User') }
  end
end
