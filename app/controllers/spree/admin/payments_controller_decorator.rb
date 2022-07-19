module Spree
    module Admin
        module PaymentsControllerDecorator
            def banktransfer
                _params = params.require(:payment).permit(:response_code)

                if @payment.update(response_code: _params[:response_code])
                    flash[:success] = Spree.t(:payment_updated)

                    redirect_to spree.admin_order_payments_path(@order)
                else
                    flash[:error] = e.message.to_s
                    
                    redirect_back(fallback_location: spree.admin_order_payments_path(@order))
                end
            end
        end
    end
end
  
::Spree::Admin::PaymentsController.prepend Spree::Admin::PaymentsControllerDecorator