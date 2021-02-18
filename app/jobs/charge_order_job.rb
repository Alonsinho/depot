class ChargeOrderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    order.charge!(pay_type_params)
  end
end
