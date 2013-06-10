migration 2, :create_task_templates do
  up do
    create_table :task_templates do
      column :id, Integer, :serial => true
      column :name, String, :length => 255
      column :description, String
      column :group_id, Integer
    end
  end

  down do
    drop_table :task_templates
  end
end
