require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Order confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["sales@rise4.net"], mail.from
    assert_match /Programming Ruby 1.9/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Message to send the order", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["sales@rise4.net"], mail.from
    assert_match /<td>Programming Ruby 1.9 <\/td>/, mail.body.encoded
  end

end
