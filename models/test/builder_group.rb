class BuilderGroup
  
  @name
  @account

  def initialize()
    @name = 'a_build_name'
    @account = BuilderAccount.new().build()
    self
  end
  
  def build()
    Group.create(@name, @account)
  end
  
  def with_name(nameP)
    @name = nameP
    self
  end
  
  def whit_account(accountP)
    @account = accountP
    self
  end
  
  
  
end
