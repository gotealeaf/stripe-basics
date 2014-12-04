class Registration < ActiveRecord::Base
  belongs_to :course

  def process_payment
    customer_data = {email: self.email, card: self.card_token}
                        .merge( (self.course.plan.blank?)? {}: {plan: self.course.plan})
    customer = Stripe::Customer.create customer_data

    Stripe::Charge.create customer: customer.id,
                          amount: self.course.price*100,
                          description: self.course.name,
                          currency: 'usd'
    self.customer_id = customer.id
  end

  def renew
    self.update_attribute :end_date, (Date.today + 1.month)
  end
end
