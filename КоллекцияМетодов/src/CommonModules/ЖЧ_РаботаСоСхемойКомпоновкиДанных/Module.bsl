// @strict-types

#Область ПрограммныйИнтерфейс

// Подставляет в последний пакет набора данных запроса конструкцию ВЫБРАТЬ ПЕРВЫЕ N
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
// 
// Параметры:
//  НаборДанных  - НаборДанныхЗапросСхемыКомпоновкиДанных - Набор данных СКД
//  КоличествоПолучаемыхЗаписей  - Число, Неопределено - Количество получаемых записей. 
//		Соответствует ключевому слову ПЕРВЫЕ языка запросов.
//		Если Неопределено, ограничение на количество выбираемых записей отсутствует.
//
// Пример:
//  КоличествоЗаписей = НастройкиКомпоновки.ПараметрыДанных.НайтиЗначениеПараметра("ВыбратьПервые").Значение;
//  УстановитьКоличествоПолучаемыхЗаписейНабораДанных(СхемаКомпоновкиДанных.НаборыДанных.Получить(0), КоличествоЗаписей);
//
Процедура УстановитьКоличествоПолучаемыхЗаписейНабораДанных(Знач НаборДанных, Знач КоличествоПолучаемыхЗаписей) Экспорт
	
	СхемаЗапроса = Новый СхемаЗапроса();
	СхемаЗапроса.РежимКомпоновкиДанных = Истина;
	СхемаЗапроса.УстановитьТекстЗапроса(НаборДанных.Запрос);
	ПоследнийПакет = СхемаЗапроса.ПакетЗапросов.Получить(СхемаЗапроса.ПакетЗапросов.Количество() - 1);
	ПоследнийПакет.Операторы.Получить(0).КоличествоПолучаемыхЗаписей = КоличествоПолучаемыхЗаписей;
	
	НаборДанных.Запрос = СхемаЗапроса.ПолучитьТекстЗапроса();
		
КонецПроцедуры

// Создает новый компоновщик настроек на основе СКД и настроек
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
// 
// Параметры:
//  СхемаКомпоновкиДанных - СхемаКомпоновкиДанных
//  Настройки - Неопределено, НастройкиКомпоновкиДанных - Загружаемые настройки
// 
// Возвращаемое значение:
//  КомпоновщикНастроекКомпоновкиДанных
//  
// Пример:
// 	КомпоновщикНастроек = НовыйКомпоновщикНастроек(СхемаКомпоновкиДанных);
//  
Функция НовыйКомпоновщикНастроек(Знач СхемаКомпоновкиДанных, Знач Настройки = Неопределено) Экспорт
	
	КомпоновщикНастроек	= Новый КомпоновщикНастроекКомпоновкиДанных;
	КомпоновщикНастроек.Инициализировать(Новый ИсточникДоступныхНастроекКомпоновкиДанных(СхемаКомпоновкиДанных));
	КомпоновщикНастроек.ЗагрузитьНастройки(?(Настройки = Неопределено, СхемаКомпоновкиДанных.НастройкиПоУмолчанию, Настройки));
	
	Возврат КомпоновщикНастроек;
	
КонецФункции

// Возвращает поле компоновки данных на основе строки или пользовательского поля.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  Поле - Строка, ПользовательскоеПолеВыборКомпоновкиДанных, ПользовательскоеПолеВыражениеКомпоновкиДанных, ПолеКомпоновкиДанных - Источник поля
// 
// Возвращаемое значение:
//  ПолеКомпоновкиДанных
//  
// Пример:
// 	Поле = ПолеКомпоновкиДанных("Ссылка.Код");
// 	Поле = ПолеКомпоновкиДанных(ПолеКомпоновкиИлиСтрока);
// 	Поле = ПолеКомпоновкиДанных(ПользовательскоеПоле);
//  
Функция ПолеКомпоновкиДанных(Знач Поле) Экспорт
	
	Если ТипЗнч(Поле) = Тип("ПолеКомпоновкиДанных") Тогда
		Возврат Поле;
	КонецЕсли;
	
	ПутьКДанным = "";
	Если ТипЗнч(Поле) = Тип("Строка") Тогда
		ПутьКДанным = Поле;
	ИначеЕсли ТипЗнч(Поле) = Тип("ПользовательскоеПолеВыборКомпоновкиДанных")
		ИЛИ ТипЗнч(Поле) = Тип("ПользовательскоеПолеВыражениеКомпоновкиДанных") Тогда
		ПутьКДанным = Поле.ПутьКДанным;
	КонецЕсли;
	
	Возврат Новый ПолеКомпоновкиДанных(ПутьКДанным);
	
