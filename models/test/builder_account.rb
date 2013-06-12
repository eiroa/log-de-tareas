class BuilderAccount
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  
  def initialize()
    self.name = 'a_build_name'
    self
  end
  
  def build()
    Account.create_with_name(self.name)
  end
end
