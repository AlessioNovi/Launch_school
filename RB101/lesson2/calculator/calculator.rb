# Build a command line calculator program that does the following:

# asks for two numbers
# for the type of operation to perform: add, subtract, multiply or divide
# displays the result

require 'yaml'

MESSAGES = YAML.load_file('messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i().to_s() == num
end

def valid_float?(num)
  num.to_f().to_s == num
end

def number?(num)
  valid_number?(num) || valid_float?(num)
end

def operation_to_message(op)
  outcome = case op
            when '1'
              MESSAGES['adding']
            when '2'
              MESSAGES['subtracting']
            when '3'
              MESSAGES['multiplying']
            when '4'
              MESSAGES['dividing']
            end
  outcome
end

def play_again?(answ)
  answ == 'n' || answ == 'no'
end

def valid_answer?(an)
  %w(y yes n no).include?(an)
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp().strip
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("#{MESSAGES['hello_name']} #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt(MESSAGES['not_a_valid_number'])
    end
  end
  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt(MESSAGES['not_a_valid_number'])
    end
  end
  prompt(MESSAGES['operator_prompt'])
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator) && operator == '4' && number2 == '0'
      prompt(MESSAGES['no_zero_division'])
    elsif %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['must_choose_1_2_3_or_4'])
    end
  end
  prompt("#{operation_to_message(operator)} #{MESSAGES['the_two_numbers']}")
  result = case operator
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
           end
  prompt("#{MESSAGES['the_result_is']} #{result}")
  prompt(MESSAGES['another_calculation?'])
  answer = ''
  loop do
    answer = Kernel.gets().chomp().downcase
    if valid_answer?(answer)
      break
    else 
      prompt(MESSAGES['wrong_input'])
    end
  end
  if play_again?(answer)
    break
  else
    prompt(MESSAGES['restart_calculator'])
    sleep 2
    system 'clear'
  end
end
prompt(MESSAGES['thank_you'])
