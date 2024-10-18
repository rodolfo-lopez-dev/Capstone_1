/* Section 1: Demographics related to school 
This section looks at the schools,students in the 60629 area to see if a sports complex
should be built
*/

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
WHERE Student_Count_Total IS NULL;

# ensuring the accuracy of student count by looking for missing/nulls values

SELECT COUNT(*) 
FROM dataforcps
WHERE Zip = '60629' AND Is_High_School = 'True';

# Demonstrates only three strictly only high schools so ages 14 and up. 

SELECT SUM(Student_Count_Total) AS total_students_in_middle_and_high_school
FROM dataforcps
WHERE (Is_Middle_School = 'True' OR Is_High_School = 'True') AND Zip = '60629';

/* total number of students in middle and high school within the area code with the potential market for
the age groups that are likely to go to a sport complex in the area */

/* Section 2: Recreational areas 
We're assessing the need for an indoor facility based on existing recreational spaces 
also distribution of soccer/football/basketball courts
*/ 

SELECT `FACILITY TYPE`, COUNT(*) AS facility_count
FROM market_research.park_research_data
GROUP BY `FACILITY TYPE`;

# shows the facilities in chicago that are indoor/outdoor and results demonstrates a need for a sports complex that will be indoors

SELECT `FACILITY NAME`, `FACILITY TYPE`, COUNT(*) AS facility_count
FROM market_research.park_research_data
WHERE (`FACILITY NAME` LIKE '%SOCCER%' OR `FACILITY NAME` LIKE '%BASKETBALL%') AND 
(`FACILITY TYPE` = 'Indoor' OR `FACILITY TYPE` = 'Outdoor')
GROUP BY `FACILITY NAME`, `FACILITY TYPE`
ORDER BY `FACILITY NAME`, facility_count DESC;

/* We've reviewed indoor and outdoor recreational facilities in Chicago and concluded
 that there's a need for an indoor facility that aligns with our plan to develop a sports complex
*/

/* Section 3: Demographic by Age
Here we're looking for population by age ggroup and sex to see the groups that are likely 
to use a sport complex
*/

SELECT `Age Group`, SUM(`60629 Value`) AS population
FROM market_research.women_age_zipcode
WHERE `Age Group` IN ('10 to 14 years', '15 to 17 years', '18 and 19 years', '20 years', '21 years', 
                      '22 to 24 years', '25 to 29 years', '30 to 34 years', '35 to 39 years')
GROUP BY `Age Group`;

# found age group most likely to use a sport complex for women

SELECT `Age Group`, SUM(`60629 Value`) AS population
FROM market_research.male_zipcode
WHERE `Age Group` IN ('10 to 14 years', '15 to 17 years', '18 and 19 years', '20 years', '21 years', 
                      '22 to 24 years', '25 to 29 years', '30 to 34 years', '35 to 39 years')
GROUP BY `Age Group`;

# similar but now the male population

/* Section 4: Race and Income 
We're focusing on low-income and also seeing the racial demographics who are the main target group 
for this sports complex
*/

SELECT 
    Zip,
    SUM(Student_Count_Hispanic) AS total_hispanic,
    SUM(Student_Count_Black) AS total_black,
    SUM(Student_Count_White) AS total_white,
    SUM(Student_Count_Low_Income) AS total_low_income
FROM dataforcps
GROUP BY Zip
ORDER BY total_low_income DESC;

/* the results show that in the area there's a high level of low-income students that would benefit 
from an affordable and accessible facility such as a sports complex  */ 


