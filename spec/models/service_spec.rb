require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'validations' do
    subject { create(:service) }
    it { is_expected.to be_valid }
    it { is_expected.to belong_to :contract }
    it { is_expected.to belong_to :spv }
    it { is_expected.to have_many :productions }
    # it { is_expected.to belong_to(:creator).class_name('User') }
    # it { is_expected.to_not allow_value(nil).for(:courtesy) }
  end
end
