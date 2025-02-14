def circle(t,r,length):
    C = 2*math.pi*r
    n = C/length
    angle = 360/n
    for i in range(n):
        t.fd(length)
        t.lt(angle)
