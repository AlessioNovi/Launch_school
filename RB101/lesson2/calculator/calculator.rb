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

def play_again?(answ)
  answ == 'n' || answ == 'no'
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
    name = Kernel.gets().chomp().strip
    if name.empty?
      prompt(messages(language, 'valid_name'))
    else
      break
    end
  end
  name
end

def get_number_1(language)
  number1 = ''
  loop do
    prompt(messages(language, 'first_number'))
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt(messages(language, 'not_a_valid_number'))
    end
  end
  number1
end

def get_number_2(language)
  number2 = ''
  loop do
    prompt(messages(language, 'second_number'))
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt(messages(language, 'not_a_valid_number'))
    end
  end
  number2
end

def get_operator_and_check_zero_division(language, number2)
  operator = ''
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
    if valid_answer?(answer)
      break
    else
      prompt(messages(language, 'wrong_input'))
    end
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

clear # clears screen initially

prompt(messages(language, 'welcome'))

language = set_language(language) # asks for language

prompt(messages(language, 'ask_name'))

name = get_name(language) # asks for name

prompt(messages(language, 'hello_name') + ' ' + name)

loop do # main program loop
  number1 = get_number_1(language)
  number2 = get_number_2(language)
  prompt(messages(language, 'operator_prompt'))
  operator = get_operator_and_check_zero_division(language, number2)
  prompt(operation_to_message(operator, language) + ' ' +
  messages(language, 'the_two_numbers'))
  result = operator_case(operator, number1, number2)
  prompt(messages(language, 'the_result_is') + ' ' + result.to_s)
  prompt(messages(language, 'another_calculation?'))
  answer = check_valid_answer(language)
  if play_again?(answer) # will exit loop if type n/no
    break
  else
    prompt(messages(language, 'restart_calculator'))
    restart
  end
end
prompt(messages(language, 'thank_you'))
