from subprocess import Popen, PIPE

specific = [[0 for x in range(5)] for x in range(26)]
sattolo = [[0 for x in range(5)] for x in range(26)]

m = 1000000000

i = 1000
lasti = 0
index = 0

print("PART3 SPECIFIC")
while lasti < 500000000:
	for j in range(5):
		proc = Popen("java -Xmx4g Tester part3specific " +str(i) + " " + str(m), shell=True, stdout=PIPE, stderr=PIPE)
		proc.wait()
		specific[index][j] = float(proc.stdout.readline())
	#find mean
	specific[index].sort()
	mean = (specific[index][1]+specific[index][2]+specific[index][3])/3
	print(str(i)+","+str(mean))
	lasti = i
	i = int(i * 1.7)
	index += 1

i = 1000
lasti = 0
index = 0
print("PART3 SATTOLO")
while lasti < 500000000:
	for j in range(5):
		proc = Popen("java -Xmx4g Tester part3sattolo " +str(i) + " " + str(m), shell=True, stdout=PIPE, stderr=PIPE)
		proc.wait()
		sattolo[index][j] = float(proc.stdout.readline())
	#find mean
	sattolo[index].sort()
	mean = (sattolo[index][1]+sattolo[index][2]+sattolo[index][3])/3
	print(str(i)+","+str(mean))
	lasti = i
	i = int(i * 1.7)
	index += 1