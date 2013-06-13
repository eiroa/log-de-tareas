class Group
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  belongs_to :account

  def self.create(nameP, accountP)
    instance = self.new()
    instance.name = nameP
    instance.account = accountP
    instance.save
    instance
  end
  
  def self.errors(nameP, accountP)
    array = []
    self.check_name(array, nameP)
    self.check_account(array, accountP)
    array
  end
  
  def self.check_name(array, nameP)
    if !FormatTester.is_alp_num(nameP)
      array.push(ArgError.blank_string('El nombre del grupo'))
    elsif Group.find_by_name(nameP) != nil 
      array.push(ArgError.new('group exist', "El grupo #{nameP} ya existe"))
    end
  end
  
  def self.check_account(array, accountP)
    if accountP == nil || !accountP.is_a?(Account)
      array.push(ArgError.new('account error', 'La cuenta deberia ser una cuenta real'))
    end
  end
  

 
end
