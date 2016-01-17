class Charge < ActiveRecord::Base
  belongs_to :user

  def receipt
    Receipts::Receipt.new(
      id: id,
      product: "Screencasts",
      company: {
        name: "Fake Inc.",
        address: "123 Fake St.\nFloor 2\nNew York City, NY 10012",
        email: "admin@mail.com",
        logo: Rails.root.join("app/assets/images/logo.jpg")
      },
      line_items: [
        ["Date",           created_at.to_s],
        ["Account Billed", "#{user.name} (#{user.email})"],
        ["Product",        "GoRails"],
        ["Amount",         "$#{amount / 100}.00"],
        ["Charged to",     "#{card_brand} (**** **** **** #{card_last_four})"],
        ["Transaction ID", id]
      ]
    )
  end

end
