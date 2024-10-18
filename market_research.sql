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

SELECT `FACILITY TYPE`, COUNT(*) AS facility_count
FROM market_research.park_research_data
GROUP BY `FACILITY TYPE`;

# shows the facilities in chicago that are indoor/outdoor and leads to realize a need for more indoor facilites


SELECT `Age Group`, SUM(`60629 Value`) AS population
FROM market_research.women_age_zipcode
WHERE `Age Group` IN ('10 to 14 years', '15 to 17 years', '18 and 19 years', '20 years', '21 years', 
                      '22 to 24 years', '25 to 29 years', '30 to 34 years', '35 to 39 years')
GROUP BY `Age Group`;

# found age group most likely to use a sport complex

SELECT `Age Group`, SUM(`60629 Value`) AS population
FROM market_research.male_zipcode
WHERE `Age Group` IN ('10 to 14 years', '15 to 17 years', '18 and 19 years', '20 years', '21 years', 
                      '22 to 24 years', '25 to 29 years', '30 to 34 years', '35 to 39 years')
GROUP BY `Age Group`;

# similar but now the male population 






