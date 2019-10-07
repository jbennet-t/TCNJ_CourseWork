# Project name: Assignment 1: Application Development
# Description: Project to sort students into classes for enrollment, based on inputed data via .csv files. Data includes ids, courses, choices, prereqs, etc.
# Filename: assignment1_JordanSinoway
# File Description: main file for project, containing all code for project to run. Currently no other files are used besides input/output files
# Last modified on: 9/13/2019


require 'smarter_csv' #import of smarter_csv gem
require 'csv' #import of csv gem


#-------------------------------------------------------------------------------------------------------------
#csv file input
#-----------------------------------------------------------------------------------------
#  section: csv file input
#
#    Parameters:
#    file; temp string for file input
#    i; counter integer
#
#    Pre-condition: None
#    Post-condition: Files entered correctly
#-----------------------------------------------------------------------------------------
puts "\n"
puts "Welcome to the TCNJ Computer Science Enrollment Generation Software"
puts "\n"
j = 1
while j == 1 #getting user input for course contraints file
    puts "Enter course contraints filename (including .csv): "
    file = gets.chomp
    if File.exist?(file)#if file exists, continue
        course_hash = SmarterCSV.process(file)
        j = 0
        break
    else #if file doesnt exist, loop back
        puts "Incorrect file, please try again \n"
    end
end

j = 1
while j == 1 #getting user input for student preferences file
    puts "Enter student preferences filename (including .csv): "
    file = gets.chomp
    if File.exist?(file)#if file exists, continue
        student_prefs_hash = SmarterCSV.process(file)
        j = 0
        break
    else #if file doesnt exist, loop back
        puts "Incorrect file, please try again \n"
    end
end

puts "Enter name for enrollment output file (including .csv): " #input for enrollment output file name
outputfile1 = gets.chomp.to_s

puts "Enter name for student output file (including .csv): "#input for student output file name
outputfile2 = gets.chomp.to_s


#----------------------------------------------------
#Course contraints input file conversion to hash & fixing of headers

#-----------------------------------------------------------------------------------------
#  section: file conversino to hash and setting of headers in hash file
#
#    Parameters:
#    mappings; mask to map headers/keys onto hashes
#    i; counter integer
#    course_hash; array containing nested hashes
#
#    Pre-condition: Properly set up input files
#    Post-condition: array of nested hashes is created
#-----------------------------------------------------------------------------------------
i = 0
while i < course_hash.length #converts csv file headers(keys) to standard names, removing illegal characters and errors
    mappings = {(course_hash[i].keys[0]) => :course_number, course_hash[i].keys[1] => :num_sections, course_hash[i].keys[2] => :min_num_seats, course_hash[i].keys[3] => :max_num_seats, course_hash[i].keys[4] => :prereqs}
    course_hash[i].keys.each { |k| (course_hash[i])[ mappings[k] ] = course_hash[i].delete(k) if mappings[k] }
i+=1
end

#----------------------------------------------------
#student preferences input file conversion to hash & fixing of headers

i = 0
while i < student_prefs_hash.length #converts csv file headers(keys) to standard names, removing illegal characters and errors
    mappings = {(student_prefs_hash[i].keys[0]) => :paws_id, student_prefs_hash[i].keys[1] => :num_courses_desired, student_prefs_hash[i].keys[2] => :first_choice, student_prefs_hash[i].keys[3] => :second_choice, student_prefs_hash[i].keys[4] => :third_choice, student_prefs_hash[i].keys[5] => :fourth_choice, student_prefs_hash[i].keys[6] => :fifth_choice}
    student_prefs_hash[i].keys.each { |k| (student_prefs_hash[i])[ mappings[k] ] = student_prefs_hash[i].delete(k) if mappings[k] }
i+=1
end



#--------------------------------------------------------------------------------------------------------------------
#Student object

