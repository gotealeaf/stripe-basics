class AddPlanToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :plan, :string
  end
end
