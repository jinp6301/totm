class CreateRecipeTable < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      ## Database authenticatable
      t.string :ingredientslist
      t.string :score


      t.timestamps
    end
  end
end
