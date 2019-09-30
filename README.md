# salesforce.vrp_consulting.task6
final task of the free vrp cource https://training-vrpconsulting.cs20.force.com/s/login/

Task 6. Контрольное задание
Для выполнения задания необходимо создать новый Dev Org и настроить на нем Login IP Ranges. Для этого необходимо перейти в Setup > Profiles > System Administrator > Login IP Ranges > New > 0.0.0.0 – 255.255.255.255.

Основное задание
Создать объект, представляющий информацию о продукте.
Label = Product Table
Object Name = ProductTable
Создать поля для объекта Product Table.
Поле для хранения цены
Type = Currency
Label = Price
Field Name = Price
Поле для хранения количества товаров
Type = Number
Label = Amount
Field Name = Amount
Поле для хранения типа товара
Type = Picklist
Label = ProductType
Field Name = ProductType
Поле для хранения даты выпуска товара
Type = Date
Label = ReleaseDate
Field Name = ReleaseDate
Поле для хранения даты добавления товара
Type = DateTime
Label = AddedDate
Field Name = AddedDate
Поле определяющее доступен ли товар
Type = Checkbox
Label = Available
Field Name = Available
Создать триггер для нашего объекта и хелпер класс для триггера. Вся логика обработки должна быть написана в хелпере.
Trigger Name = ProductTableTrigger
Helper Class Name = ProductTableTriggerHelper
Events = before insert/update
Поле Available должно автоматически заполняться при создании или обновлении товара.
Если поле Amount > 0, выставляем в true
Если поле Amount <= 0, выставляем в false
Поле AddedDate должно автоматически заполняться временем создания, при создании продукта
Используйте класс Datetime, что бы заполнять это поле
Создать 3 Validation Rule, которые будут контролировать правильность заполнения полей Amount, Price и Release Date
1-й Validation Rule, Name = ValidateAmount
Если поле Amount < 0, нужно показать сообщение об ошибке
2-й Validation Rule, Name = ValidatePrice
Если поле Price < 0, нужно показать сообщение об ошибке
3-й Validation Rule, Name = ValidateReleaseDate
Если поле Release Date позднее сегодняшней даты, нужно показать сообщение об ошибке
Создать Aura Application – ProductTableApp.
Создать Aura Component – ProductTableCmp. Компонента должна отображать список товаров в виде таблицы.
Компонент должен использоваться в ProductTableApp
В таблице обязательно должны быть колонки, расположенные в следующем порядке (имена колонок должны совпадать с теми, что указаны ниже):
Name
Amount
Price
Product Type
Release Date
Available
Данные в таблице должны быть отсортированы по полю AddedDate так, что-бы недавно добавленные продукты были вверху списка.
Создать Apex Class – ProductTableCmpController. Класс будет использоваться в качестве контроллера для нашего Aura Component.
Класс должен обязательно содержать метод – getProducts. Метод будет возвращать список продуктов с нужными для отображения полями
Расширить функционал компоненты так, чтобы были следующие возможности:
Создавать товар
Для этого обязательно надо добавить в контроллер метод insertNewProductTable
Удалять товар из списка
Для этого обязательно надо добавить в контроллер метод deleteProductTable
Редактировать товар из списка
Для этого обязательно надо добавить в контроллер метод updateNewProductTable
Искать товар по части имени
Расширить метод getProducts так, чтобы он возвращал либо все продукты, либо те, которые подходят по имени
Создать Apex Tests для тестирования написанного кода. Общее покрытие должно быть не менее 75%.
Name = TestProductTableApplication
Класс должен покрывать тестами следующие классы:
ProductTableTrigger
ProductTableCmpController

Задания для дополнительных балловДобавить к компоненте возможность сортировки списка товаров по полям:
Name
Added Date
Release Date
Price
Расширить возможности поиска
Поиск должен осуществляться по дате добавления
Для поиска по обоим полям должен использоваться одно и то же поле ввода
Добавить пагинацию, для навигации по списку товаров
