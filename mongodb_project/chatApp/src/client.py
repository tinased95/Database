from socket import *

serverName = "Lenovo-IdeaPad-Z410"
serverPort = 8081
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((serverName, serverPort))
sentence = input("what is your name? ")
clientSocket.send(bytes(sentence, "utf-8"))

while 1:
    command = input("1. send a new message\n2. see all messages\n3. exit\nwhich one do you want? choose one: ")
    clientSocket.send(bytes(command, "utf-8"))
    if int(command) == 1:
        message = input("Enter your message: \n")
        clientSocket.send(bytes(message, "utf-8"))
        print(clientSocket.recv(1024).decode("utf-8"))
        input()
    if int(command) == 2:
        print("all the messages: \n")
        print(clientSocket.recv(1024).decode("utf-8"))
        input()

    if int(command) == 3:
        print(clientSocket.recv(1024).decode("utf-8"))
        exit()

# clientSocket.close()
