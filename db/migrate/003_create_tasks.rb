migration 3, :create_tasks do
  up do
    create_table :tasks do
      column :id, Integer, :serial => true
      column :pending , "BOOLEAN"
      column :estimated_time, Integer
      column :elapsed_time, Integer
      column :task_template_id, Integer
      column :account_id, Integer
    end
  end

  down do
    drop_table :tasks
  end
end
