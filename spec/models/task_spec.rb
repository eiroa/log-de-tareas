require 'spec_helper'

describe Task do

  describe 'return description' do
    it 'a task return their description' do
    #task interactua con la base de datos para obtener la descripcion.
      Group.destroy
      TaskTemplate.destroy
      task_template = BuilderTaskTemplate.new().with_description('a_crazy_description').build()
      task = Task.create(task_template, nil)
      task.get_description.should eq 'a_crazy_description'
    end

  end

  describe 'validate_time' do
    it 'should raise NegativeTimeError when minutes are negative' do
      lambda{Task.validate_time(-2)}.should raise_exception(NegativeTimeError)
    end

    it 'should raise EmptyTimeError when minutes are nil' do
      lambda{Task.validate_time(nil)}.should raise_exception(EmptyTimeError)
    end

    it 'should raise EmptyTimeError when minutes are zero' do
      lambda{Task.validate_time(0)}.should raise_exception(EmptyTimeError)
    end

    it 'should raise NotAnIntegerTimeError when minutes not are integer' do
      lambda{Task.validate_time('pepe')}.should raise_exception(NotAnIntegerTimeError)
    end
  end

  describe 'update_time' do
    before(:each) do
      @task = Task.new
      @account = Account.new
      Task.should_receive(:find_by_id_and_account_id).and_return(@task)
      Task.should_receive(:validate_time).and_return('')
    end
    
    describe 'and type_update is "Estimar"' do
      it 'should asign 20 on estimatedTime when minutes are 20' do
        Task.update_time(1, 1, 'Estimar', 0, 20)
        @task.estimatedTime.should eq 20
      end
      
      it 'should asign 80 on estimatedTime when hours is 1 and minutes are 20' do
        Task.update_time(1, 1, 'Estimar', 1, 20)
        @task.estimatedTime.should eq 80
      end
    end
    
    describe 'and type_update is "Trackear"' do
      it 'should asign 20 on elapsedTime when minutes are 20' do
        Task.update_time(1, 1, 'Trackear', 0, 20)
        @task.elapsedTime.should eq 20
      end
      
      it 'should asign 80 on elapsedTime when hours is 1 and minutes are 20' do
        Task.update_time(1, 1, 'Trackear', 1, 20)
        @task.elapsedTime.should eq 80
      end
    end
  end
end
