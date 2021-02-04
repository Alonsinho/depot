require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Canarian Products Store Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal [ENV['SMTP_USER_NAME']], mail.from
    assert_match (/1 x Clipper de Limon/), mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Canarian Products Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal [ENV['SMTP_USER_NAME']], mail.from
    assert_match (/<td[^>]*>1<\/td>\s*<td>Clipper de Limon<\/td>/),
      mail.body.encoded
  end

end