#-----------------------------------------------------------------------------------------
#
#  Class: student(id, num_des, choice1, choice2, choice3, choice4, choice5)
#
#    Parameters:
#    id; string, student's paws_id
#    num_des; integer, number of classes desired
#    choice1; students first choice for classes
#    choice2; students second choice for classes
#    choice3; students third choice for classes
#    choice4; students fourth choice for classes
#    choice5; students fifth choice for classes
#
#    Pre-condition: previous sections executed correctly
#    Post-condition: student class is created and prepped for object creation
#-----------------------------------------------------------------------------------------
class Student #student object that holds data of each student, easier to minipulate than hash
    def initialize(id, num_des, choice1, choice2, choice3, choice4, choice5)
        @paws_id = id.to_s
        @num_des = num_des.to_i
        @choice1 = choice1.to_s
        @choice2 = choice2.to_s
        @choice3 = choice3.to_s
        @choice4 = choice4.to_s
        @choice5 = choice5.to_s
        @courses_enrolled = []
        @errors = ""
        @num_courses_allowed = num_des.to_i #setting counter for each student for number of courses the can enroll in
    end

    def id_out #gets paws_id
        return @paws_id
    end

    def numdes_out #gets numdes
        return @numdes
    end

    def choice1_out #gets choice1
        return @choice1
    end

    def choice2_out #gets choice2
        return @choice2
    end

    def choice3_out #gets choice3
        return @choice3
    end

    def choice4_out #gets choice4
        return @choice4
    end

    def choice5_out #gets choice5
        return @choice5
    end

    def num_courses_allowed #gets num_courses_allowed
        return @num_courses_allowed
    end

    def out_of_options #sets num couses allowed to 0
        @num_courses_allowed = 0
    end

    def add_course(course) #adds successfully enrolled course to list of courses for student
        @courses_enrolled << course.to_s
        @num_courses_allowed -= 1
    end

    def add_error(error) #adds error message for each course unable to enroll
        @errors += error
    end

    def remove_course(ccourse) #removes course if enrollment minimum not met, or if splitting course into two section (student would be added to other section)
        @courses_enrolled.delete(ccourse)
    end

    def courses_enrolled_out #returns string version of array of enrolled courses for particular student
        temparray = []
        temparray = @courses_enrolled
        return temparray.join(";")
    end

    def pass_course_enrolled_list #passes entire array for modification
        return @courses_enrolled
    end

    def accept_course_enrolled_list(temparray) #accepts altered array and sets internal array equal to altered version
        @courses_enrolled.clear
        @courses_enrolled = temparray
    end

    def errors_out #gets errors
        return @errors
    end
end

#-----------------------------------------------------------------------------------------
#  section: converting each hash into a new student object and adding to array
#
#    Parameters:
#    student_array; array, array to hold student objects
#    s_length; integer, length of student hash
#    i; counter integer
#
#    Pre-condition: csv was properly converted to array of nested hashes
#    Post-condition: array of student objects created
#-----------------------------------------------------------------------------------------
s_length = (student_prefs_hash.length)
student_array = []
i = 0
while i < s_length #converting each hash (student) in the hash array into a student object
    student_array[i] = Student.new(student_prefs_hash[i][:paws_id], student_prefs_hash[i][:num_courses_desired], student_prefs_hash[i][:first_choice], student_prefs_hash[i][:second_choice], student_prefs_hash[i][:third_choice], student_prefs_hash[i][:fourth_choice], student_prefs_hash[i][:fifth_choice])
    i+=1
end

#-----------------------------------------------------------------------------------------------------------------------------------------------
#Course object

#-----------------------------------------------------------------------------------------
#
#  Class: student(course_num, num_sections, min_num_seats, max_num_seats, pre_reqs)
#
#    Parameters:
#    course_num; string, name of course
#    num_sections; integer, number of sections
#    min_num_seats; integer, minimum number of seats for section not to get canceled
#    max_num_seats; integer, maximum availible seats in section
#    pre_reqs; string of required classes
#
#    Pre-condition: previous sections executed correctly
#    Post-condition: course class is created and prepped for object creation
#-----------------------------------------------------------------------------------------

