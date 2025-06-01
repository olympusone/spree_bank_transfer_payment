class AddInstructionsToPaymentMethods < ActiveRecord::Migration[8.0]
  def change
    add_column :spree_payment_methods, :instructions, :text
  end
end
