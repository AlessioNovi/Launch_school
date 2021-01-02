# Build a command line calculator program that does the following:

# asks for two numbers
# for the type of operation to perform: add, subtract, multiply or divide
# displays the result

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
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end
  outcome
end

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?
    prompt("Make sure to use a valid name")
  else
    break
  end
end

prompt("Hello #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt("What'the first number")
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt("Hmm... that doesn't look a valid number")
    end
  end
  number2 = ''
  loop do
    prompt("What'the second number")
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt("Hmm... that doesn't look a valid number")
    end
  end
  operator_prompt = <<-MSG
   What operation would you like to perform 
   1) add 
   2) subtract 
   3) multiply 
   4) divide
  MSG
  prompt(operator_prompt)
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator) && operator == '4' && number2 == '0'
      prompt("You can't divide by zero, choose only 1) 2) or 3) in this case")
    elsif %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1 2 3 or 4")
    end
  end
  prompt("#{operation_to_message(operator)} the two numbers")
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
  prompt("The Result is #{result}")
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end
prompt("Thank you for using the calculator. Good Bye!")
