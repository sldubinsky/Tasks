# encoding: utf-8
# language: ru

Функционал: Учет времени по задачам

Как Пользователь
Я хочу включать и использовать механиз учета времени по задачам
Чтобы фиксировать часы: план, факт, к оплате и описание выполненых работ по задаче

Контекст:
	Допустим я подготавливаю константу с наименованием "узИспользоватьУчетВремени"
	И    Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Включение механизма "Учет времени по задачам"
	Когда В панели разделов я выбираю "Управление задачами"
	И     Я нажимаю кнопку командного интерфейса "Использовать учет времени"
	И     В открытой форме я устанавливаю флаг "Использовать учет времени"
	И     я нажимаю на кнопку "Записать и закрыть"

Сценарий: Добавление выполненой работы по задаче
	Когда Я нажимаю кнопку командного интерфейса "Задачи"
	Тогда открылось окно "Задачи"
	И     я нажимаю на кнопку "Создать"
	И     в поле "Наименование" я ввожу текст "ЭтоТестоваяЗадача"
	И     я перехожу к закладке "Учет времени"
	И     я перехожу к закладке "Группа страницы"
	И     в поле "План" я ввожу текст "10,00"
	И     в поле "К оплате" я ввожу текст "10,00"
	И     в ТЧ "ФактическиеЧасы" я нажимаю на кнопку "Добавить"
	И     в ТЧ "ФактическиеЧасы" в поле "Дата начала" я ввожу текст "01.12.2016  0:00:00"
	И     я перехожу к следующему реквизиту
	И     в ТЧ "ФактическиеЧасы" я активизирую поле "Дата окончания"
	И     в ТЧ "ФактическиеЧасы" в поле "Дата окончания" я ввожу текст "01.12.2016  9:30:00"
	И     в ТЧ "ФактическиеЧасы" я активизирую поле "Комментарий"
	И     в ТЧ "ФактическиеЧасы" в поле "Комментарий" я ввожу текст "Я выполнил тестовое задание"
	И     В форме "ЭтоТестоваяЗадача *" в ТЧ "ФактическиеЧасы" я завершаю редактирование строки
	И     в ТЧ "ФактическиеЧасы" я нажимаю на кнопку "Добавить"
	И     в ТЧ "ФактическиеЧасы" в поле "Дата начала" я ввожу текст "02.12.2016  0:00:00"
	И     я перехожу к следующему реквизиту
	И     в ТЧ "ФактическиеЧасы" я активизирую поле "Дата окончания"
	И     в ТЧ "ФактическиеЧасы" в поле "Дата окончания" я ввожу текст "02.12.2016  5:30:00"
	И     в ТЧ "ФактическиеЧасы" я активизирую поле "Комментарий"
	И     в ТЧ "ФактическиеЧасы" в поле "Комментарий" я ввожу текст "Я выполнил тестовое задание еще раз"
	И     В форме "ЭтоТестоваяЗадача *" в ТЧ "ФактическиеЧасы" я завершаю редактирование строки
	Тогда таблица формы с именем "ФактическиеЧасы" стала равной:
	| 'Дата начала'        | 'Дата окончания'     | 'Часы факт' |'Комментарий'                 		   |
	| '01.12.2016 0:00:00' | '01.12.2016 9:30:00' | '9,50'      | 'Я выполнил тестовое задание'		   |
	| '02.12.2016 0:00:00' | '02.12.2016 5:30:00' | '5,50'      | 'Я выполнил тестовое задание еще раз'|
	
	И     я нажимаю на кнопку "Записать"
	Тогда поле формы с именем "ЧасыФакт" стало равным '15'
	И     я нажимаю на кнопку "Записать и закрыть"
	И     Пауза 2

Сценарий: Проверка вывода "ЧасыПлан", "ЧасыФакт", "ЧасыКОплате" в отчете "узОтчетПоЗадачам"
	Когда Я нажимаю кнопку командного интерфейса "Отчет по задачам"
	Тогда открылось окно "Основной"
	И     я открываю выпадающий список "Основная задача"
	И     я выбираю значение реквизита "Основная задача" из формы списка
	Тогда открылось окно "Задачи"
	И     В форме "Задачи" в таблице "Список" я перехожу к строке:
	| 'Наименование'             |
	| 'ЭтоОсновнаяТестоваяЗадача'|
	И     В форме "Задачи" в ТЧ "Список" я выбираю текущую строку
	И     я нажимаю на кнопку "Сформировать"
	И     Пауза 5
	Тогда табличный документ формы с именем "ОтчетТабличныйДокумент" стал равен:
		| 'Отбор:'                   | 'Основная задача Равно "ЭтоОсновнаяТестоваяЗадача"' | ''            | ''             | ''         | ''                    | ''                          | ''                | ''          | ''          | ''              | ''                 |
		| ''                         | ''                                                  | ''            | ''             | ''         | ''                    | ''                          | ''                | ''          | ''          | ''              | ''                 |
		| 'Основная задача'          | ''                                                  | ''            | ''             | ''         | ''                    | ''                          | ''                | 'Часы план' | 'Часы факт' | 'Часы к оплате' | 'Количество задач' |
		| 'Статус'                   | ''                                                  | ''            | ''             | ''         | ''                    | ''                          | ''                | ''          | ''          | ''              | ''                 |
		| 'Номер задачи'             | 'Задача'                                            | 'Исполнитель' | 'Конфигурация' | 'Важность' | 'Дата создания'       | 'Дата передачи исполнителю' | 'Срок исполнения' | ''          | ''          | ''              | ''                 |
		| 'ЭтоОсновнаяТестоваяЗадача'| ''                                                  | ''            | ''             | ''         | ''                    | ''                          | ''                | '10,00'     | '15,00'     | '10,00'         | '1'                |
		| 'Зарегистрирована'         | ''                                                  | ''            | ''             | ''         | ''                    | ''                          | ''                | '10,00'     | '15,00'     | '10,00'         | '1'                |
		| '*'                        | 'ЭтоТестоваяЗадача'                                 | ''            | ''             | ''         | '19.12.2016 23:17:58' | ''                          | ''                | '10,00'     | '15,00'     | '10,00'         | '1'                |
		| 'Итого'                    | ''                                                  | ''            | ''             | ''         | ''                    | ''                          | ''                | '10,00'     | '15,00'     | '10,00'         | '1'                |
