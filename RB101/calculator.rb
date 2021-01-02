#Build a command line calculator program that does the following:

#asks for two numbers
# for the type of operation to perform: add, subtract, multiply or divide
#displays the result

Kernel.puts("Welcome to Calculator")

Kernel.puts("What'the first number")
number1 = Kernel.gets().chomp()

Kernel.puts("What'the second number")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform 1)add 2)subtract 3)multiply 4)divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
elsif operator == '4'
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("The Result is #{result}")
