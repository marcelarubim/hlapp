require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validations' do
    subject { create(:contact) }

    it { is_expected.to be_valid }
    it { is_expected.to belong_to(:client) }
    # it { is_expected.to belong_to(:creator).class_name('User') }

    # context 'for fullname' do
    #   it { is_expected.to validate_presence_of(:fullname) }
    #   valid_fullnames.each do |valid_name|
    #     it { should allow_value(valid_name).for(:fullname) }
    #   end
    #   invalid_fullnames.each do |invalid_name|
    #     it { should_not allow_value(invalid_name).for(:fullname) }
    #   end
    # end
    # context 'for telephone and mobile' do
    #   it 'doesnt save if both are invalids' do
    #     contact.telephone = contact.mobile = nil
    #     expect(contact.save).to be false
    #   end
    #   it 'save if at least one is valid' do
    #     contact.telephone = nil
    #     contact.mobile = Faker::PhoneNumber.cell_phone.gsub(/[\-\(\) .]/, '')
    #     expect(contact.save).to be true
    #   end
    #   it 'save if both are valid' do
    #     contact.telephone = Faker::PhoneNumber.cell_phone.gsub(/[\-\(\) .]/, '')
    #     contact.mobile = Faker::PhoneNumber.cell_phone.gsub(/[\-\(\) .]/, '')
    #     expect(contact.save).to be true
    #   end
    #   valid_phones.each do |valid_phone|
    #     it { should allow_value(valid_phone).for(:telephone) }
    #     it { should allow_value(valid_phone).for(:mobile) }
    #   end
    #   invalid_phones.each do |invalid_phone|
    #     it { should_not allow_value(invalid_phone).for(:telephone) }
    #     it { should_not allow_value(invalid_phone).for(:mobile) }
    #   end
    # end
    # context 'for email' do
    #   it 'requires downcase an email before saving' do
    #     contact.email = 'UPPERCASE@EMAIL.COM'
    #     expect(contact.save).to be true
    #     expect(contact.email).to eq('uppercase@email.com')
    #   end
    #   it { should validate_length_of(:email).is_at_most(255) }
    #   context 'when format is invalid' do
    #     invalid_emails.each do |invalid_email|
    #       it { should_not allow_value(invalid_email).for(:email) }
    #     end
    #   end
    #   context 'when format is valid' do
    #     valid_emails.each do |valid_email|
    #       it { should allow_value(valid_email).for(:email) }
    #     end
    #   end
    # end
    # context 'for responsible_for' do
    #   it { is_expected.to validate_presence_of(:responsible_for) }
    #   it { should validate_length_of(:responsible_for).is_at_most(255) }
    # end
  end
end
