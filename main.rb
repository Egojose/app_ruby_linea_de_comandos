require_relative 'question'
require 'pry'

class Main
  attr_reader :q1

  def initialize
    @q1 = Question.new
  end

  def iniciar
    ans = 's'
    puts "#{'-' * 80}\n Bienvenido a reto 5, Para jugar solo debes ingresar la respuesta\n" \
         " correcta para cada una de las definiciones. Listo? (Presiona q para salir)\n #{'-' * 80}\n\n"

    while ans != 'q' && @q1.check_questions

      puts "Pregunta\n\n"
      @q1.new_question

      until @q1.check_ans(ans) || ans == 'q'
        puts "\nAdivinar:\n\n"
        ans = gets.chomp
        break if ans == 'q'
        puts @q1.check_ans(ans) ? "\n#{'*' * 40}Correcto!#{'*' * 40}\n\n" : "\n#{'*' * 40}Oops!, Intenta de nuevo#{'*' * 40}\n\n"
      end

    end

    if !@q1.check_questions
      puts 'Felicidades, has respondido a todas las preguntas!'
    else
      puts 'Gracias por jugar! Hasta pronto!'
    end
  end
end

juego = Main.new
juego.iniciar
