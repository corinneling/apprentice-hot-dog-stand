require_relative './controllers/menu_controller'

menu = MenuController.new

system "clear"
puts "Welcome to Hot Diggity Dog!"

menu.show_menu