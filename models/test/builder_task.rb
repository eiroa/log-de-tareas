class BuilderTask
  
  @estimatedTime
  @elapsedTime
  @task_template
  @account
  
  
  def initialize()
    @task_template = BuilderTaskTemplate.new().build()
    @account = BuilderAccount.new().build()
    self
  end
  
  def build()
    Task.new(@task_template, @account)
  end
  
  def whit_task_template(task_templateP)
    @task_template = task_templateP
    self
  end
end
