RSpec.shared_examples 'date validation' do |before, after, status = true|
  it "expect #{before} to not be nil" do
    subject.send before + '=', nil
    expect(subject.save).to be false
  end
  it "expect #{after} < #{before} to not be valid" do
    subject.send after + '=', subject.send(before) - 2
    expect(subject.save).to be false
  end
  it "expect #{after} > #{before} to be valid" do
    subject.send after + '=', subject.send(before) + 1
    expect(subject.save).to be true
  end
  it("expect #{after} = #{before} to be valid", if: status) do
    subject.send after + '=', subject.send(before)
    expect(subject.save).to be true
  end
end
