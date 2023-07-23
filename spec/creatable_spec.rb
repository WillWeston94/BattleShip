require './lib/creatable'
# Created to use cells[coordinate] = Creatable.new. Needed to test it by itself to follow conventions


RSpec.describe Creatable do
  before(:each) do
    @creatable = Creatable.new
  end

  it 'exists' do
    expect(@creatable).to be_an_instance_of(Creatable)
  end
end