КонецФункции

// Возвращает новый объект СКД с заполненными служебными свойствами
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Возвращаемое значение:
//  СхемаКомпоновкиДанных
//
// Пример:
//  СКД = НовыйСКД();
//
Функция НовыйСКД() Экспорт
	
	СхемаКомпоновкиДанных = Новый СхемаКомпоновкиДанных;
	
	Источник = СхемаКомпоновкиДанных.ИсточникиДанных.Добавить();
    Источник.Имя = "ЛокальнаяБаза";
    Источник.СтрокаСоединения = "";
    Источник.ТипИсточникаДанных = "Local";
	
	Возврат СхемаКомпоновкиДанных;
		
КонецФункции

// Добавляет новый набор данных объект в СКД и возврашает его
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  СКД - СхемаКомпоновкиДанных
//  Имя - Строка
//  ИмяОбъекта - Строка
// 
// Возвращаемое значение:
//  НаборДанныхОбъектСхемыКомпоновкиДанных
//
// Пример:
// 	НаборОбъект = ДобавитьНаборДанныхОбъект(СхемаКомпоновкиДанных, "МойНабор");
//
Функция ДобавитьНаборДанныхОбъект(Знач СКД, Знач Имя, Знач ИмяОбъекта = "") Экспорт
	
	НаборДанных	= СКД.НаборыДанных.Добавить(Тип("НаборДанныхОбъектСхемыКомпоновкиДанных"));
	НаборДанных.Имя = Имя;
	НаборДанных.ИмяОбъекта = ?(ИмяОбъекта = "", Имя, ИмяОбъекта);
	НаборДанных.ИсточникДанных = СКД.ИсточникиДанных.Получить(0).Имя;
	
	Возврат НаборДанных;
		
КонецФункции

// Добавляет новый набор данных запрос в СКД и возврашает его
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  СКД - СхемаКомпоновкиДанных
//  Имя - Строка
//  Запрос - Строка
// 
// Возвращаемое значение:
//  НаборДанныхЗапросСхемыКомпоновкиДанных
//  
// Пример:
// 	НаборЗапрос = ДобавитьНаборДанныхЗапрос(СхемаКомпоновкиДанных, "МойНабор");
//
Функция ДобавитьНаборДанныхЗапрос(Знач СКД, Знач Имя, Знач Запрос) Экспорт
	
	НаборДанных	= СКД.НаборыДанных.Добавить(Тип("НаборДанныхЗапросСхемыКомпоновкиДанных"));
	НаборДанных.Имя = Имя;
	НаборДанных.Запрос = Запрос;
	
	НаборДанных.ИсточникДанных = СКД.ИсточникиДанных.Получить(0).Имя;
	НаборДанных.АвтоЗаполнениеДоступныхПолей = Истина;
	
	Возврат НаборДанных;
		
КонецФункции

