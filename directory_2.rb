@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

def print_header
  puts "The students of my cohort at Maker\'s Academy"
  puts "-------------"
end

def print_student_list(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def print_menu
    #1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "9. Exit"
end

def show_students
    #2. read the input and save it into a variable
    print_header
    print_student_list(@students)
    print_footer(@students)
end

def save_students
    # open the file for writing
    file = File.open("students.csv", "w")
    # iterate over the array of students
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end


def process(selection)
    #3. do what the user has asked
    case selection
        when "1"
            # input the students
            input_students
        when "2"
            # show the studnets
            show_students
            
        when "3"
            # save students list to students.csv
            save_students
            
        when "9"
            exit # this will cause the program to terminate
        else
            puts "I don't know what you mean, try again"
    end
end



def interactive_menu
    loop do
        #1. print the menu and ask the user what to do
        print_menu
        #2. read the input and save it into a variable
        #3. do what the user has asked
        process(gets.chomp)
        
    end
end

interactive_menu