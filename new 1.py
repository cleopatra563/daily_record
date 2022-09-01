
def all(iterable):
    for element in iterable:
        if not element:
            return False
    return True


if __name__ = "__main__":
    print("Example:")
    print()

if,if not
in,not in

def all(iterable):
    for element in iterable:
        if not element:
            return False
    return True

lst = []
all(lst)
lst.append('element')
parameter:string boolean

def freq_nb(freq_nb,freq_NB,freq_Nb):
    # your code here


if __name__ = "__main__":
    print("Example:")
    print(freq_nb())

    freq_nb(xxxxxxxx) = 1

len()
str()
open()
range()
count()
spilt()

iter(object)
from functools import partial
with open(".db","rb") as f:
    for block in iter(partial(f.read(),64)):
        process_block(block)

def most_frequent(data:list)->str:
    return max(data,key=data.count)

list.count()
max(data,key=data.count())

squares = []
for x in range(10):
    squares.append(x**2)

squares = [x**2 for x in range(10)]
if  if not
split() strip()

if not element:
    return result1
else:
    return rsult2

input  data structure
output data structure

num = 5600
def end_zeros(num:int)->int:
    if num = 0:
        return 1
    for i in np.arrange(1,len(str(num))+1):
        if float(b/10**2).is_integer() == False
    return xx

val[::-1] backwards string
split() strip() find() replace()
list comprehension [x for x in iterable]
dict comprehension {x:x**2 for x in iterable}
str comprehension [x for x in iterable]

sequence types list tuple range
text sequence types str
binary sequnce types bytes
dict types dict

def remove_all_before(items,border):
 """
 the function is removing all elements that go before 3
 """
    # your code here
    if len(items) == 0:
        return items

    if border not in items:
        return items

    idx = items.index(border)
    return items[idx:]

def remove_all_before(items,border):
    try:
        return items[items.index(border):]
    except ValueError:
        return items

print("The original list is:"+str([1,5,6,7,4]))

test_list = [1,5,6,7,4]
for i in (0,-1):
    print(test_list[i])

res = [test_list[i] for i in (0,-1)]

def N_element_extract(test_list,N):
    res = test_list[N]
    return res

if "__name__" == "__main__":
    print("Example:")
    print(N_element_extract([1,5,6,7,4],3))
    print("Coding complete?")

test_list = [1,5,6,7,7]
size = len(test_list)
temp = test_list[0]
test_list[0] = test_list[size-1]
test_list[size-1] = temp

def swapList(test_list):
    size = len(test_list)
    temp = test_list[0]
    test_list[0] = test_list[size-1]
    test_list[size-1] = temp
    return test_list


test_list[0],test_list[-1] = test_list[-1],test_list[0]
N is variable and changed N in [1,2,5,6]
int 1234 no iterable  str '1234' iterable

## example1
using str comprehension,output the max digit
input = 564
output = 6
number = 564
max(int(x) for x in  str(number))
max(int(x) for x in str(a) if x not in '.-')
int(max(str(number)))

## example2
ss = 'abcd'
s = ','.join(str(i) for i in ss) #convert string into string with comma like 'a,b,c,d'

## example3
string to be evenly sized chunk
input str = '123456789'
output ['12','34','56','78','9_']
       str[0:2],str[2:4]
range(0,9,2)    i=0,2,4,6,8 i+n = 2,4,6,8

str = '123456789'
n=2
[str[i:+n] for i in range(0,len(str),n)]
str[i:i+n] ss[i:i+n]

##example4
string to be evenly sized chunk in another way
input: a string
output:a iterable object

def split_pairs(a):
    a += '_' if len(a)%2 else ""
    out = [a[i:i+2] for i in range(0,len(a),2)]
    return out

if "__name__" == "__main__":
    input("a: ")
    list(split_pairs(a))
    print("Check Complete? Click!")

"""
1==True 0==False,will compare to equal
True/1(any int except 0) being truthy
False/0 being falsy
"""
a = 'abc'
if len(a)%2:
    a += "_"
else:
    ""

a if conditon else b  #a and b are variablies

i = 1234
s3 = str{i}
s3 = "0"*(5-len(str)) + s3

i =1234
f"{1:05d}"

## example
how many digits("0") are at the beginning of the given string
input:a string, thst consists of digits
ouput:an int

number = '001001'
def beginning_zeros(number):
    count =  0
    for i in range(0,len(number)):
        if number[i] == '0:
            count += 1
        else:
            count
    return count

def beginning_zeros(number: str) -> int:
    result = 0
    for n in number:
        if n == '0':
            result += 1
        else:
            return result
    return result

def beginning_zeros(number):
    count = 0
    for n in number:
        if n != '0':
            break
        else:
            count += 1
    return count

def beginning_zeros(number):
    return len(number)-len(number.lstrip('0'))

## example
Find the nearest value to the given one
input :values,one  values = {4,7,10,11,12,17} set
output:int

def nearest_value(values,one):
    for i in values:
        temp1 = abs(i-one)
        temp2 = abs()
        if temp1<temp2:
            return i
        else:
            return i+1

min((abs(n-one),n) for n in values)
