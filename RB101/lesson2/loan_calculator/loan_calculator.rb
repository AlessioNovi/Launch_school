# to calculate MONTHLY PAYMENT is needed
#the loan amount
#the Annual Percentage Rate (APR) -> need to find monthly interest rate 
#the loan duration -> need to find loan duration in months

#formula for monlthy payment is m = p * (j / (1 - (1 + j)**(-n)))

#m = monthly payment
#p = loan amount
#j = monthly interest rate
#n = loan duration in months

#pseudo code

#promtp hello
#ask for loan amount - (must be no void and > 0)
#ask for APR - APR/100/12 to convert in monthly interest rate (must be no void and > 0)
#ask for loan duration - must convert all in months (can ask once all in months or once in year*12 and months and then sum)  (must be no void and > 0)
#perform formula and show monthly payment
#ask for other calculation or exit

require 'yaml'

MESSAGES = YAML.load_file('messages.yml')

def prompt(message)
  message = MESSAGES[message]
  puts  "=> #{message}"
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

def valid_float(num)
  num.to_f.to_s == num
end

def number?(num)
  valid_int?(num) || valid_float(num)
end

def get_loan_amount
  loan_amount = ''
  loop do
    prompt('ask_loan')
    loan_amount = gets.chomp.strip
    break if number?(loan_amount) && loan_amount.to_f > 0
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

def apr_not_positive?(apr)
  number?(apr) && apr.to_f <= 0
end

def get_monthly_apr(apr)
  (apr.to_f / 100 / 12).truncate(4)
end

def get_and_convert_apr
  apr = ''
  loop do
    prompt('ask_apr')
    apr = gets.chomp.strip.delete "%"
    if apr_valid_input?(apr)
      break
    elsif apr_not_positive?(apr)
      prompt('not_positive_apr')
    else
      prompt('wrong_apr_input')
    end
  end
  get_monthly_apr(apr)
end

def display_monthly_apr(apr)
  puts "#{prompt_no_newline('display_monthly_apr')} #{(apr * 100).round(3)}%"
end

clear

prompt('welcome')

loop do
  loan_amount = get_loan_amount
  display_loan_amount(loan_amount)
  apr = get_and_convert_apr
  display_monthly_apr(apr)
end


