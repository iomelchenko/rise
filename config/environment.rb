# -*- encoding : utf-8 -*-
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Rise::Application.initialize!

  # Emails ajastment

  Rise::Application.configure do

       config.action_mailer.delivery_method = :smtp # | :sendmail
  end
