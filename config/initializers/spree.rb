Rails.application.config.after_initialize do
  Spree.payment_methods << Spree::PaymentMethod::BankTransfer

  Spree::PermittedAttributes.payment_method_attributes << :instructions
end
