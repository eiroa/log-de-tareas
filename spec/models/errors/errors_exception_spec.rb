require 'spec_helper'

describe ErrorsException do
  
  it 'should be created with an array' do
    error_exception = ErrorsException.with_errors(['elem1', 'elem2'])
    error_exception.errors.should have(2).items
  end

  


end
