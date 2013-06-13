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
  


end
