/*性别sql标签*/
select role_id,case when sex = '1' then '男' else '女' end as "性别"
from(select distinct role_id,sex from ta.v_event_49 where "$part_event" in ('create_role') and "$part_date">='2022-09-14')

now we have:
date sample
role_id   sex
10100001  0
10100002  1

what we want:
table sample
role_id   性别
10100001  male
10100002  female

/*文本格式转时间格式*/
国内时间：FROM_UNIXTIME(cast("create_time" as double)/1000)
日本时间：date_add('hour', 1, FROM_UNIXTIME(cast("create_time" as double)/1000))
美国时间：date_add('hour',-12,"#event_time")
动态参数：date_add('hour',${Variable},"#event_time")
创角天数：date_diff('day',date(create_time),date("#event_time"))
时区偏移：IF("#event_time" is not null,-4) or replace("time_zone",'UTC','')
"time" = date('2022-8-15')


/*筛选掉内部用户*/
"#user_id" not in (SELECT "#user_id" FROM user_result_cluster_52 WHERE "cluster_name"='inuser')

/*判断首次退出时间*/
row_number() over (partition BY role_id ORDER BY time asc) as row_num
where e.row_num = 1

/*汇总行写法*/
select coalesce(server_id,'汇总行') as "server_id"
group by grouping sets(server_id,())
order by case when server_id='汇总行' then '0' else server_id end

/*百分比写法*/
concat(cast(round(count(case when this_time/60<1 then role_id end)/cast(count(e.role_id) as double)*100,2) as varchar),'%') as "0~1min",
concat(cast(round(count(case when this_time/60 >= 1 and this_time/60<4 THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%') as "1~4min",
concat(cast(round(count(case when this_time/60 >= 5 and this_time/60<10 THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%') as "5~10min",
concat(cast(round(count(case when this_time/60 >= 10 and this_time/60<20 THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%') as "10~20min",
concat(cast(round(count(case when this_time/60 >= 20 and this_time/60<30 THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%') as "20~30min",
concat(cast(round(count(case when this_time/60 >= 30 and this_time/60<60 THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%') as "30~60min",
concat(cast(round(count(case when this_time/60 >= 60 and this_time/60<120 THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%') as "60~120min",
concat(cast(round(count(case when this_time/60 >= 120  THEN role_id end)/cast(count(e.role_id)as double)*100,2) as varchar),'%')  as "120+min"

concat(cast(cast(cast(count(distinct role_id) as double)/${Variable}*100 as decimal(20,2)) as varchar),'%')

/*分层留存*/
with x as (SELECT a.*,b."tag_value" FROM
    (SELECT distinct "$part_date","#user_id","#account_id","server_id"
    from ta.v_event_31
    where "$part_event"='createrole' and date("$part_date") between date('2021-09-01') and current_date) a
    LEFT JOIN (SELE0CT "#user_id","tag_value"  FROM user_result_cluster_31 WHERE "cluster_name"='pay_level')b
    on a."#user_id" = b."#user_id"
    ),
     y as (SELECT "$part_date","#user_id","#account_id","server_id",count(1) from ta.v_event_31 where "$part_event"='login' and date("$part_date") between date('2020-09-01') and current_date group by "$part_date","#user_id","#account_id","server_id")

SELECT "注册日期","tag_value" ,count(distinct "#account_id") as "注册角色数",
                  count(CASE when "间隔天数"=1 then "#account_id"end)/(count(distinct "#account_id")*1.000) as "次留",
                  count(CASE when "间隔天数"=2 then "#account_id"end)/(count(distinct "#account_id")*1.000) as "3留",
                  count(CASE when "间隔天数"=6 then "#account_id"end)/(count(distinct "#account_id")*1.000) as "7留",
                  count(CASE when "间隔天数"=14 then "#account_id"end)/(count(distinct "#account_id")*1.000) as "15留",
                  count(CASE when "间隔天数"=29 then "#account_id"end)/(count(distinct "#account_id")*1.000) as "30留",
                  count(CASE when "间隔天数"=59 then "#account_id"end)/(count(distinct "#account_id")*1.000) as "60留",
                  count(CASE when "间隔天数"=89 then "#account_id"end)/(count(distinct "#account_id")*1.000) as "90留"
FROM
  (
 SELECT "tag_value"  ,x."$part_date" as "注册日期",x."#account_id",x."server_id",y."$part_date","day"(date(y."$part_date")-date(x."$part_date")) as "间隔天数" from x left join y on x."#account_id"=y."#account_id"
 )
   group by "注册日期","tag_value"

    case when round(add_time/60) <= 5 then '5分钟以内'
         when round(add_time/60)>5 and round(add_time/60)<= 10 then '5-10分钟'
         when round(add_time/60)>10 and round(add_time/60)<= 20 then '11-20分钟'
         when round(add_time/60)>20 and round(add_time/60)<= 30 then '21-30分钟'
         else '30分钟以上' end as "在线时长分布"

/*列表转成对象组*/
transfrom("latest_line_up",x->cast(json_parse(x) as row(ranger_id double,ranger_lv double)))
虚拟属性编辑：依次选择 属性类型【对象组】、关联事件【自动识别】、属性赋值【无值】

示例
territory_list
[{"build_cid":0,"lv":0,"build_name":"","y":654,"x":830,"type":"空地"},
 {"build_cid":0,"lv":9,"build_name":"","y":385,"x":1245,"type":"伐採場Lv.9"}]

 ranger_lv,ranger_id

 /*数数SQL基础语句*/
SELECT "#user_id"
FROM v_event_49
WHERE "$part_event"='logout' AND "$part_date"='2022-08-11'

SELECT "#user_id","local_time","local_time_zone","time","time_zone"
FROM v_event_49 WHERE "$part_event"='logout' AND "$part_date"<='2022-08-14'

SELECT "#user_id","local_time","local_time_zone","time","time_zone"
FROM v_event_49 WHERE "$part_event"='logout' AND "time"<=date('2022-08-14')

 /*数数两表链接*/
 SELECT a."role_id",b."role_id",b."block_id" FROM
 (SELECT role_id FROM ta.v_event_56 WHERE "$part_event" = 'logout' and ${PartDate:date1}) a
 right join
 (SELECT role_id,block_id FROM ta.v_event_56 WHERE "$part_event" = 'block_task' and ${PartDate:date1}) b
 ON a."role_id" = b."role_id"
