require 'rails_helper'

RSpec.describe Ost, type: :model do
  describe 'validations' do
    subject { create(:ost) }
    it { is_expected.to be_valid }
    it { is_expected.to belong_to :installation }
    it { is_expected.to have_many(:ost_flows).dependent(:destroy) }
    it { is_expected.to belong_to(:executor).class_name('User') }
    it { is_expected.to belong_to(:attendant).class_name('User') }
  end
end
