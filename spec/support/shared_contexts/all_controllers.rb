RSpec.shared_examples 'respond with success' do |redirect = false|
  it('', if: redirect) do
    expect(subject.request.path).to redirect_to redirect_path
    expect(response).to have_http_status(:found)
  end
  it('', unless: redirect) do
    expect(subject.request.path).to eq redirect_path
    expect(response).to have_http_status(:ok)
  end
  it { expect(response.content_type).to eq 'text/html' }
end


# RSpec.shared_examples 'redirected' do |redirect|
#   it('', if: redirect) do
#     expect(subject.request.path).to redirect_to redirect_path
#     expect(response).to have_http_status(:found)
#   end
#   it('', unless: redirect) do
#     expect(subject.request.path).to eq redirect_path
#     expect(response).to have_http_status(:ok)
#   end
# end

# RSpec.shared_examples 'unauthorized public access' do |request, action|
#   before do
#     log_in(nil)
#     routing(request, action, params)
#   end
#   it_behaves_like 'redirected', true do
#     let(:redirect_path) { login_url }
#   end
# end

# RSpec.shared_examples 'all access allowed' do |request, action, redirect|
#   it_behaves_like 'authorized logged access', request, action, redirect, User.roles.keys
# end

# RSpec.shared_examples 'admin access allowed' do |request, action, redirect|
#   it_behaves_like 'authorized logged access', request, action, redirect, ['admin']
#   it_behaves_like 'unauthorized logged access', request, action,
#                   User.roles.keys - %w(admin)
# end

# RSpec.shared_examples 'admin & production access allowed' do |request, action, redirect|
#   it_behaves_like 'authorized logged access', request, action, redirect,
#                   %w(admin production)
#   it_behaves_like 'unauthorized logged access', request, action,
#                   User.roles.keys - %w(admin production)
# end

# RSpec.shared_examples 'admin & production & seller access allowed' do |request, action, redirect|
#   it_behaves_like 'authorized logged access', request, action, redirect,
#                   %w(admin production seller)
#   it_behaves_like 'unauthorized logged access', request, action,
#                   User.roles.keys - %w(admin production seller)
# end

# RSpec.shared_examples 'unauthorized logged access' do |request, action, roles|
#   roles.each do |role|
#     context "for #{role} user" do
#       before do
#         log_in(create(:user, role: role).id)
#         routing(request, action, params)
#       end
#       it_behaves_like 'redirected', true do
#         let(:redirect_path) { user_path(current_user) }
#       end
#       it { is_expected.to set_flash[:warning].to('Access denied') }
#       it { expect(response.content_type).to eq 'text/html' }
#     end
#   end
# end

# RSpec.shared_examples 'authorized logged access' do |request, action, redirect, roles|
#   roles.each do |role|
#     context "for #{role} user" do
#       before do
#         log_in(create(:user, role: role).id)
#         routing(request, action, params)
#       end
#       it_behaves_like 'redirected', redirect
#       it { is_expected.to_not set_flash[:warning].to('Access denied') }
#       it { expect(response.content_type).to eq 'text/html' }
#     end
#   end
# end

# RSpec.shared_examples 'post/patch/delete' do |valid, request, action, redirect, roles|
#   roles.each do |role|
#     context "for #{role} user" do
#       before do
#         log_in(create(:user, role: role).id)
#       end
#       let(:current_class) { Object.const_get(controller.controller_path.classify) }
#       let(:symbol_class) { controller.controller_path.singularize.to_sym }
#       subject { routing(request, action, params) }
#       if valid
#         context 'valid attributes' do
#           it('create object', if: (request == :post && action == :create) ||
#            (request == :delete && action == :destroy)) do
#             expect { subject }.to change(current_class, :count).by(1) if action == :create
#             expect { subject }.to change(current_class, :count).by(-1) if action == :delete
#             expect(subject.request.flash[:success]).to eq message
#           end
#           it('update object', if: request == :patch && action == :update) do
#             expect(subject.request.flash[:success]).to eq message
#             current_class.find(params[:id]).reload
#             params[symbol_class].each do |key, value|
#               expect(current_class.find(params[:id])[key]).to eq value
#             end
#           end
#         end
#       else
#         context 'invalid attributes' do
#           it('doesnt create object', if: request == :post && action == :create) do
#             expect { subject }.to change(current_class, :count).by(0)
#             expect(subject.request.flash[:danger]).to eq message
#           end
#           it('doesnt update object', if: request == :patch && action == :update) do
#             expect(subject.request.flash[:danger]).to eq message
#             current_class.find(params[:id]).reload
#             params[symbol_class].each do |key, value|
#               expect(current_class.find(params[:id])[key]).to_not eq value
#             end
#           end
#           it('doesnt delete object', if: request == :delete && action == :destroy) do
#             expect { subject }.to change(current_class, :count).by(0)
#             expect(subject.request.flash[:danger]).to eq message
#           end
#         end
#       end
#       it_behaves_like 'redirected', redirect
#     end
#   end
# end
