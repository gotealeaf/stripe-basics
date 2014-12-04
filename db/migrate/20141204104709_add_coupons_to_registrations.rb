class AddCouponsToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :coupon, :string
  end
end
