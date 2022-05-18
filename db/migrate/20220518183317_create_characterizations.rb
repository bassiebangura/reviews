class CreateCharacterizations < ActiveRecord::Migration[6.1]
  def change
    create_table :characterizations do |t|
      t.Movie :references
      t.Genre :reference

      t.timestamps
    end
  end
end
