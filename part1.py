from subprocess import Popen, PIPE

quicklist = [[0 for x in range(5)] for x in range(26)]
heaplist = [[0 for x in range(5)] for x in range(26)]

i = 1000
lasti = 0
index = 0
print("QUICK")
while lasti < 500000000:
	for j in range(5):
		proc = Popen("java -Xmx4g Tester quicksortints " +str(i), shell=True, stdout=PIPE, stderr=PIPE)
		proc.wait()
		quicklist[index][j] = float(proc.stdout.readline())
	
	quicklist[index].sort()
	mean = (quicklist[index][1]+quicklist[index][2]+quicklist[index][3])/3
	print(str(i)+","+str(mean))
	
	lasti = i
	i = int(i * 1.7)
	index += 1

i = 1000
lasti = 0
index = 0
print("HEAP")
while lasti < 500000000:
	for j in range(5):
		proc = Popen("java -Xmx4g Tester heapsortints " +str(i), shell=True, stdout=PIPE, stderr=PIPE)
		proc.wait()
		heaplist[index][j] = float(proc.stdout.readline())
	
	heaplist[index].sort()
	mean = (heaplist[index][1]+heaplist[index][2]+heaplist[index][3])/3
	print(str(i)+","+str(mean))
	
	lasti = i
	i = int(i * 1.7)
	index += 1