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
  
  def self.errors(nameP, accountP)
    array = []
    self.check_name(array, nameP)
    self.check_account(array, accountP)
    array
  end
  
  def self.check_name(array, nameP)
    if !/[[:alnum:]]/.match(nameP)
      array.push(ArgError.blank_string('group name'))
    elsif Group.find_by_name(nameP) != nil 
      array.push(ArgError.new('group exist', "The group #{nameP} already exist"))
    end
  end
  
  def self.check_account(array, accountP)
    if accountP == nil || !accountP.is_a?(Account)
      array.push(ArgError.new('account error', 'the account should be a real account'))
    end
  end
  

 
end
