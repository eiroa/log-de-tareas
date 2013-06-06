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
  
end
