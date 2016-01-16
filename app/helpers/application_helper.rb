module ApplicationHelper
  # For developmental purposes
  def card_value field
    if Rails.env.development?
      case field
      when :number
        "4242 4242 4242 4242"
      when :cvc
        "123"
      when :month
        "12"
      when :year
        "2020"
      end
    end
  end


  def card_fields_class
    "hidden" if current_user.stripe_id?
  end
end
