/*实用小函数*/
保留小数：round(13.555,2)
截取字符串：substring('name',1,3)
模糊匹配：where role_level_name like "炼气%"
累计百分比：cume_dist() over(),percent_rank() over()
两列相除：concat(cast(round((role_fightnum*100/role_num),2) as varchar),'%')；round(cast(pay as double)/id,0) "人均充值"
输出序号：rank() over(),dense_rank() over(),row_number() over()
类型转换：cast(cast(3964885446092852 as decimal(20,0)) as varchar)
语法讲解：https://mp.weixin.qq.com/s/D8Rv-E_gSYFhnscVMK1WGg
分群筛选：where openid not in (select "#varchar_id" from cluster where cluster_name = '')

/*滚服账号识别*/
1、设置首次创角时间标签
2、添加虚拟属性
case when date_diff('second',ta_tag."tag_20211130_9","#event_time")=0 THEN '首角色' else '滚服角色' end

/*账号&设备留存标签设置*/
0、分析主体设置（账号&设备为主体）
1、用户标签设置（用户完成 首次 角色创建时间 openid_keep，账号openid为主体，创建历史版本）
2、虚拟属性设置（ta_tag."openid_keep" = "#event_time",布尔型）

/*性别sql标签*/ 分析主体选：role_id
select role_id,case when sex = '1' then '男' else '女' end as "性别"
from(select distinct role_id,sex from ta.v_event_49 where "$part_event" in ('role') and "$part_date">='2022-09-14')


/*文本格式转时间格式*/
国内时间：from_unixtime(cast("create_time" as double)/1000)
日本时间：date_add('hour', 1, from_unixtime(cast("create_time" as double)/1000))
美国时间：date_add('hour',-13,"#event_time"),date(date_add('hour',-13,from_unixtime(cast(create_time as bigint)/1000 ))) create_date,date(date_add('hour',-13,"#event_time")) as part_date
创角天数：date_diff('day',date(create_time),date("#event_time"))+1
开服天数：date_diff('day',date("server_time"),date("#event_time"))+1
时区偏移：IF("#event_time" is not null,8) or replace("time_zone",'UTC','')
日期偏移：date(date_add('hour',-13 ,"#event_time")) "$part_date"
创角时间：from_unixtime(cast(create_time as bigint) /1000)
时间转化：cast('2020-11-15 10:30:00.000' as timestamp)
         date('2022-8-15')
         date(last_date)!=date('2022-01-28')
         date_format("#event_time","%Y %M %d %H %m %s")


/*国家信息获取*/
港台：case when get_ip_location("ip")[2] = '中国' then get_ip_location("ip")[3] else get_ip_location("ip")[2] end
ip v4转v6：select get_ip_location(replace("ip",'::ffff:',''))[3] as "省份"

/*筛选掉内部用户*/
where "$part_event" in ('login')
and "#user_id" not in (select "#user_id" from user_result_cluster_32 where "cluster_name" = 'neibu')

/*判断首次退出时间*/
select e.row_num
from( select  row_number() over(partition by role_id order by time asc) as row_num ) as e
where e.row_num = 1

/*判断滚服*/
select server_id
,count(if(e.num>=2,sdk_uuid)) as "滚服充值设备数"
,sum(if(e.num)>=2,pay,null) as "滚服充值金额"
,sum(if(e.num)>=0,pay,null) as "总充值金额"
from
(select xx,row_number() over(partition by sdk_uuid order by create_time) as num) as e
group by server_id

/*汇总行写法*/
select coalesce(server_id,'汇总行') as "server_id",count(e.role_id) as "总人数"
from (select server_id,role_id,row_number() over(partition by role_id order by time) from xx) e
where e.num = 1
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
concat(cast(round((role_fightnum*100/role_num),2) as varchar),'%') as percent

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

/*对象组类型提取子属性*/
select *
from (
select "card_detail" ,
    json_extract_scalar(str_json, '$.card_id') as "card_id",
    json_extract_scalar(str_json, '$.card_star') as "card_star"
from (
select "card_detail",cast("card_detail" as array(json)) raw_data  --card_detail 对象组属性
from ta.v_event_23
where "$part_event" ='battle_start'
and ${PartDate:date1}
)
CROSS JOIN unnest(raw_data) AS t(str_json) ) t

/*列表转成对象组*/
创建虚拟属性：transform("war_team",x->cast(json_parse(x) as row("id" double,"name" varchar,"level" double,"star" double,"power" double)))
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

/*错位自连接*/
with a as(
select openid,role_id,block_id,time,row_number() over(partition by role_id order by time asc) as rownum
from ta.v_event_56
where "$part_event" = 'block_task' and ${PartDate:date})

select b.openid,b.role_id,b.block_id,b.time as time,a.time as time2
from
(select openid,role_id,block_id,time,row_number() over(partition by role_id order by time asc) as rownum
from ta.v_event_56
where "$part_event" = 'block_task' and ${PartDate:date} and role_id = '200300000000570')b
left join a on b.rownum = a.rownum-1 and b.role_id = a.role_id

/*链接维度表*/
select e.create_date,e."openid@ad_name",count(e.role_id) as "总人数"
from
(select b.*,a."openid@ad_name" from b join ta_dim.dim_47_0_56834 a on b.openid = a."openid@openid") e
where e.row_num = 1
group by e.create_date,e."openid@ad_name"
order by e.create_date,e."openid@ad_name" desc
