require 'spec_helper'

describe Group do

  describe 'create' do
    
    it 'persists the name attribute' do
      Group.should_receive(:find_by_name).and_return(nil)
      account = Account.create_with_name("unaCuenta")
      group = Group.create('Group1', account)
      group.name.should eq 'Group1'
    end
  
    it 'persists the account attribute' do
      Group.should_receive(:find_by_name).and_return(nil)
      account = Account.create_with_name("unaCuenta")
      group = Group.create('Group1', account)
      group.account.should eq account
    end    
  end

  describe 'check_params' do
    
    it 'should not raise a ErrorException when params are correct' do
      Group.should_receive(:errors).and_return([])
      account = Account.create_with_name("unaCuenta")
      begin
        Group.check_params('Group1', account)
      rescue
        fail
      end      
    end
    
    it 'should raise a ErrorException with n elems when params are incorrect' do
      array = 'error array'
      Group.should_receive(:errors).and_return(array)
      begin
        Group.check_params('Group1', 'fake_account')
        fail
      rescue ErrorsException => e
        e.errors.should eq array
      end
    end
  end
  
  describe 'errors' do
  
    it 'should return empty error list when the params are correct' do      
      Group.should_receive(:check_name).with([], 'Group1').and_return([])
      Group.should_receive(:check_account).with([], 'fake_account').and_return([])
      error = Group.errors('Group1', 'fake_account')
      error.should be_empty
    end
    
    it 'should return list with error when empty name' do
      error = 'anError'
      Group.should_receive(:check_name){ |*args| args[0].push('anError')}
      Group.should_receive(:check_account){ |*args| args[0]}
      error = Group.errors('Group1', 'fake_account')
      error.should include'anError'
    end
        
  end
  
  
  describe 'check_name' do
    
    it 'shoul not add error when param is not blank and unique' do
      arrayError = []
      FormatTester.should_receive(:is_alp_num).with('grupo1').and_return(true)
      Group.should_receive(:find_by_name).with('grupo1').and_return(nil)
      Group.check_name(arrayError, 'grupo1')
      arrayError.should be_empty
    end
    
    it 'shoul add error when blank name' do
      arrayError = []
      FormatTester.should_receive(:is_alp_num).with('').and_return(false)
      Group.check_name(arrayError, '')
      arrayError.should have(1).items
    end
    
    it 'shoul add error when not unique' do
      arrayError = []
      FormatTester.should_receive(:is_alp_num).with('grupo1').and_return(true)
      Group.should_receive(:find_by_name).with('grupo1').and_return([]) #nil means unique
      Group.check_name(arrayError, 'grupo1')
      arrayError.should have(1).items
    end
  end
  
  describe 'check_account' do
    
    it 'shoul not add error when param is a real account' do
      arrayError = []
      double_account = double("Account")
      double_account.should_receive(:is_a?).and_return(true)
      Group.check_account(arrayError, double_account)
      arrayError.should be_empty
    end
    
    it 'shoul add error when nil' do
      arrayError = []
      Group.check_account(arrayError, nil)
      arrayError.should have(1).items
    end
    
    it 'shoul add error when account is not a real account' do      
      arrayError = []
      double_account = double("Account")
      double_account.should_receive(:is_a?).and_return(false)
      Group.check_account(arrayError, double_account)
      arrayError.should have(1).items
    end
    
  end


end
