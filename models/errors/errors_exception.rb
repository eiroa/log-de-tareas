class ErrorsException < Exception
  
  @errors
  
  def self.with_errors(errorsP)
      instance = self.new()
      instance.set_errors(errorsP)
      instance
  end
  
  def errors()
    return @errors
  end
  
  def set_errors(errorsP)
    @errors = errorsP
  end
  
end