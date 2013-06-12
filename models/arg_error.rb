class ArgError
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :keyname, String
  property :description, String
  
  
  def initialize(keynameP, descriptionP)
    self.keyname = keynameP
    self.description = descriptionP
    self
  end

  def self.blank_string(param_name)
    error = ArgError.new('blank_string', "#{param_name} no deberia ser vacio o contener simbolos")
    error.id = 1
    error
  end

end