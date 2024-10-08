
#Область СлужебныйПрограммныйИнтерфейс

// Регистрация тестов
Процедура ИсполняемыеСценарии() Экспорт

	Перем ЮТТесты;
	ЮТТесты = ЖЧТ_Движок.ЮТТесты();
	
	ЮТТесты
		.ДобавитьТестовыйНабор("УстановитьСвойствоОбъекта")
			.ДобавитьТест("Тест_УстановитьСвойствоОбъекта_ПростоеСвойство")
			.ДобавитьТест("Тест_УстановитьСвойствоОбъекта_ВложенноеСвойство")
			.ДобавитьТест("Тест_УстановитьСвойствоОбъекта_НесуществующееСвойство")
		.ДобавитьТестовыйНабор("ЕстьСвойствоОбъекта")
			.ДобавитьТест("Тест_ЕстьСвойствоОбъекта_ПростоеСвойство")
			.ДобавитьТест("Тест_ЕстьСвойствоОбъекта_ВложенноеСвойство")
			.ДобавитьТест("Тест_ЕстьСвойствоОбъекта_НесуществующееСвойство")
		.ДобавитьТестовыйНабор("ЕстьNull")
			.ДобавитьТест("Тест_ЕстьNull")
				.СПараметрами(Null, 1, 1)
				.СПараметрами("бусь", 1, "бусь")
				.СПараметрами(Null, Null, Null)
	;

КонецПроцедуры

#Область Тесты

#Область УстановитьСвойствоОбъекта

Процедура Тест_УстановитьСвойствоОбъекта_ПростоеСвойство() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();
	Модуль = ТестируемыйМодуль();
	
	Свойство = "Свойство";
	Объект = Новый Структура(Свойство);
	Значение = Новый УникальныйИдентификатор();
	
	Модуль.УстановитьСвойствоОбъекта(Объект, Свойство, Значение);
	
	ЮТест.ОжидаетЧто(Объект)
		.Свойство(Свойство).Равно(Значение);
		
КонецПроцедуры

Процедура Тест_УстановитьСвойствоОбъекта_ВложенноеСвойство() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();
	Модуль = ТестируемыйМодуль();
	
	Объект = Новый Структура("Свойство1", Новый Структура("Свойство2", Новый Структура("Свойство3")));
	Значение = Новый УникальныйИдентификатор();
	Свойство = "Свойство1.Свойство2.Свойство3";
	
	Модуль.УстановитьСвойствоОбъекта(Объект, Свойство, Значение);
	
	ЮТест.ОжидаетЧто(Объект)
		.Свойство(Свойство).Равно(Значение);
		
КонецПроцедуры

Процедура Тест_УстановитьСвойствоОбъекта_НесуществующееСвойство() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();
	Модуль = ТестируемыйМодуль();
	
	Объект = Новый Структура;
	Свойство = "Свойство";
	Значение = Новый УникальныйИдентификатор();
	ТекстИсключения = СтрШаблон("Поле объекта не обнаружено (%1)", Свойство);
	
	ЮТест.ОжидаетЧто(Модуль)
		.Метод("УстановитьСвойствоОбъекта")
			.Параметр(Объект)
			.Параметр(Свойство)
			.Параметр(Значение)
		.ВыбрасываетИсключение(ТекстИсключения);
		
КонецПроцедуры

#КонецОбласти

#Область ЕстьСвойствоОбъекта

Процедура Тест_ЕстьСвойствоОбъекта_ПростоеСвойство() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();
	Модуль = ТестируемыйМодуль();
	
	Свойство = "Свойство";
	Объект = Новый Структура(Свойство, Новый УникальныйИдентификатор());
	Значение = Неопределено;
	
	Результат = Модуль.ЕстьСвойствоОбъекта(Объект, Свойство, Значение);
	
	ЮТест.ОжидаетЧто(Результат).ЭтоИстина();
	ЮТест.ОжидаетЧто(Значение).Равно(Объект[Свойство]);
		
КонецПроцедуры

Процедура Тест_ЕстьСвойствоОбъекта_ВложенноеСвойство() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();
	Модуль = ТестируемыйМодуль();
	
	Объект = Новый Структура("Свойство1", 
		Новый Структура("Свойство2", 
			Новый Структура("Свойство3", Новый УникальныйИдентификатор())));
	Значение = Неопределено;
	Свойство = "Свойство1.Свойство2.Свойство3";
	
	Результат = Модуль.ЕстьСвойствоОбъекта(Объект, Свойство, Значение);
	
	ЮТест.ОжидаетЧто(Результат).ЭтоИстина();
	ЮТест.ОжидаетЧто(Значение).Равно(Объект.Свойство1.Свойство2.Свойство3);
		
КонецПроцедуры

Процедура Тест_ЕстьСвойствоОбъекта_НесуществующееСвойство() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();
	Модуль = ТестируемыйМодуль();
	
	Объект = Новый Структура;
	Свойство = "Свойство";
	Значение = Новый УникальныйИдентификатор();
	ЗначениеДо = Значение;
	
	Результат = Модуль.ЕстьСвойствоОбъекта(Объект, "Свойство", Значение);
	
	ЮТест.ОжидаетЧто(Результат).ЭтоЛожь();
	ЮТест.ОжидаетЧто(Значение).Равно(ЗначениеДо);
		
КонецПроцедуры

#КонецОбласти

#Область ЕстьNull

Процедура Тест_ЕстьNull(ПроверяемоеЗначение, АльтернативноеЗначение, ОжидаемыйРезультат) Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();
	Модуль = ТестируемыйМодуль();
	
	Результат = Модуль.ЕстьNull(ПроверяемоеЗначение, АльтернативноеЗначение);
	
	ЮТест.ОжидаетЧто(Результат).Равно(ОжидаемыйРезультат);
		
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Тестируемый модуль.
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция ТестируемыйМодуль() Экспорт

	Возврат ЖЧТ_Модули.ОбщегоНазначения();
	
КонецФункции

#КонецОбласти
