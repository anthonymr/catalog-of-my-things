class UserInterface

    def initialize
        @selected_option = 0
    end

    def start
        until exit_option?
            print_menu
            ask_option
            evaluate_option            
        end
    end

    private
    def print_menu
        puts 'Please choose an options'
        puts '1 - List all books'
        puts '2 - List all music albums'
        puts '3 - List all movie'
        puts '4 - List all genres (e.g "Comedy", "Thriller")'
        puts '5 - List all labels (e.g. "Gift", "New")'
        puts '6 - List all authors (e.g. "Stephen King")'
        puts '7 - List all sources (e.g. "From a friend", "Online shop")'
        puts '8 - Add a book'
        puts '9 - Add a music album'
        puts '10 - Add a movie'
        puts '11 - Add a game'
        puts '12- EXIT'
    end

    def ask_option
        puts 'Please select an option'
        @selected_option = gets.chomp.to_i
        unless valid_option?
			puts "Invalid option, try again"
			ask_option
        end
    end

    def exit_option?
        @selected_option == 12
    end

    def valid_option?
        @selected_option > 0 && @selected_option <= 12
    end

    def evaluate_option
        case @selected_option
		when 1
		  puts "option 1"
		when 2
		  puts "option 2"
		when 3
		  puts "option 3"
        when 4
            puts "option 4"
        when 5
            puts "option 5"
        when 6
            puts "option 6"
        when 7
            puts "option 7"
        when 8
            puts "option 8"
        when 9
            puts "option 9"
        when 10
            puts "option 10"
        when 11
            puts "option 11"
		end
    end
end
