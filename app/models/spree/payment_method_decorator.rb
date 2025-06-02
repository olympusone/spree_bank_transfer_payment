module Spree
  module PaymentMethodDecorator
    def bank_transfer?
      method_type == 'bank_transfer'
    end
  end
end

Spree::PaymentMethod.prepend Spree::PaymentMethodDecorator
