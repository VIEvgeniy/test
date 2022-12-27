-- 1 количество исполнителей в каждом жанре;
select g.name, count(*)  from singer s, genre g, genre_of_singer gos where s.id = gos.singer_id and g.id = gos.genre_id
group by g.name order by g.name;

-- 2 количество треков, вошедших в альбомы 2019-2020 годов;
select count(*) as "Треков в альбомах 2019-2020 годов" from track t, album a where t.album_id = a.id and a.release_yeare  between 2019 and 2020;

-- 3 средняя продолжительность треков по каждому альбому;
select a.name as "Альбом", avg(t.length) "Средняя продолжительность трека" from track t, album a where t.album_id = a.id group by a.name;

-- 4 все исполнители, которые не выпустили альбомы в 2020 году;
select s2.pseudonym from singer s2  where s2.id not in (
-- испонители выпустившие альбомы в 2020
select s.id from singer s, album a, albums_of_singer aos 
where aos.singer_id = s.id and aos.album_id = a.id and a.release_yeare = 2020
);

-- 5 названия сборников, в которых присутствует конкретный исполнитель Мумий Тролль
select c.name as "Сборники с Мумий Троллем" from collection c, track t, collection_of_track cot2 , album a, albums_of_singer aos, singer s
where cot2.collection_id = c.id and cot2.track_id = t.id  
and t.album_id = a.id and a.id = aos.album_id and s.id = aos.singer_id
and s.pseudonym = 'Мумий Тролль' group by c.name

-- 6 название альбомов, в которых присутствуют исполнители более 1 жанра;
select name as "Сборники с более чем одним жанром" from (
select c."name", count(distinct g)  from collection c, collection_of_track cot2, track t, album a, albums_of_singer aos, singer s, genre_of_singer gos, genre g 
where cot2.collection_id = c.id and cot2.track_id = t.id and t.album_id = a.id and aos.album_id = a.id and aos.singer_id = s.id and s.id = gos.singer_id and gos.genre_id = g.id
group by c."name" 
) as cog where count > 1

-- 7 наименование треков, которые не входят в сборники;
--select name from
--(select t.name, count(cot2)  from track t left join collection_of_track cot2 on cot2.track_id = t.id group by t.name) as tr
--where tr.count = 0

select name as "Треки не входящие в сботники" from
(select t.name, cot2.track_id  from track t left join collection_of_track cot2 on cot2.track_id = t.id) as tnc
where track_id is null

-- 8 исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
select s.pseudonym, t.length from singer s, album a, albums_of_singer aos, track t 
where aos.singer_id = s.id and aos.album_id = a.id and a.id = t.album_id and t.length = (select min(t2.length) from track t2);

-- 9 название альбомов, содержащих наименьшее количество треков.

