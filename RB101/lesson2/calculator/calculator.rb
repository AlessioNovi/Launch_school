# Build a command line calculator program that does the following:

# asks for two numbers
# for the type of operation to perform: add, subtract, multiply or divide
# displays the result

require 'yaml'

MESSAGES = YAML.load_file('messages.yml')
language = 'en'

def messages(message, lang='en')
  MESSAGES[message][lang]
end

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

def operation_to_message(op, language)
  case op
  when '1'
    messages(language, 'adding')
  when '2'
    messages(language, 'subtracting')
  when '3'
    messages(language, 'multiplying')
  when '4'
    messages(language, 'dividing')
  end
end

def operator_case(operator, number1, number2)
  case operator
  when '1'
    number1.to_f() + number2.to_f()
  when '2'
    number1.to_f() - number2.to_f()
  when '3'
    number1.to_f() * number2.to_f()
  when '4'
    number1.to_f() / number2.to_f()
  end
end

def no_zero_div(op, num2)
  %w(1 2 3 4).include?(op) && op == '4' && num2 == '0'
end

def operator_input_check(op)
  %w(1 2 3 4).include?(op)
end

def play_again?(language)
  answer = check_valid_answer(language)
  answer == 'y' || answer == 'yes'
end

def valid_answer?(answ)
  %w(y yes n no).include?(answ)
end

def clear
  system 'clear'
end

def restart
  sleep 2
  system 'clear'
end

def get_name(language)
  name = ''
  loop do
    prompt(messages(language, 'ask_name'))
    name = Kernel.gets().chomp().strip
    break unless name.empty?
    prompt(messages(language, 'valid_name'))
  end
  name
end

def get_number_1(language)
  number1 = ''
  loop do
    prompt(messages(language, 'first_number'))
    number1 = Kernel.gets().chomp()
    break if number?(number1)
    prompt(messages(language, 'not_a_valid_number'))
  end
  number1
end

def get_number_2(language)
  number2 = ''
  loop do
    prompt(messages(language, 'second_number'))
    number2 = Kernel.gets().chomp()
    break if number?(number2)
    prompt(messages(language, 'not_a_valid_number'))
  end
  number2
end

def get_operator(language, number2)
  operator = ''
  prompt(messages(language, 'operator_prompt'))
  loop do
    operator = Kernel.gets().chomp()
    if no_zero_div(operator, number2)
      prompt(messages(language, 'no_zero_division'))
    elsif operator_input_check(operator)
      break
    else
      prompt(messages(language, 'must_choose_1_2_3_or_4'))
    end
  end
  operator
end

def check_valid_answer(language)
  answer = ''
  loop do
    answer = Kernel.gets().chomp().downcase
    break if valid_answer?(answer)
    prompt(messages(language, 'wrong_input'))
  end
  answer
end

def valid_language_choice?(language)
  %w(en it).include?(language)
end

def set_language(language)
  language_choice = ''
  loop do
    language_choice = Kernel.gets().chomp()
    if valid_language_choice?(language_choice)
      break
    else
      prompt(messages(language, 'valid_language'))
    end
  end
  language_choice
end

def display_welcome(language)
  clear
  prompt(messages(language, 'welcome'))
end

def display_named_welcome(language, name)
  prompt(messages(language, 'hello_name') + ' ' + name)
end

def display_both_numbers(operator, language)
  prompt(operation_to_message(operator, language) + ' ' +
  messages(language, 'the_two_numbers'))
end

def display_result(language, result)
  prompt(messages(language, 'the_result_is') + ' ' + result.to_s)
end

def restart_calculator(language)
  prompt(messages(language, 'restart_calculator'))
  restart
end

def display_goodbye(language)
  prompt(messages(language, 'thank_you'))
end

def display_another_calculation?(language)
  prompt(messages(language, 'another_calculation?'))
end

display_welcome(language)

language = set_language(language) # asks for language

name = get_name(language) # asks for name

display_named_welcome(language, name)

loop do # main program loop
  number1 = get_number_1(language)
  number2 = get_number_2(language)
  operator = get_operator(language, number2)
  display_both_numbers(operator, language)
  result = operator_case(operator, number1, number2)
  display_result(language, result)
  display_another_calculation?(language)
  break unless play_again?(language)
  restart_calculator(language)
end
display_goodbye(language)
