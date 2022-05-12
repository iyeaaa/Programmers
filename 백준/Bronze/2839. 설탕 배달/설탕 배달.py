n = int(input())
result = 0

while n % 5 != 0:
    n -= 3
    result += 1

if n < 0:
    result = -1
elif n == 0:
    pass
else:
    result += n // 5

print(result)
