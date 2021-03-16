class CreateMagazinesOenologists < ActiveRecord::Migration[5.2]
  def change
    create_table :magazines_oenologists do |t|
      t.references :magazine, foreign_key: true
      t.references :oenologist, foreign_key: true

      t.timestamps
    end
  end
end
