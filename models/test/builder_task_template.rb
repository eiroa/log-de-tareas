class BuilderTaskTemplate
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :description, String  
  belongs_to :group
  
  
  def initialize()
    self.name = 'a_builder_name'
    self.description = 'a_builder_description'
    self.group = BuilderGroup.new().build()
    self
  end
  
  def build()
    TaskTemplate.new(self.name, self.description, self.group)
  end
  
  def with_description(descriptionP)
    self.description = descriptionP
    self
  end
  
  
end
