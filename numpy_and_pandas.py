for i,ele in enumerate(number):
    print i,ele

for (i=0;i<;i++):
    c[i] = a[i]*b[i]

import numpy as np
output: [a0b0,a1b1,a2b2...]
c = []
for i in range(len(a)):
    c.append(a[i]*b[i])

1-D sequence 2-D array narray
2-D array narray

ls = []
var =
for i in var:
    m = var[4]
    ls.append(m)

# array creation
create an array from list tuple

# array indexing
arr = np.array([[-1,2,0,4],
                [4,-0.5,6,0],
                [2.6,0,7,8],
                [3,-7,4,2.0]])
temp =  arr[:2,::2]
print("Array with first 2 rows and alternate"
                "columns(0 and 2)\n",temp)

temp = arr[[0,1,2,3],[]]
temp = arr[arr>0]

# basic operation
+= -= *=

# convert list to pandas.Series,pandas.DataFrame
import pandas as pd
l_1d = [0,1,2]
s = pd.Series(l_1d,index=['row1','row2','row3'])
print(s)
print(df)
# row1    0
# row2    1
# row3    2
# dtype: int64

l_2d = [[0,1,2],[3,4,5]]
df = pd.DataFrame(l_2d,
                        index = ["row1","row2"],
                        columns = ["col1","col2","col3"])
print(df)
print(df)
#       col1  col2  col3
# row1     0     1     2
# row2     3     4     5

# For list containing data and labels
l_1d_index = [['Alice', 0], ['Bob', 1], ['Charlie', 2]]
index,values = zip(*l_1d_index)
s_index = pd.Series(values,index = index)

# Alice      0
# Bob        1
# Charlie    2
# dtype: int64

# Assign existing column to DataFrame index with set_index()
l_2d_index = [['Alice', 0, 0.0], ['Bob', 1, 0.1], ['Charlie', 2, 0.2]]
df_index = pd.DataFrame(l_2d_index, columns=['name', 'val1', 'val2'])

print(df_index)
#       name  val1  val2
# 0    Alice     0   0.0
# 1      Bob     1   0.1
# 2  Charlie     2   0.2

df_index_set = df_index.set_index('name')

print(df_index_set)
#          val1  val2
# name
# Alice       0   0.0
# Bob         1   0.1
# Charlie     2   0.2

# Convert pandas.DataFrame, pandas.Series to list
s = pd.Series([0,1,2])
l_1d = s.values.tolist()

df = pd.DataFrame([0,1,2],[3,4,5])
print(df)
#    0  1  2
# 0  0  1  2
# 1  3  4  5

l_2d = df.values.tolist()

# Convert data and label (row/column name) to list
l_1d = [0,1,2]
s = pd.Series(l_1d,index=['row1','row2','row3'])

## keep the label as list datas
s.reset_index().values.tolist()

# Rename column/index name
rename() {original name:new name}
df_new = df.rename(columns={"A":"Col_1"},index={"ONE":"Row_1"})
df.rename(columns = {"A":"Col_1","C":"Col_3"})
df.dtypes ## dtype: object
type(df) ## <class 'pandas.core.frame.DataFrame'>

s = pd.Series([0, 1, 2], dtype=np.float64)
s.dtype ## dtype('float64')
type(s) ## <class 'pandas.core.series.Series'>

# Convert ndarray to DataFrame, Series
import numpy as np
a = np.arange(4)
s = pd.Series(a)

a = np.arange(12).reshape((4,3))
df = pd.DataFrame(a)

df_f = pd.DataFrame([[0.1, 0.2, 0.3], [0.4, 0.5, 0.6]])
a_df_f = df_f.values
type(a_df_f) # <class 'numpy.ndarray'>
a_df_f.dtype # float64

## pandas 0.24.0 or later
to_numpy()
df = pd.DataFrame(data=[[1, 2, 3], [4, 5, 6]], columns=['a', 'b', 'c'])
df.to_numpy() # equal to df.values,official recommends using to_numpy() method

