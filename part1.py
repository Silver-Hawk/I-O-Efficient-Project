from subprocess import Popen, PIPE

quicklist = [[0 for x in range(5)] for x in range(26)]
heaplist = [[0 for x in range(5)] for x in range(26)]

i = 1000
lasti = 0
index = 0
while lasti < 500000000:
	for j in range(5):
		print("QUICK : I " + str(i) + " j " + str(j))
		proc = Popen("java -Xmx4g Tester quicksortints " +str(i), shell=True, stdout=PIPE, stderr=PIPE)
		proc.wait()
		quicklist[index][j] = float(proc.stdout.readline())
	lasti = i
	i = int(i * 1.7)
	index += 1

i = 1000
lasti = 0
index = 0
while lasti < 500000000:
	for j in range(5):
		print("HEAP : I " + str(i) + " j " + str(j))
		proc = Popen("java -Xmx4g Tester heapsortints " +str(i), shell=True, stdout=PIPE, stderr=PIPE)
		proc.wait()
		quicklist[index][j] = float(proc.stdout.readline())
	lasti = i
	i = int(i * 1.7)
	index += 1


i = 1000
for x in range(len(quicklist)):
	quicklist[x].sort()
	#for y in range(len(quicklist[x])):
	#	print(quicklist[x][y])
	mean = (quicklist[x][1]+quicklist[x][2]+quicklist[x][3])/3
	print(str(i)+","+str(mean))
	i = int(i * 1.7)

i = 1000
for x in range(len(heaplist)):
	heaplist[x].sort()
	#for y in range(len(quicklist[x])):
	#	print(quicklist[x][y])
	mean = (heaplist[x][1]+heaplist[x][2]+heaplist[x][3])/3
	print(str(i)+","+str(mean))
	i = int(i * 1.7)