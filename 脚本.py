def circle(t,r,angle):
    C = 2*math.pi*r
    length = C*abs(angle)/360
    n = int(C/length)
    for i in range(n):
        t.fd(length)
        t.lt(angle)

n*angle = 360
length*n = C
C = 2*math.pi*r

n = int(arc_length / 4) + 3
t.fd(step_length)
t.lt(step_angle)

def polygon(t,n,length):
    angle = 360/n
    for i in range(n):
        t.fd(length)
        t.lt(angle)

def circle(t,r):
    C = 2*math.pi*r
    n = 50
    length = C/n
    polygon(t,n,length)

#设计函数接口，显示直接信息
def circle(t,r):
    C = 2*math.pi*r
    n = int(C/3)+1
    length = C/n
    polygon(t,n,length)

def circle(t,r):
    arc(t,r,360)

def countdown(n):
    if n is not null:
        print("---------BlastOff!----------")
    else:
        print(n)
        countdown(n-1)

def printf(s,n):
    if n<-=0:
        print("------finish!------")
    else:
        print(s)
        print(printf(s,n-1))
