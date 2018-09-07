from socket import *
import threading
from pymongo import MongoClient
import datetime

# tpc server
serverPort = 8081
serverSocket = socket(AF_INET, SOCK_STREAM)
serverSocket.bind(("", serverPort))
serverSocket.listen(1)

# mongodb client
client = MongoClient('localhost', 27017)
db = client.TA
messages = db.messages


class chatClient(threading.Thread):
    def __init__(self, connection, cname):
        threading.Thread.__init__(self)
        self.connection = connection
        self.cname = cname

    def run(self):
        do_command(self.connection, self.cname)


def do_command(connection, cname):
    while 1:
        command = connection.recv(1024).decode("utf-8")
        print("%s: %s" % (cname, command))
        if int(command) == 1:
            print("%s wants to send a message!" % cname)
            send_message(connection, cname)
        elif int(command) == 2:
            print("%s wants to see all the messages!" % cname)
            show_all(connection)
        else:
            print("%s wants to quit the chat!" % cname)
            finish(connection)


def send_message(connection, cname):
    message = connection.recv(1024).decode("utf-8")
    print("%s: %s" % (cname, message))
    post = {"name": cname, "content": message, "time": datetime.datetime.now()}
    messages.insert_one(post)
    connection.send(bytes("your message is sent!", "utf-8"))


def show_all(connection):
    all_messages = ""
    for message in messages.find():
        all_messages += '{}: {} time: {}\n'.format(message["name"], message["content"], message["time"])
    connection.send(bytes(all_messages, "utf-8"))


def finish(connection):
    connection.send(bytes("Good Bye!", "utf-8"))
    connection.close()


clients = []

while 1:
    connectionSocket, addr = serverSocket.accept()
    name = connectionSocket.recv(1024).decode("utf-8")
    print("%s joined the chat!" % name)
    cc = chatClient(connectionSocket, name)
    cc.start()
    clients.append(cc)

# if __name__ == "__main__":
#     initialize()

