
#Область СлужебныйПрограммныйИнтерфейс

// Фейковая ссылка.
// 
// Параметры:
//  ИмяТипа - Строка
// 
// Возвращаемое значение:
//  ЛюбаяСсылка
Функция ФейковаяСсылка(ИмяТипа) Экспорт
	
	Параметры = Новый Массив;
	Параметры.Добавить(Новый УникальныйИдентификатор());
	
	Возврат Новый (ИмяТипа, Параметры);
	
КонецФункции

// Сортированный массив.
// 
// Параметры:
//  Массив - Массив из Произвольный
// 
// Возвращаемое значение:
//  Массив из Произвольный
Функция СортированныйМассив(Массив) Экспорт
	
	Список = Новый СписокЗначений();
	Список.ЗагрузитьЗначения(Массив);
	Список.СортироватьПоЗначению();
	Возврат Список.ВыгрузитьЗначения();
	
КонецФункции

// Случайный ключ.
// 
// Параметры:
//  Префикс - Строка
// 
// Возвращаемое значение:
//  Строка
Функция СлучайныйКлюч(Префикс = "_") Экспорт
	
	Возврат Префикс + СтрЗаменить(Новый УникальныйИдентификатор(), "-", "_");
	
КонецФункции

// Случайное число.
// 
// Параметры:
//  Минимум - Число
//  Максимум - Число
//  ЗнаковПослеЗапятой - Число
// 
// Возвращаемое значение:
//  Число
Функция СлучайноеЧисло(Минимум, Максимум, ЗнаковПослеЗапятой = 0) Экспорт
	
	Возврат ЖЧТ_Движок.ЮТест().Данные().СлучайноеЧисло(
		Минимум, Максимум, ЗнаковПослеЗапятой);
	
КонецФункции

#КонецОбласти
