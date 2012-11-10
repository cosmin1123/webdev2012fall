require 'test/unit'
require 'sinatra'
require 'sinatra/activerecord'

configure do
  options = { :adapter  => "sqlite3", :database => "dev.db" }
  ActiveRecord::Base.establish_connection(options)
  ActiveRecord::Base.logger = Logger.new(STDERR)
end

class Questions < ActiveRecord::Base
end

class Answers < ActiveRecord::Base
end

class User < ActiveRecord::Base
end

class Voted < ActiveRecord::Base
end

class VotedAnswers < ActiveRecord::Base
end



    


class Challenge
	def self.selectOption keyboard_input
	
		if(keyboard_input == "" || keyboard_input == 'm')
			self.mainMenu
			return "mainMenu"
		end
		if(keyboard_input == '1')
			self.showQuestions
			return "showQuestions"

		end
	
		if(keyboard_input == "q")
			self.quit
			return quit
		end
		
		if(keyboard_input == "2")
			self.addQuestion
			return "addQuestion"
		end
	end

	def self.addQuestion
		print "\n\nAsk a question: "
		keyboard_input = gets.chomp	
		questions = Questions.new
		questions.question = keyboard_input
		questions.votes = 0
		questions.userId = 2
		questions.save
		
		
	end

	def self.firstScreen
		banner_text = "Introdu nickname: "
		print banner_text	
		username = gets.chomp
		
		user = User.new
		user.username = username
		user.save
		return username
	end
	
	def self.mainMenu
		puts "\n\nMain menu"
		print "\n\n1) Show all questions \n"
		print "2) Ask a question \n"
		puts  "q) Quit"
		puts "\n\nSelect an option: "			
	end	
	
	def self.showQuestions
		puts "\n\nShowing all questions\n"
		a = Questions.all
        print a
	end
	
	def self.start
		system("clear")
		banner_text = "Esti logat ca si: "
		prompt_with = ""
		keyboard_input = ""
		username = self.firstScreen
		loop do
			system("clear")
			
			print banner_text
			print username
			self.selectOption keyboard_input	
			keyboard_input = gets.chomp
		end
	end
end
Challenge.start

class ChallengeTest < Test::Unit::TestCase
	def mainMenuRespondsToOne
		assert_equals( selectOption(1), "showQuestions")
	end
end
