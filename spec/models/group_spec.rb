require 'spec_helper'

describe Group do

  it 'the constructor persists de atributes' do
    group = Group.new('Group1', nil)
    group.name.should eq 'Group1'
  end

  it 'a group return empty error list when this is well format' do
    error = Group.errors('Group1', BuilderAccount.new().build())
    error.should be_empty
  end

  it 'a group return list with error when empty name' do
    error = Group.errors('', BuilderAccount.new().build())
    error.should have(1).items
  end

  it 'a group return list with error when blank name' do
    error = Group.errors('  ', BuilderAccount.new().build())
    error.should have(1).items
  end
  
  it 'a group return list with error when the account is nil' do
    error = Group.errors('Group1', nil)
    error.should have(1).items
  end 

end
