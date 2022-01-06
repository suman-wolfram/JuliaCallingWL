using ZMQ
using JSON

function SocketConnect(sock)
    ctx = Context(1)
    s = Socket(ctx, PAIR)
    ZMQ.connect(s, "tcp://127.0.0.1:" * sock)
    return s
end


# mySock = SocketConnect("5557")

# ZMQ.send(mySock, "s1 = NDSolve[{y'[x] == y[x] Cos[x + y[x]], y[0] == 1}, y, {x, 0, 30}];Table[Evaluate[y[x] /. s1], {x, 0, 30}]")

# msg = ZMQ.recv(mySock)
# res =  String(UInt8.(msg))
# JSON.parse(res)["Output"]