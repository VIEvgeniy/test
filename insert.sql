-- Добавление исполнителей
insert into singer(pseudonym) values('МакSим');
insert into singer(pseudonym) values('DJ SMASH');
insert into singer(pseudonym) values('Кукрыниксы');
insert into singer(pseudonym) values('Мумий Тролль');
insert into singer(pseudonym) values('Баста');
insert into singer(pseudonym) values('Макс Корж');
insert into singer(pseudonym) values('Ella Fitzgerald');
insert into singer(pseudonym) values('Вика Цыганова');
-- Добавление жанров
insert into genre(name) values('Поп');
insert into genre(name) values('Рок');
insert into genre(name) values('Рэп');
insert into genre(name) values('Джаз');
insert into genre(name) values('Шансон');
-- Связи жанров и исполнителей
insert into genre_of_singer(genre_id, singer_id) 
select g.id, s.id from genre g, singer s where s.pseudonym = 'МакSим' and g.name = 'Поп';
insert into genre_of_singer(genre_id, singer_id) 
select g.id, s.id from genre g, singer s where s.pseudonym = 'DJ SMASH' and g.name = 'Поп';
insert into genre_of_singer(genre_id, singer_id) 
select g.id, s.id from genre g, singer s where s.pseudonym = 'Кукрыниксы' and g.name = 'Рок';
insert into genre_of_singer(genre_id, singer_id) 
select g.id, s.id from genre g, singer s where s.pseudonym = 'Мумий Тролль' and g.name = 'Рок';
insert into genre_of_singer(genre_id, singer_id) 
select g.id, s.id from genre g, singer s where s.pseudonym = 'Баста' and g.name = 'Рэп';
insert into genre_of_singer(genre_id, singer_id) 
select g.id, s.id from genre g, singer s where s.pseudonym = 'Макс Корж' and g.name = 'Рэп';
insert into genre_of_singer(genre_id, singer_id) 
select g.id, s.id from genre g, singer s where s.pseudonym = 'Ella Fitzgerald' and g.name = 'Джаз';
insert into genre_of_singer(genre_id, singer_id) 
select g.id, s.id from genre g, singer s where s.pseudonym = 'Вика Цыганова' and g.name = 'Шансон';
-- Добавление альбомов
insert into album(name, release_yeare) values('Другая реальность', 2013);
insert into album(name, release_yeare) values('IDDQD', 2008);
insert into album(name, release_yeare) values('Всадники Света', 2010);
insert into album(name, release_yeare) values('Икра', 1997);
insert into album(name, release_yeare) values('После зла', 2020);
insert into album(name, release_yeare) values('Баста+', 2022);
insert into album(name, release_yeare) values('Жить в кайф', 2018);
insert into album(name, release_yeare) values('Ella Fitzgerald', 1999);
insert into album(name, release_yeare) values('Вагнер', 2022);
--Добавление связей исполнителей и альбомов
insert into albums_of_singer(singer_id, album_id) 
select s.id, a.id from singer s, album a where s.pseudonym = 'МакSим' and a.name = 'Другая реальность';
insert into albums_of_singer(singer_id, album_id) 
select s.id, a.id from singer s, album a where s.pseudonym = 'DJ SMASH' and a.name = 'IDDQD';
insert into albums_of_singer(singer_id, album_id) 
select s.id, a.id from singer s, album a where s.pseudonym = 'Кукрыниксы' and a.name = 'Всадники Света';
insert into albums_of_singer(singer_id, album_id) 
select s.id, a.id from singer s, album a where s.pseudonym = 'Мумий Тролль' and a.name = 'Икра';
insert into albums_of_singer(singer_id, album_id) 
select s.id, a.id from singer s, album a where s.pseudonym = 'Мумий Тролль' and a.name = 'После зла';
insert into albums_of_singer(singer_id, album_id) 
select s.id, a.id from singer s, album a where s.pseudonym = 'Баста' and a.name = 'Баста+';
insert into albums_of_singer(singer_id, album_id) 
select s.id, a.id from singer s, album a where s.pseudonym = 'Макс Корж' and a.name = 'Жить в кайф';
insert into albums_of_singer(singer_id, album_id) 
select s.id, a.id from singer s, album a where s.pseudonym = 'Ella Fitzgerald' and a.name = 'Ella Fitzgerald';
insert into albums_of_singer(singer_id, album_id) 
select s.id, a.id from singer s, album a where s.pseudonym = 'Вика Цыганова' and a.name = 'Вагнер';
--добавление трэков
insert into track(name, length, album_id)
select 'Мой мир', 3.54, a.id from album a where a.name = 'Другая реальность';
insert into track(name, length, album_id)
select 'Как летать', 3.13, a.id from album a where a.name = 'Другая реальность';
insert into track(name, length, album_id)
select 'Moscow Never Sleeps', 3.18, a.id from album a where a.name = 'IDDQD';
insert into track(name, length, album_id)
select 'Лучшие Песни', 3.18, a.id from album a where a.name = 'IDDQD';
insert into track(name, length, album_id)
select 'Самолёт', 3.18, a.id from album a where a.name = 'IDDQD';
insert into track(name, length, album_id)
select 'Всадники Света', 3.08, a.id from album a where a.name = 'Всадники Света';
insert into track(name, length, album_id)
select 'Мой Бог', 3.55, a.id from album a where a.name = 'Всадники Света';
insert into track(name, length, album_id)
select 'Клетка', 3.15, a.id from album a where a.name = 'Всадники Света';
insert into track(name, length, album_id)
select 'Дельфины', 4.38, a.id from album a where a.name = 'Икра';
insert into track(name, length, album_id)
select 'На яды', 3.10, a.id from album a where a.name = 'Икра';
insert into track(name, length, album_id)
select 'Далеко', 3.10, a.id from album a where a.name = 'Икра';
insert into track(name, length, album_id)
select 'Лето без Интернета', 3.10, a.id from album a where a.name = 'После зла';
insert into track(name, length, album_id)
select 'Ангел', 3.18, a.id from album a where a.name = 'Баста+';
insert into track(name, length, album_id)
select 'Здоровый сон', 5.05, a.id from album a where a.name = 'Жить в кайф';
insert into track(name, length, album_id)
select 'Flying Home', 2.29, a.id from album a where a.name = 'Ella Fitzgerald';
insert into track(name, length, album_id)
select 'Вагнер', 2.47, a.id from album a where a.name = 'Вагнер';
-- сборники придумал сам
insert into collection(name, release_yeare) values('Поп на двоих', 2014);
insert into collection(name, release_yeare) values('(Не) Лучший РЕП', 2022);
insert into collection(name, release_yeare) values('Рок не Ролл', 2013);
insert into collection(name, release_yeare) values('join the jazz with DJ SMASH', 2013);
insert into collection(name, release_yeare) values('МОЙ', 2022);
insert into collection(name, release_yeare) values('Мой ми троль', 2012);
insert into collection(name, release_yeare) values('Капуста не квашенная', 2018);
insert into collection(name, release_yeare) values('Шансов есть', 2022);

