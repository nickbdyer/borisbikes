require 'van'

describe Van do

  let(:van){ Van.new(capacity: 20) }

  it "should allow setting of default capacity when initializing" do
    expect(van.capacity).to eq(20)

  end

end
