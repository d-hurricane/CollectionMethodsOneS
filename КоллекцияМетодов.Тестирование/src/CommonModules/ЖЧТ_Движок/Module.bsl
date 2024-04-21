
#Область ПрограммныйИнтерфейс

// ЮТТесты
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция ЮТТесты() Экспорт

	Возврат ОбщийМодуль("ЮТТесты");
	
КонецФункции

// ЮТТест
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция ЮТест() Экспорт
	
	Возврат ОбщийМодуль("ЮТест");
	  
КонецФункции

// ЮТТестовыеДанные
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция ЮТТестовыеДанные() Экспорт
	
	Возврат ОбщийМодуль("ЮТТестовыеДанные");
	  
КонецФункции

// ЮТОбщий
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция ЮТОбщий() Экспорт
	
	Возврат ОбщийМодуль("ЮТОбщий");
	  
КонецФункции

// ЮТПараметрыЗапуска
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция ЮТПараметрыЗапуска() Экспорт
	
	Возврат ОбщийМодуль("ЮТПараметрыЗапуска");
	  
КонецФункции

// ЮТЗапросы
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция ЮТЗапросы() Экспорт
	
	Возврат ОбщийМодуль("ЮТЗапросы");
		  
КонецФункции

// ЮТКоллекции
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция ЮТКоллекции() Экспорт
	
	Возврат ОбщийМодуль("ЮТКоллекции");
		  
КонецФункции

// Общий модуль.
// 
// Параметры:
//  Имя - Строка
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция ОбщийМодуль(Имя) Экспорт

	#Если Сервер Тогда
		УстановитьБезопасныйРежим(Истина);
	#КонецЕсли
	
	Попытка
		ПроверкаИмени = Новый Структура();
		ПроверкаИмени.Вставить(Имя);
	Исключение
		ВызватьИсключение "Передано некорректное имя общего модуля: " + Имя;
	КонецПопытки;

	Возврат Вычислить(Имя);
  
КонецФункции

#КонецОбласти
