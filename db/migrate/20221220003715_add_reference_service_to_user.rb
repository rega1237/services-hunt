class AddReferenceServiceToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :user, foreign_key: true
  end
end
