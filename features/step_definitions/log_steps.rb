
Given(/^I have assigned the task with name "(.*?)" and time estimated for the group "(.*?)"$/) do |task_name, group|
  
end

Given(/^I have assigned the task with name "(.*?)" for the group "(.*?)"$/) do |task_name, group|
  step %{there is task with name "#{task_name}" for the group "#{group}"}
  TaskTemplate.find_by_name(task_name)
end


