class BuilderTask
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :estimatedTime, Integer
  property :elapsedTime, Integer
  belongs_to :task_template
  belongs_to :account
  
  
  def initialize()
    self.task_template = BuilderTaskTemplate.new().build()
    self.account = BuilderAccount.new().build()
    self
  end
  
  def build()
    Task.new(self.task_template, self.account)
  end
  
  def whit_task_template(task_templateP)
    self.task_template = task_templateP
    self
  end
end
