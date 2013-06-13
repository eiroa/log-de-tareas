class BuilderTaskTemplate

  # property <name>, <type>
  @name
  @description
  @group
  
  
  def initialize()
    @name = 'a_builder_name'
    @description = 'a_builder_description'
    @group = BuilderGroup.new().build()
    self
  end
  
  def build()
    TaskTemplate.new(@name, @description, @group)
  end
  
  def with_description(descriptionP)
    @description = descriptionP
    self
  end
  
  
end
