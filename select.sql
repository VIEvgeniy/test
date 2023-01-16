-- 1 количество исполнителей в каждом жанре;
select g.name, count(*)  from singer s, genre g, genre_of_singer gos where s.id = gos.singer_id and g.id = gos.genre_id
group by g.name order by g.name;

-- 2 количество треков, вошедших в альбомы 2019-2020 годов;
select count(*) as "Треков в альбомах 2019-2020 годов" from track t, album a where t.album_id = a.id and a.release_yeare  between 2019 and 2020;

-- 3 средняя продолжительность треков по каждому альбому;
select a.name as "Альбом", avg(t.length) "Средняя продолжительность трека" from track t, album a where t.album_id = a.id group by a.name;

-- 4  все исполнители, которые не выпустили альбомы в 2020 году;
/*
select s2.pseudonym from singer s2  where s2.id not in (
-- испонители выпустившие альбомы в 2020
select s.id from singer s, album a, albums_of_singer aos 
where aos.singer_id = s.id and aos.album_id = a.id and a.release_yeare = 2020 
);
*/

select s.pseudonym from singer s, ( 
select s.id from singer s 
left join albums_of_singer aos on s.id = aos.singer_id
left join album a on aos.album_id = a.id
where a.release_yeare = 2020
) as rel2020
where s.id != rel2020.id

-- 5 названия сборников, в которых присутствует конкретный исполнитель Мумий Тролль
select distinct c.name as "Сборники с Мумий Троллем" from collection c, track t, collection_of_track cot2 , album a, albums_of_singer aos, singer s
where cot2.collection_id = c.id and cot2.track_id = t.id  
and t.album_id = a.id and a.id = aos.album_id and s.id = aos.singer_id
and s.pseudonym = 'Мумий Тролль' ;


-- 6 название сборников, в которых присутствуют исполнители более 1 жанра;
select c."name" from collection c 
left join collection_of_track cot2 on cot2.collection_id = c.id 
left join track t on t.id = cot2.track_id 
left join album a on a.id = t.album_id 
left join albums_of_singer aos on aos.album_id = a.id 
left join genre_of_singer gos on gos.singer_id = aos.singer_id 
group by c."name"
having count(distinct gos.genre_id) > 1;

-- 7 наименование треков, которые не входят в сборники;
/*select name as "Треки не входящие в сботники" from
(select t.name, count(cot2)  from track t left join collection_of_track cot2 on cot2.track_id = t.id group by t.name) as tr
where tr.count = 0*/

select name as "Треки не входящие в сботники" from
(select t.name, cot2.track_id  from track t left join collection_of_track cot2 on cot2.track_id = t.id) as tnc
where track_id is null

-- 8 исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
select s.pseudonym, t.length from singer s, album a, albums_of_singer aos, track t 
where aos.singer_id = s.id and aos.album_id = a.id and a.id = t.album_id and t.length = (select min(t2.length) from track t2);

-- 9 название альбомов, содержащих наименьшее количество треков.
/*select a.name, count(t) from album a, track t where t.album_id = a.id 
group by a.name order by count(t) limit 9*/

select a.name from album a, track t where t.album_id = a.id 
group by a.name
having count(t) = (select count(t) from album a, track t where t.album_id = a.id 
group by a.name limit 1);