class Course #course object that holds data of each course, easier to minipulate than hash
    def initialize(course_num, num_sections, min_num_seats, max_num_seats, pre_reqs)
        @course_num = course_num.to_s
        @num_sections = num_sections.to_i
        @min_num_seats = min_num_seats.to_i
        @max_num_seats = max_num_seats.to_i
        @pre_reqs = pre_reqs.to_s
        @seats_filled = 0 #counter for seats filled
        @paws_ids = [] #list of students in class
        @section_num = ""
        @open_seats = max_num_seats.to_i #counter for seats open
    end

    def course_out #gets course_num
        return @course_num
    end

    def section_num_out #gets section_num
        return @section_num
    end

    def section_num_in(secnum) #sets section_num
        @section_num = secnum
    end

    def numsec_out #gets number of section
        return @num_sections
    end

    def min_seats_out #gets min seats
        return @min_num_seats
    end

    def max_seats_out #gets max seats
        return @max_num_seats
    end

    def open_seats_in(seats_in) #sets open seats
        @open_seats = seats_in
    end

    def pre_reqs_out #get pre reqs
        return @pre_reqs
    end

    def seats_filled_out #gets seats_filled
        return @seats_filled
    end

    def open_seats_out #gets open seats
        return @open_seats
    end

    def add_seat #decrements open seats and increments seats filled for each student added to class
        @seats_filled += 1
        @open_seats -= 1
    end

    def add_student(id) #adds student to class
        @paws_ids << id.to_s
    end

    def paws_ids_out #returns string version of array of students in particular course
        temparray1 = []
        temparray1 = @paws_ids
        return temparray1.join(";")
    end

    def pass_students_enrolled_list #passes entire array for modification
        return @paws_ids
    end

    def accept_students_enrolled_list(temparray) #accepts altered array and sets internal array equal to altered version
        @paws_ids.clear
        @paws_ids = temparray
    end

    def cancel_course #cancels course
        @paws_ids.clear
        @paws_ids << "canceled due to < min_num seats"
    end


end

#-----------------------------------------------------------------------------------------
#  section: converting each hash into a new course object and adding to array
#
#    Parameters:
#    course_array; array, array to hold course objects
#    c_length; integer, length of course hash
#    i; counter integer
#
#    Pre-condition: csv was properly converted to array of nested hashes
#    Post-condition: array of course objects created
#-----------------------------------------------------------------------------------------
c_length = (course_hash.length)
course_array = []
i = 0
while i < c_length #converting each hash (course) in the hash array into a course object
    course_array[i] = Course.new(course_hash[i][:course_number], course_hash[i][:num_sections], course_hash[i][:min_num_seats], course_hash[i][:max_num_seats], course_hash[i][:prereqs])
    i+=1
end
#----------------------------------------------------------------------------------------------------------------------------------------------------------
#creating appropriate number of sections based on num_sections

#-----------------------------------------------------------------------------------------
#  section: splitting courses into multiple sections
#
#    Parameters:
#    course_array; array, array to hold course objects
#    c_length; integer, length of course hash
#    tempobject; object, temporary object ot hold course data while being duplicated
#
#    Pre-condition: array of course objects was properly created
#    Post-condition: course objects duplicated and assigned as new open sections
#-----------------------------------------------------------------------------------------

