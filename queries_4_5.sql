// Мартынов 201гр. 4-5 этап
Простые запросы:

1) Выбираем название команд из региона с id = 1
SELECT name AS team FROM teams WHERE region = 1;

2) Выбираем названия турниров с призовым фондом больше или равным 1000000 и датой начала не позднее месяца назад 
SELECT name AS tournament FROM tournaments WHERE prize >= 1000000 AND date_begin > current_date - interval '1 month';

3) Выбираем id команд с турнира с индексом 10 и сортируем их по убыванию выигранного процента от призового фонда
SELECT team AS team_id FROM tournaments_results WHERE tournament = 10 ORDER BY percent DESC;

4) Выбираем команды и количество игрков в ней (те что занесены в БД)
SELECT team, count(*) AS number_of_players FROM players GROUP BY team;

Средние запросы
1) Выбираем ники и имена игроков которые играют на роли semi-support с сортировкой их по возрасту
SELECT nik_name, players.name AS real_name FROM players INNER JOIN roles ON players.role = roles.id WHERE roles.name = 'semi-support' ORDER BY age;

2) Выбираем игроков, их ники, страну рождения и их команду, у которые страна рождения географически принадлежит тому же региону, что и команда за которую они играют, сортируем по возрасту
SELECT nik_name AS nik, temp.name, temp.country_name, teams.name AS team FROM teams LEFT JOIN (SELECT players.nik_name, players.name, players.age, countries.name AS country_name, team, region FROM players INNER JOIN countries ON players.country = countries.id) AS temp ON temp.team = teams.id WHERE teams.region = temp.region ORDER BY age;

3) Выбираем команду и количество турниров на которых она побывала (из внесенных в БД), выводим по убыванию
SELECT name, count(tournament) AS registered_tournaments FROM teams INNER JOIN tournaments_results ON teams.id = tournaments_results.team GROUP BY name ORDER BY registered_tournaments DESC;