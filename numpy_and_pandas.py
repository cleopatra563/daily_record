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
.rename() {original name:new name}
df_new = df.rename(columns={"A":"Col_1"},index={"ONE":"Row_1"})
df.rename(columns = {"A":"Col_1","C":"Col_3"})
