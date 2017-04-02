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

$months = ["january", "february", "march", "april", "may", "june", "july", 
"august", "september", "october", "november", "december"]

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    #get the first name
    name = gets
    name.rstrip!
    
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        puts "Please enter the cohort"
        cohort = gets
        cohort.rstrip!
        cohort = cohort.to_sym
        puts "Please enter the country of birth"
        country = gets
        country.rstrip!
        puts "What are there hobbies?"
        hobbies = gets
        hobbies.rstrip!
        
        students << {name: name, cohort: cohort, country: country, hobbies: hobbies}
        puts students.count > 1 ? "Now we have #{students.count()} students" : "Now we have #{students.count()} student"
        #get another name from the user
        name = gets
        name.rstrip!
    end
    
    # return the array of students
    students
end

new_students = input_students

def add_students(newbies)
    index = 0
    until index == newbies.length
        student = newbies[index]
        $students << student
        index +=1
    end
end

def print_header
    puts "The students of Villain Academy"
    puts "_ _ _ _ _ _ _ _ _ _ _"
end

def format_text(student, index)
    print "#{index + 1}.".center(5) + " #{student[:name]}".center(40)
    print "(#{student[:cohort]} cohort)".center(20) + "\n"
end

def print_students(students)
    puts "If you would like to see a list of all students please enter \"y\" or \"n\" for other options:"
    choice = gets.chomp
    
    if choice == "n"
        puts "1 - List names beginning with a specific letter"
        puts "2 - List names of a certain length"
        puts "3 - List students by cohort"
        choice = gets.chomp
    else
    end
    
    if choice == "1"
        puts "Please enter a letter:"
        choice_2 = gets.chomp
    elsif choice == "2"
        while true
            puts "Please enter the length:"
            choice_2 = gets.chomp
            if choice_2 =~ /\d/
                choice_2 = choice_2.to_i
                break
                
            else
                puts "That's not a number!"
            end
        end
    elsif choice == "3"
        puts "Please enter a month"
        choice_2 = gets.chomp
        choice_2.downcase!
        until $months.include? choice_2
            puts "Please enter a valid month"
            choice_2 = gets.chomp
            choice_2.downcase!
        end
        choice_2 = choice_2.to_sym
        puts choice_2.is_a? Symbol
    else
    end
    
    print_header
    
    if choice == nil || choice == "n"
        index = 0
        until index == students.length
            student = students[index]
            format_text(student, index)
            index += 1
        end
    elsif choice == "1"
        index = 0
        until index == students.length
            student = students[index]
            if student[:name][0].downcase == choice_2.downcase
                format_text(student, index)
            else
            end
            index +=1
        end
    elsif choice == "2"
        index = 0
        until index == students.length
            student = students[index]
            if student[:name].length <= choice_2
                format_text(student, index)
            else
            end
            index += 1
        end
    elsif choice == "3"
        index = 0
        until index == students.length
            student = students[index]
            if student[:cohort] == choice_2
                format_text(student, index)
            else
            end
            index += 1
        end
    else
        index = 0
        until index == students.length
            student = students[index]
            format_text(student, index)
            index += 1
        end
    end
end

def print_footer(names)
    puts "Overall, we have #{names.count()} great students"
end

    
# nothing happens until we call the methods
add_students(new_students)
print_students($students)
print_footer($students)