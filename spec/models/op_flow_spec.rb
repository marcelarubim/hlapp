require 'rails_helper'

RSpec.describe OpFlow, type: :model do
  describe 'validations' do
    subject { create(:op_flow) }
    it { is_expected.to be_valid }
    it { is_expected.to belong_to :op }
  end
end
