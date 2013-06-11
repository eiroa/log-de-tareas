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
    if !/[[:alnum:]]/.match(nameP)
      array.push(ArgError.blank_string('task name'))
    elsif TaskTemplate.find_by_name_and_group(nameP, groupP) != nil 
      array.push(ArgError.new('task exist', "The task #{nameP} already exist"))
    end
  end
  
  def self.check_description(array, descriptionP)
    if !/[[:alnum:]]/.match(descriptionP)
      array.push(ArgError.blank_string('task description'))
    end
  end


  
end
