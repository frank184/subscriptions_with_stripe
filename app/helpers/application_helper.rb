module ApplicationHelper

  def generate_submit_text(method)
    case method
    when :post
      "Create"
    when :put || :patch
      "Update"
    else
      "Submit"
    end
  end

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

end
