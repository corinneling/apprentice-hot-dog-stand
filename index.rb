require_relative './controllers/menu_controller'

menu = MenuController.new

system "clear"
puts "Welcome to Hot Diggity Dog!"

menu.main_menu