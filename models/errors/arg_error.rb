class ArgError
  
  @keyname
  @description
  
  
  def initialize(keynameP, descriptionP)
    @keyname = keynameP
    @description = descriptionP
    self
  end

  def self.blank_string(param_name)
    error = ArgError.new('blank_string', "#{param_name} no deberia ser vacio o contener simbolos")
    error
  end
  
  def keyname()
    return @keyname
  end
  
  def description()
    return @description
  end

end