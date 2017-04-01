# Let's put all the students into an array
$students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    #get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count()} students"
        #get another name from the user
        name = gets.chomp
    end
    # return the array of students
    students
end

new_students = input_students

def add_students(newbies)
    newbies.each do |student|
        $students << student
    end
end

def print_header
    puts "The students of Villain Academy"
    puts "_ _ _ _ _ _ _ _ _ _ _"
end

def print(students)
    puts "Would you like to output names beginning with a specific letter? y/n"
    choice = gets.chomp
    if choice == "y"
        puts "Please enter a letter:"
        letter = gets.chomp
    else
    end
    
    print_header
    
    if letter == nil
        students.each_with_index do |student, index|
            puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
        end
    else
        students.each_with_index do |student, index|
            if student[:name][0].downcase == letter.downcase
                puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
            else
            end
        end
    end
end

def print_footer(names)
    puts "Overall, we have #{names.count()} great students"
end

    
# nothing happens until we call the methods
add_students(new_students)

print($students)
print_footer($students)