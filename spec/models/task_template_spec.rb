require 'spec_helper'

describe TaskTemplate do
  
  describe 'constructor' do
  
    it 'should assaign group to the created task' do
      Group.should_receive(:find_by_name).and_return(nil)
      group = BuilderGroup.new().with_name('un_grupo').build()
      task1 = TaskTemplate.create('name', 'description', group)
      task1.group.should eq group
    end
    
    it 'should raise ErrorsException if blank name' do
      Group.should_receive(:find_by_name).and_return(nil)
      group = BuilderGroup.new().with_name('un_grupo').build()
      begin
        TaskTemplate.create('a_name', '', group)
        fail
      rescue ErrorsException => e
        e.errors.should have(1).items
      end
    end
    
    it 'should raise ErrorsException if blank description' do
      Group.should_receive(:find_by_name).and_return(nil)
      group = BuilderGroup.new().with_name('un_grupo').build()
      begin
        TaskTemplate.create('', 'description', group)
        fail
      rescue ErrorsException => e
        e.errors.should have(1).items
      end
    end
    
  end
  
  describe 'check_params' do
    
    it 'should not raise a ErrorException when params are correct' do
      group = double('Group')
      TaskTemplate.should_receive(:errors).and_return([])
      begin
        TaskTemplate.check_params('task_name', 'task_description', group)
      rescue
        fail
      end      
    end
    
    it 'should raise a ErrorException when params are incorrect' do
      array = 'error array'
      group = double('Group')
      TaskTemplate.should_receive(:errors).and_return(array)
      begin
        TaskTemplate.check_params('task_name', 'task_description', group)
        fail
      rescue ErrorsException => e
        e.errors.should eq array
      end
    end
  end
  
  describe 'errors' do
  
    it 'should return empty error list when the params are correct' do    
      group = double('Group')  
      TaskTemplate.should_receive(:check_name).with([], 'task_name', group).and_return([])
      TaskTemplate.should_receive(:check_description).with([], 'task_description').and_return([])
      error = TaskTemplate.errors('task_name', 'task_description', group)
      error.should be_empty
    end
    
    it 'should return list with error when empty name' do      
      group = double('Group')  
      TaskTemplate.should_receive(:check_name){ |*args| args[0].push('anError')}
      TaskTemplate.should_receive(:check_description){ |*args| args[0]}
      error = TaskTemplate.errors('', 'task_description', group)
      error.should include'anError'    
    end
  end
  
  describe 'check_name' do
    
    it 'shoul not add error when param is not blank and unique' do
      arrayError = []     
      group = double('Group')  
      FormatTester.should_receive(:is_alp_num).with('task1').and_return(true)
      TaskTemplate.should_receive(:find_by_name_and_group).with('task1', group).and_return(nil)
      TaskTemplate.check_name(arrayError, 'task1', group)
      arrayError.should be_empty
    end
    
    it 'shoul add error when blank name' do
      arrayError = []
      group = double('Group')  
      FormatTester.should_receive(:is_alp_num).with('').and_return(false)
      TaskTemplate.check_name(arrayError, '', group)
      arrayError.should have(1).items
    end    
    
    it 'shoul add error when not unique' do
      arrayError = []
      group = double('Group')  
      FormatTester.should_receive(:is_alp_num).with('task1').and_return(true)
      TaskTemplate.should_receive(:find_by_name_and_group).with('task1', group).and_return([]) #nil means unique
      TaskTemplate.check_name(arrayError, 'task1', group)
      arrayError.should have(1).items
    end
  end
  
  describe 'check_description' do
    
    it 'shoul not add error when description is not blank' do
      arrayError = []     
      group = double('Group')  
      FormatTester.should_receive(:is_alp_num).with('description').and_return(true)
      TaskTemplate.check_description(arrayError, 'description')
      arrayError.should be_empty
    end
    
    it 'shoul add error when blank description' do
      arrayError = []
      group = double('Group')  
      FormatTester.should_receive(:is_alp_num).with('').and_return(false)
      TaskTemplate.check_description(arrayError, '')
      arrayError.should have(1).items
    end  
  end
    
  
end