// Добавляет новое поле в набор данных СКД и возврашает его
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  НаборДанных - НаборДанныхОбъектСхемыКомпоновкиДанных
//  Поле - Строка
//  Заголовок - Строка
//  ПутьКДанным - Строка
//  ТипЗначения - Строка, ОписаниеТипов - Тип значения
// 
// Возвращаемое значение:
//  ПолеНабораДанныхСхемыКомпоновкиДанных 
//  
// Пример:
//  ПолеНабора = ДобавитьПолеНабораДанных(МойНаборДанных, "Колво", "Количество", "Количество", "Число");
//
Функция ДобавитьПолеНабораДанных(Знач НаборДанных, Знач Поле, 
	Знач Заголовок = "", Знач ПутьКДанным = "", Знач ТипЗначения = Неопределено) Экспорт
	
	НовоеПоле = НаборДанных.Поля.Добавить(Тип("ПолеНабораДанныхСхемыКомпоновкиДанных"));
	НовоеПоле.Поле = Поле;
	НовоеПоле.ПутьКДанным = ?(ПутьКДанным = "", Поле, ПутьКДанным);
	НовоеПоле.Заголовок = Заголовок;
	
	Если ТипЗнч(ТипЗначения) = Тип("Строка") Тогда
		ТипЗначения = Новый ОписаниеТипов(ТипЗначения); // @skip-check statement-type-change - Бред ЕДТ
	Иначе
		ТипЗначения = ТипЗначения;
	КонецЕсли;
	
	НовоеПоле.ТипЗначения = ТипЗначения;
	
	Возврат НовоеПоле;
		
КонецФункции

// Ищет набор данных по имени (можно рекурсивно).
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  КоллекцияНаборов - СхемаКомпоновкиДанных
//  				 - НаборыДанныхСхемыКомпоновкиДанных
//  				 - НаборДанныхОбъединениеСхемыКомпоновкиДанных
//  ИмяНабораДанных - Строка
//  ВключаяПодчиненные - Булево
// 
// Возвращаемое значение:
//  - НаборДанныхЗапросСхемыКомпоновкиДанных
//  - НаборДанныхОбъединениеСхемыКомпоновкиДанных 
//  - НаборДанныхОбъектСхемыКомпоновкиДанных
//  
// Пример:
//  НаборДанных = НайтиНаборДанных(СКД, "МойНабор");
// 
Функция НайтиНаборДанных(Знач КоллекцияНаборов, Знач ИмяНабораДанных, Знач ВключаяПодчиненные = Истина) Экспорт
	
	ПеребираемаяКоллекцияНаборов = Неопределено;
	Если ТипЗнч(КоллекцияНаборов) = Тип("СхемаКомпоновкиДанных") Тогда
		ПеребираемаяКоллекцияНаборов = КоллекцияНаборов.НаборыДанных;
	ИначеЕсли ТипЗнч(КоллекцияНаборов) = Тип("НаборыДанныхСхемыКомпоновкиДанных") Тогда
		ПеребираемаяКоллекцияНаборов = КоллекцияНаборов;
	ИначеЕсли ТипЗнч(КоллекцияНаборов) = Тип("НаборДанныхОбъединениеСхемыКомпоновкиДанных") Тогда
		ПеребираемаяКоллекцияНаборов = КоллекцияНаборов.Элементы;
	Иначе
		Возврат Неопределено;
	КонецЕсли;
	
	НайденныйНаборДанных = Неопределено;
	
	Для Каждого НаборДанных Из ПеребираемаяКоллекцияНаборов Цикл
		
		Если НаборДанных.Имя = ИмяНабораДанных Тогда
			НайденныйНаборДанных = НаборДанных;
		ИначеЕсли ВключаяПодчиненные Тогда
			НайденныйНаборДанных = НайтиНаборДанных(НаборДанных, ИмяНабораДанных, ВключаяПодчиненные);
		КонецЕсли;
		
		Если НЕ НайденныйНаборДанных = Неопределено Тогда
			Прервать;
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат НайденныйНаборДанных;
	
КонецФункции

