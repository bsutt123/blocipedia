class ChargesController < ApplicationController
  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge =  Stripe::Charge.create(
      customer:  customer.id,
      amount: 15_00,
      description: "Blocipedia Membership - #{current_user.email}",
      currency: 'usd'
    )

    if charge.paid?
      flash[:notice] = "Thank you for your payment. It was successfully processed"
      current_user.update(role: "premium")
    else
      flash[:alert] = "There was a problem with your payment"
    end
    redirect_to root_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.name}",
      amount: 15_00
    }
  end
end
