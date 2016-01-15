class CardsController < ApplicationController
  before_action :authenticate_user!

  def update
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    subscription = customer.subscriptions.retrieve(current_user.stripe_subscription_id)
    subscription.update(source: params[:stripeToken])

    current_user.update(
      card_last_four: params[:card_last_four],
      card_brand: params[:card_brand],
      card_exp_month: params[:card_exp_month],
      card_exp_year: params[:card_exp_year]
    )

    redirect_to edit_user_registration_path, notice: "Successfully updated your card"
  end

end
