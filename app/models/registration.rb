class Registration < ActiveRecord::Base
  belongs_to :course

  def process_payment
    customer_data = {email: email, card: card_token, coupon: coupon}
                        .merge( (course.plan.blank?)? {}: {plan: course.plan})
    customer = Stripe::Customer.create customer_data

    Stripe::Charge.create customer: customer.id,
                          amount: course.price*100,
                          description: course.name,
                          currency: 'usd'
    customer_id = customer.id
  end

  def renew
    update_attribute :end_date, (Date.today + 1.month)
  end
end
