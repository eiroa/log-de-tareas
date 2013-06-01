class Group
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String

  def initialize(nameP)
    self.name = nameP
  end

end
