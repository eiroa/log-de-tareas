
Given(/^I have assigned the task with name "(.*?)" and time estimated for the group "(.*?)"$/) do |task_name, group|
  
end

Given(/^I have assigned the task with name "(.*?)" of the group "(.*?)"$/) do |task_name, group|
  #step %{there is task with name "#{task_name}" for the group "#{group}"}
  #BuilderTask.new().build().whit_task_template(TaskTemplate.find_by_name(task_name))
  
  #group = Group.find_by_name(group_name)
  #TaskTemplate.create(task_name, 'a_fake_description', group)
  account = Account.find_by_name('a_build_name')
  grupo = Group.find_by_name(group)
  task_template = TaskTemplate.create(task_name, "description", grupo)
  
  task = Task.create(task_template, account)
  
end



