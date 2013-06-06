class Account
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :email, String
  property :role, String
  property :uid, String
  property :provider, String

  def self.create_with_name(name)
    account = Account.new
    account.name = name
    account.save
    account
  end

  def self.create_with_omniauth(auth)
    account = Account.new
    account.provider = auth["provider"]
    account.uid      = auth["uid"]
    account.name = auth["info"]["nickname"] # warn: this is for twitter
    account.save
    account
  end

  def friendly_name
    name.nil? ? uid : name
  end
  
  def get_groups    
    Group.find_all_by_account(self)
  end

end




