require 'rails_helper'

RSpec.describe ServiceType, type: :model do
  subject { create(:service_type) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
end
