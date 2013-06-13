class BuilderAccount
  
  @name
  
  def initialize()
    @name = 'a_build_name'
    self
  end
  
  def build()
    Account.create_with_name(@name)
  end
end
