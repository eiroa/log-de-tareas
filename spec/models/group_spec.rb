require 'spec_helper'

describe Group do

  it 'the constructor persists de atributes' do
    Group.should_receive(:find_by_name).and_return(nil)
    account = Account.create_with_name("unaCuenta")
    group = Group.create('Group1', account)
    group.name.should eq 'Group1'
  end

  it 'a group return empty error list when this is well format' do
    Group.should_receive(:find_by_name).and_return(nil)
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
    Group.should_receive(:find_by_name).and_return(nil)
    error = Group.errors('Group1', nil)
    error.should have(1).items
  end 

end
