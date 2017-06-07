require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  let(:client) { create(:client) }

  describe 'GET #index' do
    before { routing(:get, :index, {}) }
    it_behaves_like 'respond with success' do
      let(:redirect_path) { clients_path }
    end
  end

  describe 'GET #edit' do
    before { routing(:get, :edit, id: client.id) }
    it_behaves_like 'respond with success' do
      let(:redirect_path) { client_path(client) }
    end
  end

  describe 'GET #new' do
    before { routing(:get, :new, { }) }
    it_behaves_like 'respond with success' do
      let(:redirect_path) { new_client_path() }
    end
  end


  # describe '#filters' do
  #   it { is_expected.to use_before_action(:logged_in_user) }
  #   it { is_expected.to use_before_action(:admin_or_production) }
  #   it { is_expected.to use_before_action(:admin) }
  # end
  # describe 'GET #show' do
  #   describe 'Public access' do
  #     it_behaves_like 'unauthorized public access', :get, :show, false do
  #       let(:params) { { id: client.id } }
  #     end
  #   end
  #   describe 'Logged in access' do
  #     it_behaves_like 'all access allowed', :get, :show, false do
  #       let(:params) { { id: client.id } }
  #       let(:redirect_path) { client_path(client) }
  #     end
  #   end
  # end
  # describe 'GET #new' do
  #   describe 'Public access' do
  #     it_behaves_like 'unauthorized public access', :get, :new do
  #       let(:params) { {} }
  #     end
  #   end

  #   describe 'Logged in access' do
  #     it_behaves_like 'admin & production access allowed', :get, :new, false do
  #       let(:params) { {} }
  #       let(:redirect_path) { new_client_path }
  #     end
  #   end
  # end
  # describe 'POST #create' do
  #   let(:attributes) { attributes_for(:client) }

  #   describe 'Public access' do
  #     it_behaves_like 'unauthorized public access', :post, :create do
  #       let(:params) do
  #         { client: attributes }
  #       end
  #     end
  #   end
  #   describe 'Logged in access' do
  #     describe 'strong parameters' do
  #       it do
  #         session[:user_id] = create(:admin).id
  #         is_expected.to permit(:business_name, :legal_name, :cnpj, :telephone, :fax,
  #                               :website, :month_anniversary, :welcome_letter, :referrer,
  #                               :seller_id, :captured_by_id)
  #           .for(:create, params: { params: { client: attributes } })
  #           .on(:client)
  #       end
  #     end
  #     it_behaves_like 'admin & production access allowed', :post, :create, true do
  #       let(:params) { { client: attributes } }
  #       let(:redirect_path) { client_path(Client.last) }
  #     end
  #     it_behaves_like 'post/patch/delete', true,
  #                     :post, :create, true, %w(admin production) do
  #       let(:params) { { client: attributes } }
  #       let(:redirect_path) { client_path(Client.last) }
  #       let(:message) { 'Client successfully created' }
  #     end
  #     it_behaves_like 'post/patch/delete', false,
  #                     :post, :create, false, %w(admin production) do
  #       let(:params) { { client: { business_name: nil, legal_name: nil, cnpj: '111' } } }
  #       let(:redirect_path) { clients_path }
  #       let(:message) { 'Client not created' }
  #     end
  #   end
  # end
  # describe 'GET #edit' do
  #   describe 'Public access' do
  #     it_behaves_like 'unauthorized public access', :get, :edit do
  #       let(:params) { { id: client.id } }
  #     end
  #   end

  #   describe 'Logged in access' do
  #     it_behaves_like 'admin & production access allowed', :get, :edit, false do
  #       let(:params) { { id: client.id } }
  #       let(:redirect_path) { edit_client_path(client) }
  #     end
  #   end
  # end
  # describe 'PATCH #update' do
  #   let(:attributes) { attributes_for(:client) }

  #   describe 'Public access' do
  #     it_behaves_like 'unauthorized public access', :patch, :update do
  #       let(:params) { { id: client.id, client: attributes } }
  #     end
  #   end
  #   describe 'Logged in access' do
  #     describe 'strong parameters' do
  #       it do
  #         session[:user_id] = create(:admin).id
  #         is_expected.to permit(:business_name, :legal_name, :cnpj, :telephone, :fax,
  #                               :website, :month_anniversary, :welcome_letter, :referrer,
  #                               :seller_id, :captured_by_id)
  #           .for(:update, params: { params: { id: client.id, client: attributes } })
  #           .on(:client)
  #       end
  #     end
  #     it_behaves_like 'admin & production access allowed', :patch, :update, true do
  #       let(:params) { { id: client.id, client: attributes } }
  #       let(:redirect_path) { client_path(client.id) }
  #     end
  #     it_behaves_like 'post/patch/delete', true, # valid attributes
  #                     :patch, :update, true, %w(admin production) do
  #       let(:params) { { id: client.id, client: attributes } }
  #       let(:redirect_path) { client_path(client) }
  #       let(:message) { 'Client successfully updated' }
  #     end
  #     it_behaves_like 'post/patch/delete', false, # invalid attributes
  #                     :patch, :update, false, %w(admin production) do
  #       let(:params) do
  #         { id: client.id, client: { business_name: nil, legal_name: nil, cnpj: '111' } }
  #       end
  #       let(:redirect_path) { client_path(client) }
  #       let(:message) { 'Client not updated' }
  #     end
  #   end
  # end
  # describe 'DELETE #destroy' do
  #   describe 'Public access' do
  #     it_behaves_like 'unauthorized public access', :delete, :destroy do
  #       let(:params) { { id: client.id } }
  #     end
  #   end
  #   describe 'Logged in access' do
  #     it_behaves_like 'admin access allowed', :delete, :destroy, true do
  #       let(:params) { { id: client.id } }
  #       let(:redirect_path) { clients_path }
  #     end
  #     it_behaves_like 'post/patch/delete', true, # valid attributes
  #                     :delete, :destroy, true, %w(admin) do
  #       let(:params) { { id: client.id } }
  #       let(:redirect_path) { clients_path }
  #       let(:message) { 'Client successfully destroyed' }
  #     end
  #     it_behaves_like 'post/patch/delete', false, # invalid attributes
  #                     :delete, :destroy, true, %w(admin) do
  #       let(:params) { { id: -1 } }
  #       let(:redirect_path) { clients_path }
  #       let(:message) { 'Client not found' }
  #     end
  #   end
  # end
end
