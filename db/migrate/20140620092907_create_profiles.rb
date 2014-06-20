class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :phone
      t.string :desc
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
