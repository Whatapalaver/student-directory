@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

# let's put all the students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while name is not empty, repeat this code
  while !name.empty? do
    puts "Enter cohort"
    cohort = gets.chomp
    # add the student hash to the array
    if cohort.empty?
      @students << {name: name, cohort: :november}
    else
      @students << {name: name, cohort: cohort.to_sym}
    end
    if @students.count > 0
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have 1 student"
    end
    # get another name from the user
    puts "Enter name"
    name = gets.chomp
  end
end

def print_header
  if @students.count > 0
    puts "The students of Villains Academy".center(50)
    puts "-".center(50,"-")
  end
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count > 0
    if @students.count > 1
      puts "Overall, we have #{@students.count} great students"
    else @students.count == 1
      puts "Overall, we have only 1 great student"
    end
  end
end

def save_students
  # open file for writing
  file = File.open("students.csv", "w")
  # iterate over teh array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

# Commented out section below relates to other print options
# Exercise answers no longer required
=begin

# print students whose names starts with specific letter
def print_first_letter(students, letter)
  students.each do |student|
    if student[:name].start_with?(letter)
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# print only students whose name is longer than 12 characters
def print_length(students, max_length)
  students.each do |student|
    if student[:name].length < max_length
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# print all students
def print_while
  i = 0
  until i == @students.length
    puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
    i += 1
  end
end

def print_by_category
  # print the students grouped by cohort
  cohort_array = []
    @students.each do |hash|
      cohort_array.push(hash[:cohort]).uniq!
    end

    cohort_array.each do |cohort|
      puts cohort
      @students.each_with_index do |student, index|
        if student[:cohort] == cohort
          puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
        end
      end
    end
end
=end


interactive_menu
