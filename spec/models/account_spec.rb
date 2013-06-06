require 'spec_helper'

describe Account do
  
  it 'an account return an id' do
    account = Account.create_with_name("unaCuenta")
    account.id.should_not be_nil
  end
  
  it 'an account persist their groups' do
    account = Account.create_with_name("unaCuenta")
    group1 = BuilderGroup.new().with_name('grupo1').whit_account(account).build()
    group2 = BuilderGroup.new().with_name('grupo2').whit_account(account).build()
    account.get_groups.size.should eq 2
  end

end
