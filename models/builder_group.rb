class BuilderGroup
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  belongs_to :account

  def initialize()
    self.name = 'a_build_name'
    self.account = BuilderAccount.new().build()
    self
  end
  
  def build()
    Group.new(self.name, self.account)
  end
  
  def with_name(nameP)
    self.name = nameP
    self
  end
  
  def whit_account(accountP)
    self.account = accountP
    self
  end
  
  
  
end