// Возвращает структуру с параметрами настроек компоновки данных (с учетом флага использования)
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
// 
// Параметры:
//  СхемаКомпоновкиДанных - СхемаКомпоновкиДанных
//  НастройкиКомпоновки - НастройкиКомпоновкиДанных
// 
// Возвращаемое значение:
//  Структура
//  
// Пример:
// 	Структура = ПараметрыДанныхСтруктурой(СхемаКомпоновкиДанных, НастройкиКомпоновки);
// 	//Структура содержит все "включенные" и обязательные парамметры
//  
Функция ПараметрыДанныхСтруктурой(Знач СхемаКомпоновкиДанных, Знач НастройкиКомпоновки) Экспорт
	
	Результат = Новый Структура;
	
	Для Каждого ПараметрСхемы Из СхемаКомпоновкиДанных.Параметры Цикл
		
		ИмяПараметра = ПараметрСхемы.Имя;
		
		ПараметрНастроек = НастройкиКомпоновки.ПараметрыДанных.НайтиЗначениеПараметра(
			Новый ПараметрКомпоновкиДанных(ИмяПараметра));
			
		Если ПараметрНастроек = Неопределено ИЛИ НЕ ПараметрНастроек.Использование Тогда
			Если ПараметрСхемы.Использование = ИспользованиеПараметраКомпоновкиДанных.Всегда Тогда
				ЗначениеПараметра = ПараметрСхемы.Значение;
			Иначе
				Продолжить;
			КонецЕсли;
		Иначе
			ЗначениеПараметра = ПараметрНастроек.Значение;
		КонецЕсли;
		
		Результат.Вставить(ИмяПараметра, ЗначениеПараметра);
		
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

// Рекурсивно удаляет недоступные элементы из коллекции отборов
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//
// Написан для статьи Как ограничить поля отбора в динамическом списке и ничего не сломать: 
// https://infostart.ru/public/1226445/?ref=1159
//
// Параметры:
//  Коллекция  - КоллекцияЭлементовПользовательскихНастроекКомпоновкиДанных, КоллекцияЭлементовОтбораКомпоновкиДанных - Коллекция элементов отбора.
//  ДоступныеПоляОтбора  - Неопределено, ДоступныеПоляКомпоновкиДанных - Список доступных полей отбора. При первоначальном вызове не передаётся.
//
// Пример:
//	Список.УстановитьОграниченияИспользованияВОтборе(ЗапрещенныеВОтбореПоля);
//	УдалитьНедоступныеОтборы(Список.КомпоновщикНастроек.ПользовательскиеНастройки.Элементы);
//    
Процедура УдалитьНедоступныеОтборы(Знач Коллекция, Знач ДоступныеПоляОтбора = Неопределено) Экспорт
	
	УдаляемыеЭлементы = Новый Массив; // Массив из ЭлементОтбораКомпоновкиДанных
	
	Для Каждого ТекущиеДанные Из Коллекция Цикл
		
		Если ТипЗнч(ТекущиеДанные) = Тип("ОтборКомпоновкиДанных") Тогда
			
			УдалитьНедоступныеОтборы(ТекущиеДанные.Элементы, ТекущиеДанные.ДоступныеПоляОтбора);
			
		ИначеЕсли ТипЗнч(ТекущиеДанные) = Тип("ГруппаЭлементовОтбораКомпоновкиДанных") Тогда
			
			УдалитьНедоступныеОтборы(ТекущиеДанные.Элементы, ДоступныеПоляОтбора);
			                 
		ИначеЕсли ТипЗнч(ТекущиеДанные) = Тип("ЭлементОтбораКомпоновкиДанных") Тогда
			
			Если НЕ ТекущиеДанные.Использование Тогда
				Продолжить;
			КонецЕсли;
			
			Для Каждого ИмяСвойства Из СтрРазделить("ЛевоеЗначение,ПравоеЗначение",",") Цикл
				
				ТекущееПоле = ТекущиеДанные[ИмяСвойства]; // ПолеКомпоновкиДанных
				Если ТипЗнч(ТекущееПоле) = Тип("ПолеКомпоновкиДанных") 
					И ДоступныеПоляОтбора.НайтиПоле(ТекущееПоле) = Неопределено Тогда
					
					УдаляемыеЭлементы.Добавить(ТекущиеДанные);
					Прервать;
					
				КонецЕсли;
				
			КонецЦикла;
			
		КонецЕсли;
		
	КонецЦикла;
	
	Для Каждого УдаляемыйЭлемент Из УдаляемыеЭлементы Цикл
		Коллекция.Удалить(УдаляемыйЭлемент);
	КонецЦикла;
	
