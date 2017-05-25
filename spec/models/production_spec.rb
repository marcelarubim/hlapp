require 'rails_helper'

RSpec.describe Production, type: :model do
  describe 'validations' do
    subject { create(:production) }
    it { is_expected.to be_valid }
    it { is_expected.to belong_to :service }
    it { is_expected.to have_one(:contract).through(:service) }
    it { is_expected.to belong_to(:op) }
    # it { is_expected.to belong_to(:creator).class_name('User') }
    # it { is_expected.to validate_presence_of(:theme) }
    # it { is_expected.to validate_presence_of(:airing_month) }
    # it { is_expected.to allow_value(nil).for(:renew_forecast_month) }

    # it 'renew forecast month has to be greater than airing month' do
    #   subject.airing_month = Date.today
    #   subject.renew_forecast_month = Date.today
    #   expect(subject).to_not be_valid
    # end
  end
end
