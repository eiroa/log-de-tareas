class Group
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  belongs_to :account

  def initialize(nameP, accountP)
    self.name = nameP
    self.account = accountP
    self.save
    self
  end
  


 
end
