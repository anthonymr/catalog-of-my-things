require_relative 'user_interface'

def main
  ui = UserInterface.new
  ui.start
rescue Interrupt
  puts "\nBye!"
end

main
