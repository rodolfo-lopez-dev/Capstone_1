SELECT COUNT(*) 
FROM dataforcps
WHERE Zip = '60629';

# demonstrates 19 schools in the 60629 area

SELECT Short_Name, Student_Count_Total
FROM dataforcps
WHERE '60629';

# shows me schools, and the amount of students that are associated with the entire school

SELECT COUNT(*) 
FROM dataforcps
WHERE Zip = '60629' AND Is_High_School = 'True';

# Demonstrates only three strictly only high schools so ages 14 and up. 

SELECT SUM(Student_Count_Total) AS total_students_in_middle_and_high_school
FROM dataforcps
WHERE (Is_Middle_School = 'True' OR Is_High_School = 'True') AND Zip = '60629';

/* total number of students in middle and high school within the area code with the potential market for
a sports complex that would benefit the people in the area */

