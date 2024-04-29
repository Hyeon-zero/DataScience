# if-else
a <- 10

if (a < 5) {
  print(a)
} else {
  print(a * 10)
  print(a / 10)
}


a <- 10
b <- 20

if (a > 5 & b > 5) {
  print(a + b)
}

if (a > 5 | b > 30) {
  print(a * b)
}

# if-else
a <- 10
b <- 20

if (a > b) {
  c <- a
} else {
  c <- b
}

print(c)

a <- 10
b <- 20
c <- ifelse(a > b, a, b)
print(c)

weather <- "맑음"
choice <- ifelse(weather == "비", "우산", "모자")
print(choice)

# if-else 반복
score <- 85

if (score > 90) {
  grade <- 'A'
} else if (score > 80) {
  grade <- 'B'
} else if(score > 70) {
  grade <- 'C'
} else if (scroe > 60) {
  grade <- 'D'
} else {
  grade <- 'F'
}

print(grade)

# for
for (i in 1 : 5) {
  print('*')
}

for (i in 6 : 10) {
  print(i)
}

# cat() : 하나 이상의 객체를 연결하여 출력하는 데 사용
for (i in 1 : 9) {
  cat('2 *', i, '=', 2 * i, '\n')
}

for (i in 2 : 9) {
  for (j in 1 : 9) {
    cat(i, '*', j, '=', i * j, '\n')
  }
}

for (i in 1 : 20) {
  if (i %% 2 == 0) {
    cat(i, ' ')
  }
}

# apply
# apply(데이터셋, 행/열 방향(1 : 행, 2 : 열), 적용함수)
iris <- iris

# iris 데이터셋의 각 행에 대한 네 변수의 평균값을 계산한 결과를 반환
apply(iris[ , 1 : 4], 1, mean)

# iris 데이터셋의 각 열(변수)에 대한 전체 평균을 계산한 결과를 반환
apply(iris[ , 1 : 4], 2, mean)