КонецПроцедуры

// Выводит в коллекцию выбранных полей СКД все доступные поля.
// Метод иерархический, для вызова достаточно передать коллекцию выбранных полей, которые нужно заполнить.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//
// Параметры:
//
//  ВыбранныеПоляКомпоновки  - ВыбранныеПоляКомпоновкиДанных, КоллекцияВыбранныхПолейКомпоновкиДанных  - 
//						Выбранные поля компоновки, которые необходимо заполнить
//
//  КоллекцияДоступныхПолей  - Неопределено, ДоступныеПоляКомпоновкиДанных - 
//						Параметр для иерархических вызовов процедуры из себя самой же. 
//						При использовании передавать не нужно.
//
// Пример:
//  ВывестиВсеДоступныеПоляВыбора(Настройки.Выбор); //Выводит все доступные поля
//
Процедура ВывестиВсеДоступныеПоляВыбора(Знач ВыбранныеПоляКомпоновки, Знач КоллекцияДоступныхПолей = Неопределено) Экспорт
	
	Если КоллекцияДоступныхПолей = Неопределено Тогда
		КоллекцияДоступныхПолей = ВыбранныеПоляКомпоновки.ДоступныеПоляВыбора;
	КонецЕсли;
	
	Если ТипЗнч(ВыбранныеПоляКомпоновки) = Тип("ВыбранныеПоляКомпоновкиДанных") Тогда
		КоллекцияВыбранныхПолей = ВыбранныеПоляКомпоновки.Элементы;
	Иначе
		КоллекцияВыбранныхПолей = ВыбранныеПоляКомпоновки;
	КонецЕсли;
	
	ТекущийРодитель = Новый Структура("Родитель", Неопределено);
	ЗаполнитьЗначенияСвойств(ТекущийРодитель, КоллекцияДоступныхПолей);
	ТекущийРодитель = ТекущийРодитель.Родитель;
	
	Для Каждого ДоступноеПолеВыбора Из КоллекцияДоступныхПолей.Элементы Цикл
		
		Если ДоступноеПолеВыбора.Папка Тогда
			ВыбранноеПоле = КоллекцияВыбранныхПолей.Добавить(Тип("ГруппаВыбранныхПолейКомпоновкиДанных"));
			ВывестиВсеДоступныеПоляВыбора(ВыбранноеПоле.Элементы, ДоступноеПолеВыбора);
		Иначе
			ВыбранноеПоле = КоллекцияВыбранныхПолей.Добавить(Тип("ВыбранноеПолеКомпоновкиДанных"));
		КонецЕсли;
		
		ЗаполнитьЗначенияСвойств(ВыбранноеПоле, ДоступноеПолеВыбора, "Поле,Заголовок");
		
	КонецЦикла;
	
КонецПроцедуры

// Возвращает таблицу значений с колонками набора данных СКД
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
// 
// Параметры:
//  НаборДанных - НаборДанныхОбъектСхемыКомпоновкиДанных
// 
// Возвращаемое значение:
//  ТаблицаЗначений
//  
// Пример:
// 	Таблица = ТаблицаИзНабораДанных(СКД.НаборыДанных.Получить(0));
// 	//Таблица содержит пустую ТЗ со всеми колонками для набора. 
// 	//Теперь её можно заполнять данными и далее "скармливать" при формировании СКД
//  
Функция ТаблицаИзНабораДанных(Знач НаборДанных) Экспорт
	
	Результат = Новый ТаблицаЗначений();
	
	Для Каждого Поле Из НаборДанных.Поля Цикл
		Результат.Колонки.Добавить(Поле.Поле, Поле.ТипЗначения, Поле.Заголовок);
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти
