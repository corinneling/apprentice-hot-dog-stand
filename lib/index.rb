require_relative './controllers/menu_controller'
require_relative './helpers'

menu = MenuController.new

Helpers.clear
puts "Welcome to Hot Diggity Dog!"
puts

menu.show_menu