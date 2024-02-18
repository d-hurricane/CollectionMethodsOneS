// @strict-types

#Область ПрограммныйИнтерфейс

// Подставляет в последний пакет набора данных запроса конструкцию ВЫБРАТЬ ПЕРВЫЕ N
//
// Параметры:
//  НаборДанных  - НаборДанныхЗапросСхемыКомпоновкиДанных - Набор данных СКД
//  КоличествоПолучаемыхЗаписей  - Число, Неопределено - Количество получаемых записей. 
//		Соответствует ключевому слову ПЕРВЫЕ языка запросов.
//		Если Неопределено, ограничение на количество выбираемых записей отсутствует.
//
Процедура УстановитьКоличествоПолучаемыхЗаписейНабораДанных(НаборДанных, КоличествоПолучаемыхЗаписей) Экспорт
	
	СхемаЗапроса = Новый СхемаЗапроса();
	СхемаЗапроса.РежимКомпоновкиДанных = Истина;
	СхемаЗапроса.УстановитьТекстЗапроса(НаборДанных.Запрос);
	ПоследнийПакет = СхемаЗапроса.ПакетЗапросов.Получить(СхемаЗапроса.ПакетЗапросов.Количество() - 1);
	ПоследнийПакет.Операторы.Получить(0).КоличествоПолучаемыхЗаписей = КоличествоПолучаемыхЗаписей;
	
	НаборДанных.Запрос = СхемаЗапроса.ПолучитьТекстЗапроса();
		
КонецПроцедуры

// Создает новый компоновщик настроек на основе СКД и настроек
//
// Параметры:
//  СхемаКомпоновкиДанных - СхемаКомпоновкиДанных
//  Настройки - Неопределено, НастройкиКомпоновкиДанных - Загружаемые настройки
// 
// Возвращаемое значение:
//  КомпоновщикНастроекКомпоновкиДанных
Функция НовыйКомпоновщикНастроек(СхемаКомпоновкиДанных, Настройки = Неопределено) Экспорт
	
	КомпоновщикНастроек	= Новый КомпоновщикНастроекКомпоновкиДанных;
	КомпоновщикНастроек.Инициализировать(Новый ИсточникДоступныхНастроекКомпоновкиДанных(СхемаКомпоновкиДанных));
	КомпоновщикНастроек.ЗагрузитьНастройки(?(Настройки = Неопределено, СхемаКомпоновкиДанных.НастройкиПоУмолчанию, Настройки));
	
	Возврат КомпоновщикНастроек;
	
КонецФункции

// Поле компоновки данных.
// 
// Параметры:
//  Поле - Строка, ПользовательскоеПолеВыборКомпоновкиДанных, ПользовательскоеПолеВыражениеКомпоновкиДанных, ПолеКомпоновкиДанных - Источник поля
// 
// Возвращаемое значение:
//  ПолеКомпоновкиДанных
Функция ПолеКомпоновкиДанных(Поле) Экспорт
	
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

// Новый объект СКД
// 
// Возвращаемое значение:
//  СхемаКомпоновкиДанных
Функция НовыйСКД() Экспорт
	
	СхемаКомпоновкиДанных = Новый СхемаКомпоновкиДанных;
	
	Источник = СхемаКомпоновкиДанных.ИсточникиДанных.Добавить();
    Источник.Имя = "ЛокальнаяБаза";
    Источник.СтрокаСоединения = "";
    Источник.ТипИсточникаДанных = "Local";
	
	Возврат СхемаКомпоновкиДанных;
		
КонецФункции

#КонецОбласти
