@students = [] # an empty array accessible to all methods

def add_student(name, cohort = :november)
    @students << {name: name, cohort: cohort}
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
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
    puts "3. Save the list to a file"
    puts "4. Load the list from a file"
    puts "9. Exit"
end

def show_students
    #2. read the input and save it into a variable
    print_header
    print_student_list(@students)
    print_footer(@students)
end

def add_students_to_file(file)
    # iterate over the array of students
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
end

def save_students(filename = "students.csv" )
    # open the file for writing
    file = File.open(filename, "w") {|file| add_students_to_file(file)}
end



def read_file(file)
    # read the contents from a file
    @students = []
    file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        add_student(name, cohort.to_sym)
    end
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r") {|file| read_file(file)}
end


def try_load_students
    filename = ARGV.first # first argument from the command line
    if filename.nil? 
        load_students
        
    elsif File.exists?(filename) # if it exists
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else # if it doesn't exist
        puts "Sorry, #{filename} doesn't exist."
        exit # quit the program
    end
end

def file_name(filename)
    while filename == ""
        puts "You have to enter a name fo the file"
        filename = STDIN.gets.chomp
    end
    filename = filename + ".csv"
    filename
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
            puts "Please enter the name for the file"
            filename = STDIN.gets.chomp
            filename = file_name(filename)
            save_students(filename)
                
            puts "File #{filename} has been saved"
            
        when "4"
            # load a list of students from the file students.csv
            puts "Please enter the name of the file you wish to open"
            filename = STDIN.gets.chomp
            filename = file_name(filename)
            load_students(filename)
            puts "Student list loaded from #{filename}"
            
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
        process(STDIN.gets.chomp)
        
    end
end

try_load_students
interactive_menu