--добавление трэков в сборники
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Поп на двоих'  and t.name = 'Мой мир';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Поп на двоих'  and t.name = 'Как летать';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Поп на двоих'  and t.name = 'Moscow Never Sleeps';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Поп на двоих'  and t.name = 'Самолёт';

insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = '(Не) Лучший РЕП'  and t.name = 'Ангел';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = '(Не) Лучший РЕП'  and t.name = 'Здоровый сон';

insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Рок не Ролл'  and t.name = 'Всадники Света';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Рок не Ролл'  and t.name = 'Мой Бог';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Рок не Ролл'  and t.name = 'Клетка';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Рок не Ролл'  and t.name = 'Дельфины';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Рок не Ролл'  and t.name = 'Далеко';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Рок не Ролл'  and t.name = 'Лето без Интернета';

insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'join the jazz with DJ SMASH'  and t.name = 'Flying Home';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'join the jazz with DJ SMASH'  and t.name = 'Moscow Never Sleeps';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'join the jazz with DJ SMASH'  and t.name = 'Самолёт';

insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'МОЙ'  and t.name = 'Moscow Never Sleeps';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'МОЙ'  and t.name = 'Всадники Света';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'МОЙ'  and t.name = 'Дельфины';

insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Мой ми троль'  and t.name = 'Дельфины';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Мой ми троль'  and t.name = 'Лето без Интернета';

insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Капуста не квашенная'  and t.name = 'Flying Home';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Капуста не квашенная'  and t.name = 'Здоровый сон';
insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Капуста не квашенная'  and t.name = 'Вагнер';

insert into collection_of_track(collection_id, track_id) 
select c.id, t.id from collection c, track t where c.name = 'Шансов есть'  and t.name = 'Вагнер';

