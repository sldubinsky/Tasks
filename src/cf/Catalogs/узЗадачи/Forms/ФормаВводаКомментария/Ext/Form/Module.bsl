﻿
&НаКлиенте
Процедура КомандаОК(Команда)
	ПараметрыЗакрытия = Новый Структура();
	ПараметрыЗакрытия.Вставить("КлючСтроки",КлючСтроки);
	ПараметрыЗакрытия.Вставить("Комментарий",Комментарий);
	ПараметрыЗакрытия.Вставить("Автор",Автор);
	ПараметрыЗакрытия.Вставить("ДатаКомментария",ДатаКомментария);
	ПараметрыЗакрытия.Вставить("Выполнено",Выполнено);
	ПараметрыЗакрытия.Вставить("ЭтоДобавлениеКомментария",ЭтоДобавлениеКомментария);
	Закрыть(ПараметрыЗакрытия);
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если Параметры.Свойство("ЭтоДобавлениеКомментария") Тогда
		ДатаКомментария = ТекущаяДата();
		Автор = Пользователи.ТекущийПользователь();
		ЭтоДобавлениеКомментария = Истина;
	Иначе
		КлючСтроки = Параметры.КлючСтроки;
		Комментарий = Параметры.Комментарий;
		Автор = Параметры.Автор;
		ДатаКомментария = Параметры.ДатаКомментария;
		Выполнено = Параметры.Выполнено;
	Конецесли;
	УстановитьВидимостьДоступность();
КонецПроцедуры

&НаСервере
Процедура УстановитьВидимостьДоступность()
	Элементы.Комментарий.ТолькоПросмотр = Истина;
	Если Автор = Пользователи.ТекущийПользователь() Тогда
		Элементы.Комментарий.ТолькоПросмотр = Ложь;
	Конецесли;
КонецПроцедуры 
