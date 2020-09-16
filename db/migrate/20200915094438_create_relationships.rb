class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :following, null: false , foreign_key: { to_tabel: :users }
      t.references :follower, null: false, foreign_key: { to_tabel: :users }
      t.timestamps
    end
  end
end
