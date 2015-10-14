from subprocess import Popen, PIPE
from math import pow

results = [[0 for x in range(5)] for x in range(29)]

n = int(pow(2,29))
m = int(pow(2,30))

print("PART4")
for i in range(0,28):
	for j in range(5):
		proc = Popen("java -Xmx4g Tester part4 " + str(n) + " " + str(m) + " " + str(i), shell=True, stdout=PIPE, stderr=PIPE)
		proc.wait()
		results[i][j] = float(proc.stdout.readline())
	#find mean
	results[i].sort()
	mean = (results[i][1]+results[i][2]+results[i][3])/3
	print(str(i)+","+str(mean))