# R 내장 함수로 데이터를 추출하기
exam <- read.csv("csv_exam.csv")
exam

# [] : 비어있으면 모든 정보 출력
exam[]

# [행, 열] 
exam[1, ]
exam[1, 5]
exam[2, ]
exam[ , 5]

# class가 1인 행 전부 출력 
exam[exam$class == 1, ]

# 수학 점수가 80이상인 행 전부 출력
exam[exam$math >= 80, ]

# 1반이고 수학 점수가 50이상인 학생 출력
exam[exam$class == 1 & exam$math >= 50, ]

# 영어 점수가 90점 미만 또는 과학 점수가 50점 미만일 때 출력 
exam[exam$english < 90 | exam$science < 50, ]

exam[exam$id >= 3, ]

# column
exam[ , 1]

exam[ , 2]

exam[ , "class"]
exam[ , "math"]
exam[ , c("class", "math", "english")]

# 수학 점수 50점
exam[1, 3]
exam[5, "english"]
exam[5, c("class", "math", "english")]

# 수학 점수가 50점 이상인 학생의 영어와 과학 점수를 출력
exam[exam$math >= 50, c("english", "science")]


# 변수 타입
var1 <- c(1, 2, 3, 1, 2)
var1

# factor() : 범주형 변수
# 범주형 변수는 주로 텍스트 형태로 되어 있으며, 정해진 몇 가지 카테고리 중 하나를 값으로 가진다. 
# 예를 들어, "남", "여"와 같은 성별이나, "소형", "중형", "대형"과 같은 자동차 크기 등이 범주형 변수의 예
var2 <- factor(c(1, 2, 3, 1, 2))
var2

var1 + 2

# factor 변수 연산X
var2 + 2

# class() : 변수 타입 확인 
class(var1)
class(var2)

var2 <- as.numeric(var2)
class(var2)

var2 + 2

