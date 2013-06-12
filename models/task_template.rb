class TaskTemplate
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :description, String
  belongs_to :group

  def initialize(nameP, descriptionP, groupP)
    self.name = nameP
    self.description = descriptionP
    self.group = groupP
    self.save
    self
  end  

  def self.errors(nameP, descriptionP, groupP)
    array = []
    self.check_name(array, nameP, groupP)
    self.check_description(array, descriptionP)
    array
  end

  def self.check_name(array, nameP, groupP)
    if !FormatTester.is_alp_num(nameP)
      array.push(ArgError.blank_string('El nombre de la tarea'))
    elsif TaskTemplate.find_by_name_and_group(nameP, groupP) != nil
      array.push(ArgError.new('task exist', "La tarea #{nameP} ya existe"))
    end
  end
  
  def self.check_description(array, descriptionP)
    if !FormatTester.is_alp_num(descriptionP)
      array.push(ArgError.blank_string('La descripcion de la tarea'))
    end
  end


  
end
