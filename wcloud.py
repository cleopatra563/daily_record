具体步骤：
1）先使用 jieba库 将数据进行清洗，清洗前为txt文件，清洗后变为以空格分隔的词语字符串string [jieba 分中文词]
2）将字符串string传给函数wc.generate_from_text（）进行绘图即可[wordcloud]

wordcloud做词频统计步骤：
1）分隔：以空格分隔单词  " ".join(cut)
2）统计：单词出现的次数并过滤
3）字体：根据统计搭配相应的字号
4）布局

pip升级：
python -m pipinstall --upgrade pip

遇到wordcloud安装不成功 解决方案：
1）下载wheel：https://www.lfd.uci.edu/~gohlke/pythonlibs/ #wordcloud
2）命令行安装，whl下载路径移动到site-packages
- cd C:\Users\zhoumy\anaconda3\Lib\site-packages
- pip install wordcloud wordcloud-1.8.1-cp39-cp39-win_amd64.whl


jieba参数：
jieba是切割中文词的，英文的话不需要这个库
1）分词
jieba.cut() 返回迭代器
jieba.lcut() 返回列表

import jieba
path = r"当前文件夹位置"
def tcg(texts):
    cut = jieba.cut(texts) #英文的话，切开每一个词，不需要用jieba，直接使用str.split()
    string = ' '.join(cut)
    return string

text = open(path+r"\cloud.txt",'r',encoding='utf-8').read()
string = tcg(text)

import matplotlib.pyplot as plt
from wordcloud import WordCloud,STOPWORDS
import numpy as np
from PIL import Image

def create_word_cloud(string):
    #maskArray = np.array(Image.open('cloud.png'))
    cloud = WordCloud(background_color = "white",max_words=200,stopwords = set(STOPWORDS))
    cloud.generate(string)
    cloud.to_file("wordCloud.png") #云图输出成图片

    #在线画图
    plt.figure(figsize=(8,8),facecolor = None)
    plt.imshow(cloud)
    plt.axis('off')
    plt.tight_layout(pad = 0)
    plt.show()

string = string.lower()
create_word_cloud(string)

def tcg(texts):
    cut = jieba.cut(texts)
    string = ' '.join(cut)
    string = string.lower()
    return string
