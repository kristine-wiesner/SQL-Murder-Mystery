--Crime was a ​murder​ that occurred sometime on  Jan.15, 2018​ and that it took place in ​SQL City​. 
--Start by retrieving the corresponding crime scene report from the police department’s database.

SELECT *
FROM crime_scene_report
WHERE type = 'murder'
AND city = 'SQL City'
AND date = 20180115

--Security footage shows that there were 2 witnesses. 
--The first witness lives at the last house on "Northwestern Dr". 
--The second witness, named Annabel, lives somewhere on "Franklin Ave".


SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1; 
--First witness:  14887, Morty Schapiro 118009



SELECT * 
FROM person
WHERE address_street_name = 'Franklin Ave'
AND name LIKE '%Annabel%'
--second witness:  16371	Annabel Miller	490173	103	Franklin Ave	318771143



--Interview table 14887, Morty Schapiro
--"I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". 
--Only gold members have those bags. The man got into a car with a plate that included "H42W"."

--16371	Annabel Miller
--"I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th."

--plate number
SELECT p.name, dl.plate_number, m.membership_status, ci.check_in_date
FROM drivers_license AS dl
INNER JOIN person AS p 
ON dl.id = p.license_id
INNER JOIN get_fit_now_member as m
ON p.id = m.person_id
INNER JOIN get_fit_now_check_in as ci
ON m.id = ci.membership_id
WHERE plate_number LIKE "%H42W%"
AND membership_status ='gold'
AND check_in_date = 20180109


--RESULT: name	plate_number	membership_status	check_in_date
--    Jeremy Bowers	0H42W2	gold	20180109

--MAster mind: Jeremy's transcript

--person_id	transcript
--67318	I was hired by a woman with a lot of money. 
--I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
--She has red hair and she drives a Tesla Model S. 
--I know that she attended the SQL Symphony Concert 3 times in December 2017.

SELECT p.name
FROM drivers_license AS dl
INNER JOIN person AS p
ON dl.id = p.license_id
INNER JOIN facebook_event_checkin AS fb
ON p.id = fb.person_id
WHERE gender ='female'
AND height >= 65
AND height <= 67
AND hair_color ='red'
AND car_make = 'Tesla'
AND car_model = 'Model S'


--RESULT  Miranda Priestly


