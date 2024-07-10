// @strict-types

#Область ПрограммныйИнтерфейс

#Если Клиент Тогда

// Если форма открыта в другом окне, то процедура отключает автоматическое сохранение настроек списка
// Например, когда форма открывается из навигационной панели другой формы
//
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма списка
//  ИмяСписка - Строка - Имя списка. По умолчанию "Список"
//
Процедура ОтключитьСохранениеНастроекСпискаПриОткрытииВОкне(Форма, ИмяСписка = "Список") Экспорт
	
	Если НЕ Форма.Окно = Неопределено Тогда
		ЭлементСписка = Форма[ИмяСписка]; // ДинамическийСписок
		ЭлементСписка.АвтоматическоеСохранениеПользовательскихНастроек = Ложь;
	КонецЕсли;
	
КонецПроцедуры
	
#КонецЕсли

#КонецОбласти
