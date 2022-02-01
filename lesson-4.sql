SQL-2, API

Изменение структуры таблицы (ALTER TABLE )

1. ADD COLUMN - добавить столбец

ALTER TABLE pet 
ADD COLUMN species VARCHAR (10);

I love GIT

2. DROP COLUMN - удалить столбец
ALTER TABLE pet 
DROP COLUMN age;

 
3. CHANGE COLUMN - изменить имя и тип данных столбца

ALTER TABLE pet 
CHANGE COLUMN species toy VARCHAR (30);

В данном примере species - это текущий столбец, который мы хотим заменить
				 toy - это столбец на который мы хотим заменить и сразу прописываем
				 параметры если мы их тоже изменаем.
Нужно помнить, что данная команда не всегда может сработать, если менять типы данных которые 
не совместимы. Например когда мы миняем тип данных VARCHAR на INT.



4. MODIFY COLUMN - изменить только тип данных столбца

ALTER TABLE pet 
MODIFY COLUMN toy VARCHAR (20);




Изменение данных в таблице  (UPDATE)
UPDATE идет в ключевой связки с SET (настроить, набор)

UPDATE football         - где менять
SET name = 'crish_jr'   - на что менять
WHERE id = 6;           - кому менять

UPDATE football
SET name = 'crish jr', 
age = 18
WHERE id = 6;

UPDATE football
SET name = 'buffy', 
age = NULL
WHERE id = 6;
Тщлько для SELECT стравиться IS для NULL, в UPDATE ставиться "="


Сортировка данных   (ORDER BY) 

ORDER BY ASC    - в порядке возрастания (от А до Я, 0 - 1000...)

ORDER BY DESC   - в порядке убывания    (от Я до А, ...1000 - 0)


SELECT * FROM football
ORDER BY name ASC;

SELECT * FROM football
ORDER BY name;                                    короткая команда для ASC

SELECT * FROM football
ORDER BY age DESC;

SELECT * FROM football
ORDER BY name ASC, age ASC;   - для выстриавания данны по нескольким запросам

Если в ORDER BY прописываем несколько условий, то сначала выполнает по первому запросу
потом по второму запросу и только после исключения  первого.


Ограничение выборки данных   (LIMIT)

SELECT * FROM football
LIMIT 3;

SELECT * FROM football
ORDER BY age DESC
LIMIT 3;

LIMIT - ставиться в конце, он прописывается после всех данных и условий



Соединения

Внешний ключ  (FOREIGN KEY)
идентификатор, который ссылается на первичный ключ другой таблицы

http://f934340c.beget.tech/people.html

Поскольку мы работаем в нескольких таблицах (и больше) и название столбцов могут совпадать,
чтобы небыло путаницы, мы должны давать полные названия столбцов через точку
("название таблицы.название столбца")

Не имеет  значение в какой из задействованых таблиц мы делаем запросы.
Если мы работаем во внутреннем соединение (JOIN), то выборка делается только там, где ест есть соответствие.
Чтобы выбрать одно (или бальше) значение добавляем в конце WHERE/



Внутреннее соединение (INNER JOIN)

SELECT people.name, cars.model FROM people 
INNER JOIN cars
ON people.cars_id = cars.id;

SELECT people.name, cars.model FROM people 
INNER JOIN cars
ON people.cars_id = cars.id
WHERE people.name = 'lisa';

SELECT people.name, cars.model FROM people
INNER JOIN cars
ON people.cars_id = cars.id
WHERE people.name = 'jack'
OR people.name = 'vasya';

SELECT people.name, cars.model FROM cars 
INNER JOIN people
ON cars.id = people.cars_id;


Короткая запись для INNER JOIN   (JOIN)
это соединение, где значение первой таблицы СТРОГО соответсвует значению второй таблицы

SELECT people.name, cars.model FROM people 
JOIN cars
ON people.cars_id = cars.id;



Внешнее соединение       (LEFT OUTER JOIN      RIGHT OUTER JOIN)
Выборка всех значений главной таблицы и подбор соответствий из другой таблицы.

Если мы пишем     people LEFT OUTER JOIN cars    - таблица указаная  слева от 
команды (в данном случаи people) главная.
Если мы пишем     people RIGHT OUTER JOIN cars    - таблица указаная справа от 
команды (в данном случаи cars) главная.



SELECT people.name, cars.model FROM people 
LEFT OUTER JOIN cars
ON people.cars_id = cars.id;


SELECT people.name, cars.model FROM people 
LEFT OUTER JOIN cars
ON people.cars_id = cars.id
WHERE cars.model IS NULL;


Короткая команда для внешнего соединения
LEFT JOIN
RIGHT JOIN

SELECT people.name, cars.model FROM people 
LEFT JOIN cars
ON people.cars_id = cars.id;


Псевдонимы  (AS) - приминяются тогда, когда у нас в команде много повторяюцихся 
слов (название таблицы и столбцы)

SELECT p.name, c.model FROM people AS p
INNER JOIN cars AS c
ON p.cars_id = c.id;

SELECT p.name, c.model FROM people p
JOIN cars c
ON p.cars_id = c.id;


Полное внешнее соединение   (FULL JOIN)
не работает в MySQL
LEFT OUTER JOIN + RIGHT OUTER JOIN


Перекрёстное соединение  (CROSS JOIN)
SELECT people.name, cars.model FROM people 
CROSS JOIN cars;



http
hypertext transfer protocol
протокол передачи гипертекста

Структура http-протокола

1. Стартовая строка
	URL - путь к файлу
	method:
		GET    - получить данные
		POST   - создать данные
		PUT    - изменение данных
		DELETE - удаление данных 

Коды состояния
	1xx   Информационный код состояния

	2xx - Успешный код запроса
		200 - запрос передан успешно

	3xx - Переадресация
		301 - постоянное перенапревление
		302 - временное перенапревление
	
	4xx - Ошибки на стороне клиента
		400 - ошибка в запросе
		401 - неавторизован пользователь
		403 - недостаточно прав
		404 - неверный адрес, страница не существует
	
	5xx - Ошибки на стороне сервера
		500 - внутренняя ошибка сервера
		503 - сервер перегружен (Service Unavailable) 


2. Заголовки
	дополнительная информация по запросу

3. Тело
	например, отправленные данные формы



API
Application Programming interface
Программный интерфейс приложения


ДЗ (опционально, без дедлайнов):
Выполнить команды в Гугл-форме: https://forms.gle/AqbWJ6e2AFAaj6UL9
Таблица-тренажер для ДЗ: http://f934340c.beget.tech/film.html