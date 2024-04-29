# 데이터 파악하기 
exam <- read.csv("csv_exam.csv")

# head 함수 
head(exam) # 6개 행 출력 
head(exam, 4)

# tail
tail(exam) # 6개 행 출력
tail(exam, 4)

# View, 데이터 프레임을 사용자에게 보여주는 대화형 보기 윈도우를 연다.
View(exam)

# dim, 데이터 프레임 행과 열의 개수
dim(exam) # 20, 5

# str, 데이터 프레임의 구조를 확인
str(exam)

# summary, 데이터 프레임의 요약 정보를 출력
summary(exam)


# Help -> 검색 아이콘 클릭 -> mpg 검색
# mpg 데이터 파악하기 
# manufacturer : 제조회사 
# model : 자동차 모델명
# displ : 배기량
# year : 생산연도
# cyl : 실린더 개수
# trans : 변속기 종류
# drv : 구동방식
# cty : 도시 연비
# hwy : 고속도로 연비
# fl : 연료 종류
# calss : 자동차 종류

install.packages("ggplot2")
# as.data.frame() : 다른 데이터 구조를 데이터 프레임(data frame)으로 변환하는데 사용
mpg <- as.data.frame(ggplot2 :: mpg) # ggplot2에 있는 mpg 데이터를 가지고 데이터 프레임을 만들고 mpg 변수에 넣는다.

head(mpg)
tail(mpg)
dim(mpg)
View(mpg)
str(mpg)
summary(mpg)