#List type method sort() sorts the original list
org_list = [3,1,4,5,2]
org_list.sort()
print(org_list)
# [1,2,3,4,5]

org_list.sort(reverse = True)
print(org_list)
# [5,4,3,2,1]

# Built-in function sorted() returns a sorted list
new_list = sorted(org_list)
print(org_list)
print(new_list)
# [3, 1, 4, 5, 2]
# [1, 2, 3, 4, 5]

# Concatenate multiple strings: +, += operator
s = "aaa"+"bbb"+"ccc"
i = 100
f = 0.25
print(s)
# aaabbbccc

s = 'aaa'\
    'bbb'\
    'ccc'
print(s)
# aaabbbccc

# Concatenate strings and numbers: format(), f-string
s = f'{s}_{i:'05'}_{s2}_{f:.5f}'
print(s)
# aaa_00100_bbb_0.25000

# Concatenate a list of strings into one string: join()
'String to insert'.join([List of strings])
l = ['aaa','bbb','ccc']
s = ''.join(l)
# aaabbbccc

s = ','.join(l)
print(s)
# aaa,bbb,ccc

# Separate a string by a specific delimiter and get it as a list: split()
s_blank = 'one two     three\nfour\tfive'
print(s_blank)
# one two     three
# four  five

print(s_blank.split())
# ['one', 'two', 'three', 'four', 'five']

print(type(s_blank.split()))
# <class 'list'>

import re
re.split()
s_marks = 'one-two+three#four'
print(re.split('[-+#]', s_marks))
# ['one', 'two', 'three', 'four']

s_strs = 'oneXXXtwoYYYthreeZZZfour'
print(re.split('XXX|YYY|ZZZ', s_strs))
# ['one', 'two', 'three', 'four']

# List comprehensions
[expression for variable_name in iterable]
[expression for variable_name in iterable if condition]
X if condition else Y X is value or expression for True, and Y is value or expression for False
odds = [i for i in range(10) if i%2 == 1]

# Dictionary comprehensions
l = ['Alice', 'Bob', 'Charlie']
d = {s:len(s) for s in l}
d = {s:m for s,m in enumerate(l)}

keys = ['k1','k2','k3']
values = [1,2,3]
d = {k:v for k,v in zip(keys,values)}

# Set comprehensions
s = {i**2 for i in range(5)}
print(s)
#{0,1,4,9,16}

# Generator expression
g = (i**2 for i in range(5))
print(g)
# <generator object <genexpr> at 0x10af944f8>
print(type(g))
# <class 'generator'>

for i in g:
    print(i)
# 0
# 1
# 4
# 9
# 16

# String comparison
print('bbb' in 'aaa-bbb-ccc')
# True

print('xxx' in 'aaa-bbb-ccc')
# False

s = 'aaa-bbb-ccc'
print(re.search('^aaa', s))
# <re.Match object; span=(0, 3), match='aaa'>

# for even numbers (num % 2) will return 0, which in boolean logic means False.

# tuple and List
tuple is immutable(不可变)

## tuple占用内存小
this_is_tuple = ('a','b','c')
this_is_tuple.__sizeof__()
48

this_is_list = ['a','b','c']
this_is_list.__sizeof__()
64

列表是动态的，需要储存指针，同时需要额外储存已经分配的长度大小，都会占用空间
ls.append() ls.remove() ls.pop()

## tuple使用场景
1、作为函数使用容器
def get_location():
    ...
    return (lon,lat)

2、作为字典的键
3、打包解包
打包是把一堆元素放到容器中，解包是把容器里的元素分别赋值给变量
## 打包
t = ('foo','bar','baz','qux')
t[0]  t[-1]
'foo'  'qux'

## 解包
(s1,s2,s3,s4) = t
s1     s2
'foo'  'bar'

## tuple常用方法
len(tuple)
max(tuple)
min(tuple)
tuple(seq) #将列表转化为元组
