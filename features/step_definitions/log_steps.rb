
Given(/^I have already assigned a time estimation to "(.*?)"$/) do |task_name|
  account = Account.find_by_id(1)
  task = Task.find_by_account_id(account.id)
  task.estimatedTime = 60
  task.save
end

Given(/^I have assigned the task with name "(.*?)" of the group "(.*?)"$/) do |task_name, group|

  account = Account.find_by_id(1)
  grupo = Group.find_by_name(group)
  task_template = TaskTemplate.create(task_name, "description", grupo)
  
  task = Task.create(task_template, account)
  
end

Given(/^I have assigned the task with name "(.*?)" of the group "(.*?)" and estimated it$/) do |task_name, group|
  account = Account.find_by_id(1)
  grupo = Group.find_by_name(group)
  task_template = TaskTemplate.create(task_name, "description", grupo)
  
  task = Task.create(task_template, account)
  task.estimatedTime =60
  task.save
end

