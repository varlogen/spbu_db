// Мартынов 201гр. 6 этап запросы:

1) Выбираем сумму призовых фондов по регионам проведения турниров, не учиывая The Internationalы (правда их в БД всего 1), сортируем по убыванию

SELECT r.name AS region_name, sum(t.prize) AS prize_sum 
FROM tournaments AS t 
INNER JOIN cities 
ON (t.city = cities.id AND t.name NOT LIKE '%International%')
INNER JOIN countries AS c
ON (cities.country = c.id)
INNER JOIN regions AS r
ON (c.region = r.id)
GROUP BY r.name
ORDER BY prize_sum DESC;

2) Выбираем все команды, выводим название, количество игроков в ней, которым больше 26, сортируем по этому значению (по убыванию) и выводим разницу в возрасте между самым старым и самым молодым игоками

SELECT t.name AS team_name, count(p.name) AS players, 
(AGE((SELECT MAX(age) FROM players WHERE team = t.id),
    (SELECT MIN(age) FROM players WHERE team = t.id))
           ) AS dif
FROM players AS p
RIGHT JOIN teams AS t
ON (p.team = t.id AND 
p.age < date(current_date - interval '26 year'))
GROUP BY team_name, dif
ORDER BY players DESC;

3) Выбираем матчи сыгранные не "всухую" и выводим в привычном для обчного пользователя виде

SELECT t_1.name AS team1, concat(to_char(score_team_1, '9'), ':', to_char(score_team_2, '9')) AS score, t_2.name AS team2 
FROM matches
INNER JOIN teams AS t_1
ON (team_1 = t_1.id AND score_team_1 > 0)
INNER JOIN teams AS t_2
ON (team_2 = t_2.id AND score_team_2 > 0)