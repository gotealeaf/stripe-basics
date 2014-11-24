class AddStripeCardTokenToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :card_token, :string
  end
end
