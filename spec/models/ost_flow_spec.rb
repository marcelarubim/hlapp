require 'rails_helper'

RSpec.describe OstFlow, type: :model do
  describe 'validations' do
    subject { create(:ost_flow) }
    it { is_expected.to be_valid }
    it { is_expected.to belong_to :ost }
  end
end
