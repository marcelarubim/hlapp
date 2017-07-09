[:admin, :production, :technic, :seller].each do |role|
  if role == :admin
    FactoryGirl.create(:user, role: role, fullname: 'Admin User', cpf: '00000000000',
                              password: 'password')
  else
    FactoryGirl.create(:user, role: role, password: 'password')
  end
end

FactoryGirl.create_list(:client_category, 5)

FactoryGirl.create_list(:client, 15,
                        category: ClientCategory.find(rand(1..ClientCategory.count)),
                        seller: User.find(rand(1..User.count)))

Client.all.each do |c|
  FactoryGirl.create_list(:contact, rand(2..5), client: c)
  FactoryGirl.create_list(:contract, rand(1..3), client: c)
  FactoryGirl.create_list(:address, rand(1..2), addressable: c)
end

{
  anunciador: { arquivo_audio: %w(diurno noturno recesso secretaria),
                atendedor: %w(noturno recesso mudanca_tel) },
  espera_telefonica: { dp: %w(DP4 DP10),
                       holdcast: %w(HC-12 HC-20 HC-12_pro HC-20_pro HC-TICKER LD),
                       pendrive: [],
                       holdline_pro: [] },
  radio: { holdcast: %w(empresarial ambiente) },
  fraseologia: { arquivo_audio: [] },
  jingle: { arquivo_audio: [] },
  spot: { arquivo_audio: [] },
  trilha: { arquivo_audio: [] },
  audio_off: { arquivo_audio: [] },
  telemensagem: { arquivo_audio: [] }
}.each do |s, h|
  h.each do |p, array|
    serv = ServiceType.find_by(name: s) || FactoryGirl.create(:service_type, name: s)
    prod = ProductType.find_by(name: p) || FactoryGirl.create(:product_type, name: p)
    if array.empty?
      var = nil
      FactoryGirl.create(:service_product_variation, service_type: serv,
                                                     product_type: prod,
                                                     variation_type: var)
    else
      array.each do |v|
        var = VariationType.find_by(name: v) || FactoryGirl.create(:variation_type,
                                                                   name: v)
        FactoryGirl.create(:service_product_variation, service_type: serv,
                                                       product_type: prod,
                                                       variation_type: var)
      end
    end
  end
end

%w(holdcast DP).each do |prod|
  ProductType.where(name: prod.downcase).each do |p|
    p.service_product_variations.each do |spv|
      spv.var_required = true
      spv.save
    end
  end
end

Contract.all.each do |c|
  s = ServiceProductVariation.find(ServiceProductVariation.pluck(:id).sample)
  FactoryGirl.create_list(:service, rand(1..4), contract: c, spv: s)
  FactoryGirl.create_list(:op, c.services.count, contract: c)
  c.services.each do |serv|
    FactoryGirl.create_list(:production, rand(1..3), service: serv, op: c.ops.sample)
  end
end
