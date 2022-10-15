# Noveo_Hotel
Итоговое задание на написание сайта отеля на RoR

Данный проект представляет собой итог прохождения основной части стажировки в Noveo.
Согласно техническому заданию (ТЗ), на проект давалось две недели. Само ТЗ доступно в файле Rails_TZ.pdf в этом же репозитории. 

Приложение писалось с нуля, в связи с чем в нем есть плохой код, баги и неожиданные ошибки :)

### Выполнение требований к проекту по ТЗ
* Поддержка PostgreSQL 14
* Ruby 3.1.2, Rails 7.0.4
* Проект доступен на Heroku (до ноября 2022): https://rocky-shelf-75267.herokuapp.com
* Реализованы интерфейсы пользователя и администратора
* Наличествуют минимальные стили (рамочки для комнат, поля заполнения текста отзыва, таблицы администратора для отзывов, комнат, броней, а также кнопки)
* На странице администратора в бронях доступны ссылки для скачивания отчетов о подтвержденных бронях в формате CSV и XLSX
* На странице администратора в форме добавления новой комнаты возможна загрузка фотографий комнаты
* Добавлены тесты, покрытие ~79% (наличествуют для jobs, requests, routing)
* Также на главную страницу был добавлен API-сервис курса валют к рублю
* Код прогнан через rubocop

### Общие особенности проекта
* Согласно ТЗ, на странице пользователя, помимо ссылок на страницу отзывов и комнат, должна быть доступна ссылка на все брони. Я убрал эту ссылку ввиду ненужности: зачем пользователю видеть все брони? Логичнее было бы добавить брони конкретного пользователя, однако для этого требуется реализация авторизации.
* Аутентификация предоставляет доступ к интерфейсу администратора. К сожалению, на данный момент (13 октября 2022) этот механизм не доработан, так как авторизироваться и зарегистрироваться может каждый человек, а не только "администратор".
* ~~При переходе на страницу бронирования определенной комнаты не заполняется автоматически поле Room_id. Для удобства пользователя, хотелось бы автоматизировать этот процесс.~~
*Изменено от 14.10.2022*: Теперь поле Room_id заполняется автоматически. Для этого форма бронирования была перенесена в представление одной комнаты. Когда пользователь захочет открыть страницу одной комнаты, то помимо информации о комнате, он увидит форму бронирования. Это означает, что переход по ссылке /bookings/new не имеет смысла, но все еще возможен в рамках приложения (данный переход вызывает ошибку в представлении bookings).
* На странице /rooms отображаются все фотографии каждого номера, хотя согласно ТЗ следовало бы реализовать по одной фотографии каждого номера на странице номеров. Одна фотография каждого номера отображается на главной странице приложения.
* В ходе ручного тестирования было замечено, что удаление комнаты из интерфейса администратора приводит к ошибке БД, если на данную комнату существует бронь. Следует дорабоать проверку удалению комнаты на связность с бронью.

### Особенности проекта на Heroku
* Приложение выдает ошибку на Redis сервере при попытке добавить новую комнату через интерфес администратора. ***Однако*** новая добавленная комната, а также ее фотографии, отобразятся как на общем, так и на администраторском интерфейсе, если обновить страницу или "выйти и зайти" снова. То же касается редактирования.
* Картинки могут не прогружаться. Следует использовать облачное хранилище.
