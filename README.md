Форк проекта stapio с учётом специфики ОАО ДРСК:

####```Stapio - time aggregate POI in OSM```

##Установка
  1. переименовать/скопировать ```stapio_config-distr.py``` в ```stapio_config.py``` и изменить параметры переменных под себя


##Описание api поиска
  https://github.com/ErshKUS/OpenStreetMap.ru/blob/master/api/search 
  дата актуализации 31.05.2013

###Возвращаемые данные:
  1. userPos - результаты обратного геокодирования (если были latlon при запросе). Массив, каждый элемент - уровень геокодирования, список состоит из:
      - name - имя собственное объекта
      - addr_type - тип объекта (country/region/district/city/village)
      - full_name - полное имя, включая все уровни выше, например для г.Калининграда "Российская Федерация, Калининградская область, город Калининград"
      - id - соответствует столбцу id в адресной таблице
  2. matches - результаты поиска. Массив, отсортирован по релеватности по убыванию, каждый элемент список состоит из:
      - lat - координаты объекта, в epsg:4326
      - lon - координаты объекта, в epsg:4326
      - id - соответствует столбцу id в адресной таблице
      - addr_type - тип объекта, см. "типы объектов адресной таблицы"
      - addr_type_id - тип объекта в числовом формате, см. "типы объектов адресной таблицы"
      - display_name - полное имя, включая все уровни выше, например для г.Калининграда "Российская Федерация, Калининградская область, город Калининград"
      - name - имя собственное объекта


###Типы объектов адресной таблицы
(addr_type_id - addr_type - описание):
  - 5  - country - страна
  - 10 - region - область/край/...
  - 15 - district - район/городской округ/...
  - 20 - city - город
  - 25 - village - деревня/село/поселок/...
  - 30 - street - улица/переулок/проезд/...
  - 35 - house - номер дома, если отсутствует уточнение (строение, корпус, литер)
  - 40 - houseadd - номер дома, если есть уточнение (строение, корпус, литер)
  - 70 - poi - объект пои, если используются дополнительно поиск по POI
