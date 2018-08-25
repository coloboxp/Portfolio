class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :duration
      t.text :code_or_url

      t.timestamps
    end
  end
end
