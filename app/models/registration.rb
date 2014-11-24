class Registration < ActiveRecord::Base
  belongs_to :course

  def process_payment
    customer = Stripe::Customer.create email: self.email,
                                       card: self.card_token

    Stripe::Charge.create customer: customer.id,
                          amount: self.course.price*100,
                          description: self.course.name,
                          currency: 'usd'

  end
end
