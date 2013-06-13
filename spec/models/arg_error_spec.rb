require 'spec_helper'

describe ArgError do
  
  it 'should be created with a name' do
    arg_error = ArgError.new('aName', 'aDescription')
    arg_error.keyname.should eq 'aName'
  end
  
  it 'should be created with a description' do
    arg_error = ArgError.new('aName', 'aDescription')
    arg_error.description.should eq 'aDescription'
  end
  
  it 'an account persist their groups' do
    account = Account.create_with_name("unaCuenta")
    group1 = BuilderGroup.new().with_name('grupo1').whit_account(account).build()
    group2 = BuilderGroup.new().with_name('grupo2').whit_account(account).build()
    account.get_groups.size.should eq 2
  end

end
