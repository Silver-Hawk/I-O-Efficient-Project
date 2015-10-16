from subprocess import Popen, PIPE
import subprocess, threading

timeout = 1

class Command(object):
    def __init__(self, cmd):
        self.cmd = cmd
        self.process = None

    def run(self, timeout):
        def target():
            self.process = subprocess.Popen(self.cmd, stdout=PIPE, stderr=PIPE, shell=True)
            print(self.process.communicate()[0])

        thread = threading.Thread(target=target)
        thread.start()

        thread.join(timeout)
        if thread.is_alive():
            self.process.terminate()
            thread.join()
            print 'Terminating process'
            return 0

        return 1

i = 1000
lasti = 0
index = 0
print("PART 1 QUICK")
while lasti < 500000000:
    print(str(i)+", ")
    command = Command("java -Xmx4g Tester quicksortints " +str(i))
    keeprunning = command.run(timeout=timeout)
    
    if keeprunning == 0:
        break

    lasti = i
    i = int(i * 1.7)
    index += 1

i = 1000
lasti = 0
index = 0
print("PART 1 HEAP")
while lasti < 500000000:
    print(str(i)+", ")
    command = Command("java -Xmx4g Tester heapsortints " +str(i))
    keeprunning = command.run(timeout=timeout)
    
    if keeprunning == 0:
        break

    lasti = i
    i = int(i * 1.7)
    index += 1

print("PART 2 QUICK INTEGERS")
i = 1000
lasti = 0
index = 0
while lasti < 30000000:
    print(str(i)+", ")
    command = Command("java -Xmx4g Tester quicksortintegers " +str(i))
    keeprunning = command.run(timeout=timeout)
    
    if keeprunning == 0:
        break

    lasti = i
    i = int(i * 1.7)
    index += 1

print("PART 2 HEAP INTEGERS")
i = 1000
lasti = 0
index = 0
while lasti < 30000000:
    print(str(i)+", ")
    command = Command("java -Xmx4g Tester heapsortintegers " +str(i))
    keeprunning = command.run(timeout=timeout)
    
    if keeprunning == 0:
        break
        
    lasti = i
    i = int(i * 1.7)
    index += 1


m = 1000000000
i = 1000
lasti = 0
index = 0

print("PART 3 SPECIFIC")
while lasti < 500000000:
    print(str(i)+", ")
    command = Command("java -Xmx4g Tester part3specific " +str(i) + " " + str(m))
    keeprunning = command.run(timeout=timeout)
    
    if keeprunning == 0:
        break
        
    lasti = i
    i = int(i * 1.7)
    index += 1

i = 1000
lasti = 0
index = 0
print("PART 3 SATOLLO")
while lasti < 500000000:
    print(str(i)+", ")
    command = Command("java -Xmx4g Tester part3sattolo " +str(i) + " " + str(m))
    keeprunning = command.run(timeout=timeout)
    
    if keeprunning == 0:
        break
        
    lasti = i
    i = int(i * 1.7)
    index += 1


n = int(pow(2,29))
m = int(pow(2,30))

print("PART4")
for i in range(0,28):
    print(str(i)+", ")
    command = Command("java -Xmx4g Tester part4 " + str(n) + " " + str(m) + " " + str(i))
    keeprunning = command.run(timeout=timeout)
    
    if keeprunning == 0:
        break
        
    lasti = i
    i = int(i * 1.7)
    index += 1

print("done")