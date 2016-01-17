Stripe.api_key = STRIPE_SECRET

class RecordCharges
  def call(event)
    # Capture the Event object from Stripe
    charge = event.data.object
    # Look up the user in our database
    user = User.find_by_stripe_id charge.customer
    # Record a charge in our database
    c = user.charges.where(stripe_id: charge.id).first_or_create
    c.update(
      amount: charge.amount,
      card_last_four: charge.source.last4,
      card_brand: charge.source.brand,
      card_exp_month: charge.source.exp_month,
      card_exp_year: charge.source.exp_year
    )
  end
end

StripeEvent.configure do |events|
  events.subscribe 'charge.succeeded', RecordCharges.new
end
