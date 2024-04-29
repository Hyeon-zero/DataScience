# 척도별 기술통계량 구히기
# resident : 거주지역(명목) 1, 2, 3
# gender : 성별(명목) 1, 2
# age : 나이(비율)
# level : 학력수준(서열) 1, 2, 3
# cost : 생활비(비율)
# type : 힉교유형(명목) 1, 2
# survey : 만족도(등간) 5점 만점
# pass : 합격여부(명목) 1, 2


# 'descriptive.csv' 파일에서 데이터를 읽어와 'data'라는 데이터 프레임에 저장
data <- read.csv("descriptive.csv", header = TRUE)
head(data)

# 데이터 프레임 행과 열의 개수
dim(data)

# 데이터의 구조를 출력
str(data)

# 데이터 프레임의 요약 정보를 출력
summary(data)


# 명목척도
# 성별(gender) 변수의 요약 통계 및 빈도수 테이블 생성
summary(data$gender)
table(data$gender)

# 성별 데이터에서 유효한 값(1, 2)만 포함시키기
data <- subset(data, gender == 1 | gender == 2)
x <- table(data$gender)
x

# 성별 빈도에 대한 막대 그래프 생성
barplot(x)


# 서열척도
# 학력수준(level) 변수의 요약 통계 및 빈도수 테이블 생성
summary(data$level)
table(data$level)
x1 <- table(data$level)
x1

# 학력수준 빈도수에 대한 막대 그래프 생성
barplot(x1)


# 등간척도
# 만족도(survey) 변수 저장 및 출력
survey <- data$survey
survey

# 만족도의 요약 통계 출력
summary(survey)
x2 <- table(data$survey)
x2

# 만족도 빈도수에 대한 히스토그램 및 원 그래프 생성
hist(survey)
pie(x2)


# 비율척도
# 생활비(cost) 변수의 요약 통계 출력
summary(data$cost)
plot(data$cost)

# 생활비 데이터에서 유효한 범위(2 이상 10 이하)만 포함시키기
data <- subset(data, data$cost >= 2 & data$cost <= 10)
x3 <- data$cost
x3

# 생활비 데이터의 평균, 중앙값, 정렬된 데이터, 사분위수 계산
mean(x3)
median(x3)
sort(x3)
sort(x3, decreasing = T)
quantile(x3, 1/4)
quantile(x3, 2/4)
quantile(x3, 3/4)
quantile(x3, 4/4)