i = 0
while i < c_length
    if course_array[i].numsec_out == 0
        course_array[i].add_student("Illegal # of sections")
        course_array[i].open_seats_in(0)

    elsif course_array[i].numsec_out == 1
        course_array[i].section_num_in("01")

    elsif course_array[i].numsec_out == 2
        tempobject = Course.new(course_array[i].course_out,2,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("02") #setting new section to section 02
        course_array[i].section_num_in("01") #setting original section to section 01
        course_array.push(tempobject)
    elsif course_array[i].numsec_out == 3
        tempobject = Course.new(course_array[i].course_out,2,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("02") #setting new section to section 02
        course_array.push(tempobject)

        tempobject = Course.new(course_array[i].course_out,3,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("03") #setting new section to section 03
        course_array.push(tempobject)
        course_array[i].section_num_in("01") #setting original section to section 01

    elsif course_array[i].numsec_out == 4
        tempobject = Course.new(course_array[i].course_out,2,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("02") #setting new section to section 02
        course_array.push(tempobject)

        tempobject = Course.new(course_array[i].course_out,3,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("03") #setting new section to section 03
        course_array.push(tempobject)

        tempobject = Course.new(course_array[i].course_out,4,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("04") #setting new section to section 04
        course_array.push(tempobject)
        course_array[i].section_num_in("01") #setting original section to section 01

    elsif course_array[i].numsec_out == 5
        tempobject = Course.new(course_array[i].course_out,2,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("02") #setting new section to section 02
        course_array.push(tempobject)

        tempobject = Course.new(course_array[i].course_out,3,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("03") #setting new section to section 03
        course_array.push(tempobject)

        tempobject = Course.new(course_array[i].course_out,4,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("04") #setting new section to section 04
        course_array.push(tempobject)

        tempobject = Course.new(course_array[i].course_out,5,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("05") #setting new section to section 05
        course_array.push(tempobject)
        course_array[i].section_num_in("01") #setting original section to section 01

    elsif course_array[i].numsec_out == 8
        tempobject = Course.new(course_array[i].course_out,2,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("02") #setting new section to section 02
        course_array.push(tempobject)

        tempobject = Course.new(course_array[i].course_out,3,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("03") #setting new section to section 03
        course_array.push(tempobject)

        tempobject = Course.new(course_array[i].course_out,4,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("04") #setting new section to section 04
        course_array.push(tempobject)

        tempobject = Course.new(course_array[i].course_out,5,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("05") #setting new section to section 05
        course_array.push(tempobject)

        tempobject = Course.new(course_array[i].course_out,6,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("06") #setting new section to section 05
        course_array.push(tempobject)

        tempobject = Course.new(course_array[i].course_out,7,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("07") #setting new section to section 05
        course_array.push(tempobject)

        tempobject = Course.new(course_array[i].course_out,8,course_array[i].min_seats_out,course_array[i].max_seats_out,course_array[i].pre_reqs_out)
        tempobject.section_num_in("08") #setting new section to section 05
        course_array.push(tempobject)

        course_array[i].section_num_in("01") #setting original section to section 01

    end
    i+=1
end

#------------------------------------------------------------------------------------------------------------------------------------
#assigning students to classes, recording students in classes, recording students total courses (all post sorting)

#------------------------------------------------------------------------------------------------------
#  section: Algorithm to sort students into sections based on choices, qualifications, and availibility
#
#    Parameters:
#    course_array; array, array to hold course objects
#    student_array: array, array to hold student objects
#    c_length; integer, length of course array
#    s_length; integer, length of student array
#    i; counter integer
#    j; counter integer
#
#    Pre-condition: course and student object arrays were correctly created, sections were set up
#    Post-condition: students sorted into classes
#------------------------------------------------------------------------------------------------------


#first_choice run
c_length = (course_array.length)
s_length = (student_array.length)
i = 0
while i < c_length #iterates through the course array as the top loop
    j = 0
    while j < s_length #iterates through the student array for each class in the course array
        if ((course_array[i].course_out.delete(' ') + ":N") == student_array[j].choice1_out.delete(' ')) and (student_array[j].num_courses_allowed > 0) #if student does not meet prereqs
            student_array[j].add_error((course_array[i].course_out).to_s + "-prereqs not met, ")
        elsif (((course_array[i].course_out.delete(' ') + ":Y") == student_array[j].choice1_out.delete(' ')) or ((not(((student_array[j].choice1_out).include?(":N")) and ((student_array[j].choice1_out).include?(":Y"))))) and student_array[j].choice1_out.include?(course_array[i].course_out)) and (course_array[i].open_seats_out > 0) and (student_array[j].num_courses_allowed != 0) and ((student_array[j].pass_course_enrolled_list.include?(course_array[i].course_out + "-01")) == false)
            student_array[j].add_course(course_array[i].course_out + "-" + course_array[i].section_num_out)#add course to student course list
            course_array[i].add_seat #increment seats filled & decrement open seats
            course_array[i].add_student((student_array[j].id_out).to_s) #adds student to course list
        elsif (course_array[i].course_out == student_array[j].choice1_out.delete(' ')) and (course_array[i].open_seats_out == 0) and (student_array[j].num_courses_allowed > 0)
            student_array[j].add_error((course_array[i].course_out).to_s + "-course full, ") #if course is full
                #puts student_array[j].errors_out
        end
        j += 1
    end
i += 1
end

#second_choice run
i = 0
while i < c_length #iterates through the course array as the top loop
    j = 0
    while j < s_length #iterates through the student array for each class in the course array
        if ((course_array[i].course_out.delete(' ') + ":N") == student_array[j].choice2_out.delete(' ')) and (student_array[j].num_courses_allowed > 0) #if students don't meet prereqs
            student_array[j].add_error((course_array[i].course_out).to_s + "-prereqs not met, ")
        elsif (((course_array[i].course_out.delete(' ') + ":Y") == student_array[j].choice2_out.delete(' ')) or ((not(((student_array[j].choice2_out).include?(":N")) and ((student_array[j].choice2_out).include?(":Y"))))) and student_array[j].choice2_out.include?(course_array[i].course_out)) and (course_array[i].open_seats_out > 0) and (student_array[j].num_courses_allowed != 0) and ((student_array[j].pass_course_enrolled_list.include?(course_array[i].course_out)) == false)
            student_array[j].add_course(course_array[i].course_out + "-" + course_array[i].section_num_out)#add course to student course list
            course_array[i].add_seat #increment seats filled & decrement open seats
            course_array[i].add_student(student_array[j].id_out.to_s) #adds student to course list
        elsif (course_array[i].course_out.delete(' ') == student_array[j].choice2_out.delete(' ')) and (course_array[i].open_seats_out == 0) and (student_array[j].num_courses_allowed > 0)  #if course is full
            student_array[j].add_error((course_array[i].course_out).to_s + "-course full, ")
        end
        j += 1
    end
i += 1
end

#third_choice run
i = 0
while i < c_length #iterates through the course array as the top loop
    j = 0
    while j < s_length #iterates through the student array for each class in the course array
        if ((course_array[i].course_out.delete(' ') + ":N") == student_array[j].choice3_out.delete(' ')) and (student_array[j].num_courses_allowed > 0)#if students don't meet prereqs
            student_array[j].add_error((course_array[i].course_out).to_s + "-prereqs not met, ")
        elsif (((course_array[i].course_out.delete(' ') + ":Y") == student_array[j].choice3_out.delete(' ')) or ((not(((student_array[j].choice3_out).include?(":N")) and ((student_array[j].choice3_out).include?(":Y"))))) and student_array[j].choice3_out.include?(course_array[i].course_out)) and (course_array[i].open_seats_out > 0) and (student_array[j].num_courses_allowed != 0) and ((student_array[j].pass_course_enrolled_list.include?(course_array[i].course_out)) == false)
            student_array[j].add_course(course_array[i].course_out + "-" + course_array[i].section_num_out)#add course to student course list
            course_array[i].add_seat #increment seats filled & decrement open seats
            course_array[i].add_student(student_array[j].id_out.to_s) #adds student to course list
        elsif (course_array[i].course_out.delete(' ') == student_array[j].choice3_out.delete(' ')) and (course_array[i].open_seats_out == 0) and (student_array[j].num_courses_allowed > 0)#if course is full, but prereqs met
            student_array[j].add_error((course_array[i].course_out).to_s + "-course full, ")
        end
        j += 1
    end
i += 1
end

#fourth_choice run
i = 0
while i < c_length #iterates through the course array as the top loop
    j = 0
    while j < s_length #iterates through the student array for each class in the course array
        if ((course_array[i].course_out.delete(' ') + ":N") == student_array[j].choice4_out.delete(' ')) and (student_array[j].num_courses_allowed > 0)#if students don't meet prereqs
            student_array[j].add_error((course_array[i].course_out).to_s + "-prereqs not met, ")
        elsif (((course_array[i].course_out.delete(' ') + ":Y") == student_array[j].choice4_out.delete(' ')) or ((not(((student_array[j].choice4_out).include?(":N")) and ((student_array[j].choice4_out).include?(":Y"))))) and student_array[j].choice4_out.include?(course_array[i].course_out)) and (course_array[i].open_seats_out > 0) and (student_array[j].num_courses_allowed != 0) and ((student_array[j].pass_course_enrolled_list.include?(course_array[i].course_out)) == false)
            student_array[j].add_course(course_array[i].course_out + "-" + course_array[i].section_num_out)#add course to student course list
            course_array[i].add_seat #increment seats filled & decrement open seats
            course_array[i].add_student(student_array[j].id_out.to_s) #adds student to course list
        elsif (course_array[i].course_out.delete(' ') == student_array[j].choice4_out.delete(' ')) and (course_array[i].open_seats_out == 0) and (student_array[j].num_courses_allowed > 0) #if course is full, but prereqs met
            student_array[j].add_error((course_array[i].course_out).to_s + "-course full, ")
        end
        j += 1
    end
i += 1
end



#fifth_choice run
i = 0
while i < c_length #iterates through the course array as the top loop
    j = 0
    while j < s_length #iterates through the student array for each class in the course array
        if ((course_array[i].course_out.delete(' ') + ":N") == student_array[j].choice5_out.delete(' ')) and (student_array[j].num_courses_allowed > 0)#if students don't meet prereqs
            student_array[j].add_error((course_array[i].course_out).to_s + "-prereqs not met, ")
        elsif (((course_array[i].course_out.delete(' ') + ":Y") == student_array[j].choice5_out.delete(' ')) or ((not(((student_array[j].choice5_out).include?(":N")) and ((student_array[j].choice5_out).include?(":Y")))))and student_array[j].choice5_out.include?(course_array[i].course_out)) and (course_array[i].open_seats_out > 0) and (student_array[j].num_courses_allowed != 0) and ((student_array[j].pass_course_enrolled_list.include?(course_array[i].course_out)) == false)
            student_array[j].add_course(course_array[i].course_out + "-" + course_array[i].section_num_out)#add course to student course list
            course_array[i].add_seat #increment seats filled & decrement open seats
            course_array[i].add_student(student_array[j].id_out.to_s) #adds student to course list
        elsif (course_array[i].course_out.delete(' ') == student_array[j].choice5_out.delete(' ')) and (course_array[i].open_seats_out == 0) and (student_array[j].num_courses_allowed > 0) #if course is full
            student_array[j].add_error((course_array[i].course_out).to_s + "-course full, ")
        elsif (student_array[j].num_courses_allowed != 0)
            student_array[j].add_error("all other desired courses full ")
            student_array[j].out_of_options
        end
        j += 1
    end
i += 1
end

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#canceling courses with not enough enrollment/sections
#-----------------------------------------------------------------------------------------
#  section: canceling courses with not enough enrollment/sections
#
#    Parameters:
#    course_array; array, array to hold course objects
#    student_array: array, array to hold student objects
#    c_length; integer, length of course array
#    s_length; integer, length of student array
#    i; counter integer
#    j; counter integer
#
#    Pre-condition: students were correctly sorted into courses via the algorithm
#    Post-condition: course without enough enrollment are cancelled
#-----------------------------------------------------------------------------------------

i = 0
while i < c_length
    if (course_array[i].seats_filled_out >= 1 and course_array[i].seats_filled_out < course_array[i].min_seats_out) or (course_array[i].seats_filled_out == 0)  #if course does not meet minimum seats requirement
        course_array[i].cancel_course #cancels course, removes students
        j = 0
        while j < s_length
            student_array[j].remove_course((course_array[i].course_out).to_s + "-" + course_array[i].section_num_out) #removing course from individual students' enrollments
            j += 1
        end
    end
    i += 1
end

#------------------------------------------------------------------------------------------------------------------
#converting arrays into hashes for output, and outputting
#-----------------------------------------------------------------------------------------
#  section: converting arrays into hashes for output, and outputting
#
#    Parameters:
#    enrollment_hash; array, holds course objects converted to nested hashes
#    students_hash; array, holds student objects converted to nested hashes
#    c_length; integer, length of course array
#    s_length; integer, length of student array
#    i; counter integer
#    temphash; hash, temporary hash that holds data imported from object
#
#    Pre-condition: students were correctly sorted into courses via the algorithm
#    Post-condition: course without enough enrollment are cancelled
#-----------------------------------------------------------------------------------------


#enrollment output hash/file conversion
enrollment_hash = []
i=0
while i < c_length #runs through course_array and pulls data from each object, turning it into a hash representing said object
    temphash = {:course_num => course_array[i].course_out, :section_num=> course_array[i].section_num_out, :paws_ids => course_array[i].paws_ids_out, :seats_filled => course_array[i].seats_filled_out, :open_seats => course_array[i].open_seats_out}
    enrollment_hash << temphash #adds sub hashes to overall array holding all hashes
i+=1
end


#student output hash/file conversion
students_hash = []
i=0
while i < s_length  #runs through student_array and pulls data from each object, turning it into a hash representing said object
    temphash = {:paws_id => student_array[i].id_out, :courses_enrolled => student_array[i].courses_enrolled_out, :errors => student_array[i].errors_out}
    students_hash << temphash #adds sub hashes to overall array holding all hashes
i+=1
end


#converting enrollment hash to csv
CSV.open(outputfile1, "w") do |csv|
  csv << enrollment_hash.first.keys # adds the column names on the first line
  enrollment_hash.each do |hash|
    csv << hash.values
  end
end

#converting student hash to csv
CSV.open(outputfile2, "w") do |csv|
  csv << students_hash.first.keys # adds the column names on the first line
  students_hash.each do |hash|
    csv << hash.values
  end
end

puts "\n"
puts "Processing Completed"
puts "\n"
