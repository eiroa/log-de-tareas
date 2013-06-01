require 'spec_helper'

describe Group do

  it 'the constructor persists de atributes' do
    group = Group.new('Group1')
    group.name.should eq 'Group1'
  end

end
