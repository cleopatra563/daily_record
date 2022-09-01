# -*- coding: utf-8 -*-
"""
Created on Thu Jun  9 10:31:04 2022

@author: zhoumy
"""
#dataframe格式数据应当怎样处理
#案例：UCI Machine Learning Repository，针对文件中的评论进行词云分析

## 导入csv文件
import pandas as pd
from wordcloud import WordCloud,STOPWORDS
import matplotlib.pyplot as plt

path = 'C:/Users/zhoumy/Desktop/ewan工作文件/ta_android_sdk/SpamCollection/Youtube04-Eminem.csv'
df = pd.read_csv(path,encoding='latin-1')
comment_words = ""
stopwords = set(STOPWORDS) #设置停用词

##遍历csv文件中的评论内容
for val in df.CONTENT:
    val = str(val)
    tokens = val.split() #切割出每一句评论里面的每个单词
    # break 用来测试一下，看tokens长什么样子

    for i in range(len(tokens)):
       tokens[i] =  tokens[i].lower()
       
    comment_words += ' '.join(tokens) + ' '


##制作词云
cloud = WordCloud(background_color = "white",max_words=200,stopwords = set(STOPWORDS))
cloud.generate(comment_words)

plt.figure(figsize=(8,8),facecolor = None)
plt.imshow(cloud)
plt.axis('off')
plt.tight_layout(pad = 0)
plt.show()
