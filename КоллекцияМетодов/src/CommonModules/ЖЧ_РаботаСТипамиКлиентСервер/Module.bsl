// @strict-types

#Область ПрограммныйИнтерфейс

// Новый объект переданного типа.
// 
// Параметры:
//  Тип - Строка, Тип - Тип или имя типа
// 
// Возвращаемое значение:
//  Произвольный
Функция НовыйОбъект(Тип) Экспорт
	
	Типы = Неопределено;
	Если ТипЗнч(Тип) = Тип("Тип") Тогда
		Типы = Новый Массив; // Массив из Тип
		Типы.Добавить(Тип);
	Иначе
		Типы = Тип;
	КонецЕсли;
	
	ОписаниеТипа = Новый ОписаниеТипов(Типы);
	
	Возврат ОписаниеТипа.ПривестиЗначение();
	
КонецФункции

#КонецОбласти
