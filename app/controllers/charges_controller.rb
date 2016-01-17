class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_charge, only: [:show]

  # GET /charges/1.pdf
  def show
    respond_to do |format|
      format.pdf {
        send_data @charge.receipt.render,
        filename: "#{@charge.created_at.strftime("%Y-%m-%d")}-screencasts-receipt.pdf",
        type: 'application/pdf',
        disposition: :inline
      }
    end
  end


  private

    def set_charge
      @charge = current_user.charges.find(params[:id])
    end

end
