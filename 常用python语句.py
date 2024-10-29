Python数据处理
辅助工具           用途
type(var)	        返回var对象数据类型
dir(var)             返回var对象可以使用的方法与属性
help(var)          返回var的说明文档
官方文档

增加时间数据
date = pd.Series(pd.date_range(start='1/1/2021',periods= 365,freq='D'))
data['time'] = date #并在原始数据中增加一列
data['year'] = data['time'].dt.year
data['month'] = data['time'].dt.month
data['time'] = data['time'].dt.strftime('%Y-%m-%d')

循环
DAU = [sum([DAU_day[i][k-1-i] for i in range(k)]) for k in range(1,length+1)]

累计值
data['累加ltv'] = data['ltv'].cumsum()

文字与数字拼接
for d in pay_ltv.keys():
      pd.DataFrame({'ltv'+str(d):pay_ltv[d][1]})
#拼接、循环、创建字典、转成数据框格式

列表中逐个增加元素
all_data = []
for obs in data:
      all_data.append(obs)

字典中逐个增加元素
records = {}
for item in obs:
    rec_key = item.keys()

record[rec_key] = value1


data = []
with open("input.txt", "r") as file:
    lines = file.readlines()
    for line in lines:
        data.append(line.strip())

data = open("D:\slave\slave.txt")
lines = data.readlines()
list1 = []
for i in lines:
    list1.append(i.strip())
