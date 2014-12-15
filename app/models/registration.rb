class Registration < ActiveRecord::Base
  belongs_to :course

  def process_payment
    customer = Stripe::Customer.create email: email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: course.price*100,
                          description: course.name,
                          currency: 'usd'

  end
end
