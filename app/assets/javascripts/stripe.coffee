stripeResponseHandler = (status, response) ->
  $form = $('#payment-form')
  if response.error
    $form.find('.payment-errors').text response.error.message
    $form.find('button').prop 'disabled', false
  else
    token = response.id
    card = response.card
    console.log(card)
    $form.append $('<input type="hidden" name="stripeToken" />').val(token)

    $form.append $('<input type="hidden" name="card_last_four" />').val(card.last4)
    $form.append $('<input type="hidden" name="card_exp_month" />').val(card.exp_month)
    $form.append $('<input type="hidden" name="card_exp_year" />').val(card.exp_year)
    $form.append $('<input type="hidden" name="card_brand" />').val(card.brand)
    $form.get(0).submit()
  return

$(document).on 'ready page:change', ->
  Stripe.setPublishableKey $('meta[name=stripe-key]').attr('content')
  $('#payment-form').off().on 'submit', (event) ->
    $form = $(this)
    if $('.card-fields').hasClass('hidden')
      $form.get(0).submit()
    else
      $form.find('button').prop 'disabled', true
      Stripe.card.createToken $form, stripeResponseHandler
    false

  $('.use-different-card').on 'click', ->
    $('.card-on-file').hide()
    $('.card-fields').show()
    $('.card-fields').removeClass('hidden')
