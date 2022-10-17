/*首次退出在线时长*/
select e.create_date as"创角日期",count(e.role_id)AS "总人数",
count(case when this_time/60000 < 1 THEN 1 END) as "0~1min",
count(case when this_time/60000 >= 1 and this_time/60000<2 THEN 1 END) as "1~2min",
count(case when this_time/60000 >= 2 and this_time/60000<5 THEN 1 END) as "2~5min",
count(case when this_time/60000 >= 5 and this_time/60000<10 THEN 1 END) as "5~10min",
count(case when this_time/60000 >= 10 and this_time/60000<20 THEN 1 END) as "10~20min",
count(case when this_time/60000 >= 20 and this_time/60000<30 THEN 1 END) as "20~30min",
count(case when this_time/60000 >= 30 and this_time/60000<60 THEN 1 END) as "30~60min",
count(case when this_time/60000 >= 60 and this_time/60000<120 THEN 1 END) as "60~120min",
count(case when this_time/60000 >= 120  THEN role_id END) as "120+min"
from
(
select app_id,time,"$part_date" as date,server,role_id,role_level,this_time
,date(date_add('hour',-13,from_unixtime( cast(create_time as bigint)/1000 ))) create_date
,ROW_NUMBER() OVER (partition BY role_id ORDER BY time) as row_num
from ta.v_event_47
where "$part_event" in ('logout')
 and ${PartDate:date1}
) e
where e.row_num=1
group by  e.create_date
order by e.create_date desc

select e.create_date as"创角日期",count(e.role_id)AS "总人数",
concat(cast(round(count(case when this_time/60000<1 then role_id end)/cast(count(e.role_id) as double)*100,2) as varchar),'%') as "0~1min",
concat(cast(round(count(case when this_time/60000 >= 1 and this_time/60000<2 THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%') as "1~2min",
concat(cast(round(count(case when this_time/60000 >= 2 and this_time/60000<5 THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%') as "2~5min",
concat(cast(round(count(case when this_time/60000 >= 5 and this_time/60000<10 THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%') as "5~10min",
concat(cast(round(count(case when this_time/60000 >= 10 and this_time/60000<20 THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%') as "10~20min",
concat(cast(round(count(case when this_time/60000 >= 20 and this_time/60000<30 THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%') as "20~30min",
concat(cast(round(count(case when this_time/60000 >= 30 and this_time/60000<60 THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%') as "30~60min",
concat(cast(round(count(case when this_time/60000 >= 60 and this_time/60000<120 THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%') as "60~120min",
concat(cast(round(count(case when this_time/60000 >= 120  THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%')  as "120+min"
from
(
select app_id,time,"$part_date" as date,server,role_id,role_level,this_time
,date(date_add('hour',-13,from_unixtime( cast(create_time as bigint)/1000 ))) create_date
,ROW_NUMBER() OVER (partition BY role_id ORDER BY time) as row_num
from ta.v_event_47
where "$part_event" in ('logout')
 and ${PartDate:date1}

 ) e
where e.row_num=1
group by  e.create_date
order by e.create_date desc

/*首日在线时长*/
select date as "日期",count(e.role_id)AS "总人数",
count(case when this_time/60 < 1 THEN 1 END) as "0~1min",
count(case when this_time/60 >= 1 and this_time/60<5 THEN 1 END) as "1~4min",
count(case when this_time/60 >= 5 and this_time/60<10 THEN 1 END) as "5~10min",
count(case when this_time/60 >= 10 and this_time/60<20 THEN 1 END) as "10~20min",
count(case when this_time/60 >= 20 and this_time/60<30 THEN 1 END) as "20~30min",
count(case when this_time/60 >= 30 and this_time/60<60 THEN 1 END) as "30~60min",
count(case when this_time/60 >= 60 and this_time/60<120 THEN 1 END) as "60~120min",
count(case when this_time/60 >= 120 and this_time/60<180 THEN 1 END) as "120~180min",
count(case when this_time/60 >= 180 and this_time/60<300 THEN 1 END) as "180~300min",
count(case when this_time/60 >= 300 and this_time/60<600 THEN 1 END) as "300~600min",
count(case when this_time/60 >= 600 and this_time/60<600 THEN 1 END) as "600~900min",
count(case when this_time/60 >= 900  THEN role_id END) as "900+min"
from
(
select app_id,time,server,role_id
,date(date_add('hour',-13,"#event_time")) as date
,date(date_add('hour',-13,from_unixtime(cast(create_time as bigint)/1000 ))) create_date
,sum(this_time) as this_time
from ta.v_event_47
where "$part_event" in ('logout')
and ${PartDate:date1}
and date_diff('day',from_unixtime(cast(create_time as bigint)/1000), "#event_time")+1 = 1
group by "#event_time",time,server,area_id,app_id,server_id,role_id,create_time
 ) e
group by date
order by date desc

select e.create_date as"创角日期",e.part_date as "统计日期",e.add_day as "创角天数",count(e.role_id)AS "活跃人数",
count(case when this_time/60000 < 1 THEN 1 END) as "0~1min",
count(case when this_time/60000 >= 1 and this_time/60000<2 THEN 1 END) as "1~2min",
count(case when this_time/60000 >= 2 and this_time/60000<5 THEN 1 END) as "2~5min",
count(case when this_time/60000 >= 5 and this_time/60000<10 THEN 1 END) as "5~10min",
count(case when this_time/60000 >= 10 and this_time/60000<20 THEN 1 END) as "10~20min",
count(case when this_time/60000 >= 20 and this_time/60000<30 THEN 1 END) as "20~30min",
count(case when this_time/60000 >= 30 and this_time/60000<60 THEN 1 END) as "30~60min",
count(case when this_time/60000 >= 60 and this_time/60000<120 THEN 1 END) as "60~120min",
count(case when this_time/60000 >= 120  THEN role_id END) as "120+min",
ROW_NUMBER() OVER (partition BY e.create_date ORDER BY e.add_day) as "排序"

from
(
select app_id,"$part_date" as part_date,role_id,date(from_unixtime( cast(create_time as bigint)/1000 ,'Asia/Shanghai')) create_date,add_day,sum(this_time) this_time
from ta.v_event_25
where "$part_event" in ('logout')
 and ${PartDate:date1}
 and area_id = '701'
 group by app_id,"$part_date",role_id,create_time,add_day
) e
group by  e.create_date,e.add_day,e.part_date

替换成
(
select app_id,time,server,role_id,add_day
,date(date_add('hour',-13,"#event_time")) as part_date
,date(date_add('hour',-13,from_unixtime(cast(create_time as bigint)/1000 ))) create_date
,sum(this_time) as this_time
from ta.v_event_47
where "$part_event" in ('logout')
and ${PartDate:date1}
group by "#event_time",time,server,area_id,app_id,server_id,role_id,create_time,add_day
 ) e
