class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.decimal :pointsWon
      t.decimal :partipPoints
      t.string :status

      t.timestamps
    end
  end
end
