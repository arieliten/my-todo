# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
MyTodo::Application.initialize!

ActionView::Base.field_error_proc = Proc.new {|html, instance| html }