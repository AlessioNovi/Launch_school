require 'yaml'

MESSAGES = YAML.load_file('messages.yml')

def prompt(message)
  message = MESSAGES[message]
  puts "=> #{message}"
end

def prompt_no_newline(message)
  message = MESSAGES[message]
  print  "=> #{message}"
end

def clear
  system 'clear'
end

def valid_int?(num)
  num.to_i.to_s == num
end

def valid_float?(num)
  num.to_f.to_s == num
end

def number?(num)
  valid_int?(num) || valid_float?(num)
end

def valid_loan?(loan_amount)
  number?(loan_amount) && loan_amount.to_f > 0
end

def get_loan_amount
  loan_amount = ''
  loop do
    prompt('ask_loan')
    loan_amount = gets.chomp.strip
    break if valid_loan?(loan_amount)
    prompt('wrong_input')
  end
  loan_amount.to_f
end

def display_loan_amount(loan_amount)
  puts "#{prompt_no_newline('display_loan_amount')} #{loan_amount}$"
end

def apr_valid_input?(apr)
  number?(apr) && apr.to_f > 0
end

def apr_too_small?(apr)
  number?(apr) && apr.to_f <= 0
end

def get_monthly_apr(apr)
  (apr.to_f / 100 / 12)
end

def get_apr
  apr = ''
  loop do
    prompt('ask_apr')
    apr = gets.chomp.strip.sub(/\%+$/, '')
    if apr_valid_input?(apr)
      break
    elsif apr_too_small?(apr)
      prompt('not_positive')
    else
      prompt('wrong_apr_input')
    end
  end
  apr.to_f
end

def display_apr(apr)
  puts "#{prompt_no_newline('display_apr')} #{(apr)}%"
end

def valid_value?(value)
  valid_int?(value) && value.to_i >= 0
end

def value_not_positive?(value)
  valid_int?(value) && value.to_i < 0
end

def get_value
  value = ''
  loop do
    prompt('ask_value')
    value = gets.chomp.strip.sub(/^0+$/, '0')
    if valid_value?(value)
      break
    elsif value_not_positive?(value)
      prompt('not_positive')
    else
      prompt('wrong_value_input')
    end
  end
  value.to_i
end

def display_years(years)
  puts "#{prompt_no_newline('display_years')} #{years}"
end

def display_months(months)
  puts "#{prompt_no_newline('display_months')} #{months}"
end

def get_loan_duration
  years = ''
  months = ''
  total_months = ''
  loop do
    prompt('ask_years')
    years = get_value
    display_years(years)
    prompt('ask_months')
    months = get_value
    display_months(months)
    total_months = (years * 12) + months
    break unless total_months <= 0
    prompt('zero_duration')
  end
  total_months
end

def get_payment(loan_amount, apr, loan_duration)
  loan_amount * (get_monthly_apr(apr) / (1 -
  (1 + get_monthly_apr(apr))**(-loan_duration))).round(2)
end

def display_payment(monthly_payment)
  puts "#{prompt_no_newline('payment')} #{monthly_payment}$"
end

def valid_answer?(answ)
  %w(y yes n no).include?(answ)
end

def check_valid_answer
  answer = ''
  loop do
    prompt('another_calculation?')
    answer = Kernel.gets().chomp().downcase
    break if valid_answer?(answer)
    prompt('wrong_answer')
  end
  answer
end

def play_again?
  answer = check_valid_answer
  answer == 'y' || answer == 'yes'
end

clear

prompt('welcome')

loop do
  loan_amount = get_loan_amount
  display_loan_amount(loan_amount)
  apr = get_apr
  display_apr(apr)
  loan_duration = get_loan_duration
  monthly_payment = get_payment(loan_amount, apr, loan_duration)
  display_payment(monthly_payment)
  break unless play_again?
end
prompt('thank_you')
