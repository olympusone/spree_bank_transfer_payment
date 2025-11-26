module Spree
  class PaymentMethod::BankTransfer < Spree::PaymentMethod
    def method_type
      type.demodulize.underscore
    end

    def default_name
      Spree.t(:bank_transfer_method)
    end

    def payment_icon_name
      'genericbank'
    end

    def custom_form_fields_partial_name
      :bank_transfer_instructions
    end

    def source_required?
      false
    end

    def auto_capture?
      false
    end

    def actions
      %w[capture void]
    end

    # Indicates whether its possible to capture the payment
    def can_capture?(payment)
      payment.pending?
    end

    # Indicates whether its possible to void the payment.
    def can_void?(payment)
      !payment.void?
    end

    def capture(*)
      simulated_successful_billing_response
    end

    def cancel(*)
      simulated_successful_billing_response
    end

    def credit(*)
      simulated_successful_billing_response
    end

    private

    def simulated_successful_billing_response
      ActiveMerchant::Billing::Response.new(true, '', {}, {})
    end
  end
end
