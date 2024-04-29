# ==================================== ⭐️CH 1.⭐️ 변수, 연산, 조합(combine), 문자 변수, 함수, 평균, 최대값, 최소값, 구분자(collspace), 패키지(package) ===========================================
# 변수 만들기
a <- 1
a

b <- 2
b

c <- 3
c

d <- 3.5
d

# 변수로 연산하기
a + b
a + b + c

4 / b
5 * b

# 여러 값으로 구성된 변수 만들기
# c() -> combine[결합] 배열이랑 비슷
var1 <- c(1, 2, 5, 7, 8)
var2 <- c(1:5)

var3 <- seq(1, 5)
var3

var4 <- seq(1, 10, by = 2)
var4

var5 <- seq(1, 10, by = 3)
var5

# 연속값 변수로 연산하기
var1
var1 + 2

var2
var1 + var2

# 문자로 된 변수 만들기
str1 <- "a"
str1

str2 <- "text"
str2

str3 <- "Hello World!"
str3

# 연속 문자 변수 만들기
str4 <- c("a", "b", "c")
str4

str5 <- c("Hello", "World", "is", "good")
str5

# 함수
x <- c(1, 2, 3)
x

# 평균
mean(x)

# 최대값, 최소값
max(x)
min(x)

# collapse : 구분자
str5
paste(str5, collapse = ", ")
paste(str5, collapse = " ")

# 패키지
install.packages("ggplot2")

# ggplot2를 사용하려면 메모리에 올려둬야함
library(ggplot2)

x <- c("a", "a", "b", "c")
x

qplot(x)


# ================ ⭐️CH 2-1.⭐️ 데이터 프레임(data frame), dataframe field, 외부 데이터 이용하기, dataFrame remove command(데이터 프레임 삭제), sheet 파일 가져오기, CSV 파일 가져오기 ================
# 데이터 프레임 만들기
english <- c(90, 80, 60, 70)
english

math <- c(50, 60, 100, 20)
math

df_midterm <- data.frame(english, math)
df_midterm

class <- c(1, 1, 2, 2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

# $ : DataFrame에 있는 field를 지정
mean(df_midterm$english)
mean(df_midterm$math)

df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))

df_midterm


# 외부 데이터 이용하기
install.packages("readxl")
library(readxl)

df_exam <- read_excel("excel_exam.xlsx")
df_exam

# DataFrame remove command
rm(data_exam)

mean(df_exam$math)
mean(df_exam$english)
mean(df_exam$science)

# field가 없을 때 기존 방식으로 파일을 불러오면 문제가 생김
df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar

df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar


# sheet 파일 가져오기
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet


# CSV 파일 가져오기
df_csv_exam <- read.csv("excel_exam.csv")
df_csv_exam

write.csv(df_csv_exam, file = "df_csv_write.csv")


# ======================================================= ⭐️CH 2-2.⭐️ 내장 함수로 데이터를 추출, [], 행렬, factor(), class() ============================================================
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


# =========================================================== ⭐️CH 3-1.⭐️ tail(), View(), dim(), str(), summary() ===============================================================
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


# ================================================================ ⭐️CH 3-2.⭐️ 변수명 바꾸기, rename(), 파생변수($) ===================================================================
# 변수명 바꾸기
df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 2))

df_raw

install.packages("dplyr")
library(dplyr)

df_new <- df_raw

# rename(데이터 프레임, 바꿀 변수명 = 현재 변수명)
df_new <- rename(df_new, v2 = var2)
df_new

mpg <- as.data.frame(ggplot2 :: mpg)
mpg

head(mpg)
tail(mpg)

mpg_new <- mpg

head(mpg_new)

mpg_new <- rename(mpg_new, city = cty)
head(mpg_new)

mpg_new <- rename(mpg_new, highway = hwy)
head(mpg_new)


# 파생변수($) 만들기
df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df

df$var_sum <- df$var1 + df$var2
df$var_sum

df$var_mean <- (df$var1 + df$var2) / 2
df$var_mean


str(mpg)

mpg$total <- (mpg$cty + mpg$hwy) / 2
mpg$total

head(mpg)

mean(mpg$total)


summary(mpg$total)
hist(mpg$total)

mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)

table(mpg$test)

library(ggplot2)
qplot(mpg$test)


# ====================================================================== ⭐️CH 4-1.⭐️ %>% (파이프 연산자) ============================================================================
# 조건에 맞는 데이터만 추출하기
library(dplyr)

exam <- read.csv("csv_exam.csv")
exam

# %>% (파이프 연산자(pipe operator)) : dplyr 패키지 및 tidyverse 생태계에서 데이터 처리 작업을 위해 사용
# Command + Shift + M : %>% 자동 완성
exam %>% filter(class == 1)
exam %>% filter(class == 2)
exam %>% filter(class != 1)
exam %>% filter(class != 3)

exam %>% filter(math > 50)
exam %>% filter(math < 50)
exam %>% filter(english >= 80)
exam %>% filter(english <= 80)

exam %>% filter(class == 1 & math >= 50)
exam %>% filter(class == 2 & english >= 80)
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(english <= 90 | science < 50)

exam %>% filter(class == 1 | class == 3 | class == 5)

class1 <- exam %>% filter(class == 1)
class1

class2 <- exam %>% filter(class == 2)
class2

mean(class1$math)
mean(class2$math)


# 필요한 변수만 추출하기
exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)

# 수학을 제외한 나머지 column
exam %>% select(-math)
exam %>% select(-math, -english)

# class가 1인, 영어 점수 출력
exam %>% filter(class == 1) %>% select(english)
exam %>%
  filter(class == 1) %>%
  select(english)


# ================================================== ⭐️CH 4-2.⭐️ arrange() 정렬, summarise() 집단별 요약, group_by(), 가로・세로 합치기 ===================================================
# 순서대로 정렬하기
library(dplyr)
exam <- read.csv("csv_exam.csv")
exam %>% arrange(math) # 오름차순 정렬
exam %>% arrange(desc(math)) # 내림차순 정렬

# class 먼저 정렬, 그 다음 math 정렬
exam %>% arrange(class, math)


# 파생변수 추가하기
exam %>%
  mutate(total = math + english + science) %>%
  head

exam %>%
  mutate(total = math + english + science,
         mean = (math + english + science) / 3) %>%
  head

exam %>%
  mutate(test = ifelse(science >= 60, "Pass", "Fail")) %>%
  head

exam %>%
  mutate(total = math + english + science) %>%
  arrange(total) %>%
  head


# 집단 별로 요약하기
# summarise() : dplyr 패키지에서 제공, 데이터의 요약 통계를 계산할 때 사용한다.
exam %>% summarise(mean_math = mean(math))

# summarise()는 group_by() 함수와 함께 사용되어 그룹별로 데이터를 요약한다.
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math))

# n : 학생 수
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())


# 데이터 합치기

# 가로로 합치기
test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                    midterm = c(60, 80, 70, 90, 85))
test1

test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    final = c(70, 83, 65, 95, 80))
test2
     
               
total <- left_join(test1, test2, by = "id")
total

# 세로로 합치기
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))
group_a

group_b <-  data.frame(id = c(1, 2, 3, 4, 5),
                       test = c(70, 83, 65, 95, 80))
group_b

group_all <- bind_rows(group_a , group_b)
group_all


# ===================================== ⭐️CH 5-1.⭐️ if-else 조건문, cat() 하나 이상의 객체를 연결하여 출력, apply(데이터셋, 행/열 방향(1 : 행, 2 : 열), 적용함수) ==================================
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


# ========================================================================= ⭐️CH 5-2.⭐️ 결측지, 이상치 =============================================================================
# 데이터 프레임 생성: 성별(sex)과 점수(score)를 변수로 가지며, 일부 데이터에는 결측치(NA)가 포함
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                         score = c(5, 4, 3, 4, NA))
df

# 결측지 확인하기
# 데이터 프레임 내 모든 요소에 대해 결측치 여부를 확인
is.na(df)

# 데이터 프레임 내 각 요소의 결측치 여부를 요약하여 표로 나타낸다.
table(is.na(df))

# 'sex' 열에 대한 결측치 수를 표로 나타낸다.
table(is.na(df$sex))

# 'score' 열에 대한 결측치 수를 표로 나타낸다.
table(is.na(df$score))

# 'sex' 열의 평균을 구하려 하지만, 문자형 데이터이므로 계산되지 않는다.
mean(df$sex)

# 'score' 열의 평균을 계산합니다. NA가 있으므로 결과는 NA
mean(df$score)


library(dplyr)

# 결측치 제거하기
# 'score'에서 결측치인 데이터만 필터링
df %>% filter(is.na(score))

# 'score'에서 결측치가 아닌 데이터만 필터링
df %>% filter(!is.na(score))

# 'score'의 결측치를 제외하고 새로운 데이터 프레임을 생성
df_nomiss <- df %>% filter(!is.na(score))

# 결측치가 제거된 데이터의 'score' 평균 및 합을 계산
mean(df_nomiss$score)
sum(df_nomiss$score)

# 여러 변수 동시에 결측치 없는 데이터 추출하기
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

# 결측치가 하나라도 있으면 제거하기
df_nomiss2 <- na.omit(df)
df_nomiss2

# 함수의 결측치 제외 기능 이용하기
# 함수를 사용하여 결측치 제외 옵션(na.rm = TRUE)으로 'score'의 평균과 합을 다시 계산
mean(df$score)
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)


# csv 파일에서 데이터를 불러온 후, 특정 행의 'math' 점수에 결측치를 할당
exam <- read.csv("csv_exam.csv")
exam[c(3, 8, 15), "math"] <- NA
exam

# 'math' 점수의 평균을 계산할 때 결측치를 제외하거나 포함하여 계산
exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm = T))

# 결측치 대체하기
mean(exam$math, na.rm = T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))

# 이상치 제거하기
# 이상치를 확인하고 처리하는 과정'sex'가 3인 이상치를 NA로 대체하고, 'score'가 5를 초과하는 이상치를 NA로 대체
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))
outlier

table(outlier$sex)
table(outlier$score)

outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier$sex
outlier

outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier$score
outlier

# 이상치를 제거한 데이터에서 'sex'별로 그룹화하여 'score'의 평균을 계산
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score))


# ============================================== ⭐️CH 6-1.⭐️ barplot() 막대 그래프, colors(), hist() 히스토그램, plot() 선 그래프 =======================================================
# 막대 그래프, 계절 선호도 데이터 생성
favortie <- c("Winter", "Summer", "Spring", "Summer", "Summer", "Fall", "Fall", "Summer", "Spring", "Spring")
favortie

# 데이터의 빈도수 계산
table(favortie)

# 빈도수를 변수 ds에 저장
ds <- table(favortie)
ds

# 기본 막대 그래프
barplot(ds, main = "favorite season")

# 막대 색상을 파란색으로 설정하여 그래프 생성
barplot(ds, main = "favorite season",
        col = 'blue')

# 사용 가능한 색상 확인
colors()

# 막대 그래프에서 막대별로 색상 설정
barplot(ds, main = "favorite season",
        col = c("blue", "red", "green", "yellow"))


# 무지개 색상을 이용한 막대 그래프
barplot(ds, main = "favorite season",
        col = rainbow(4))

# x축, y축 라벨 추가 및 막대 색상 설정
barplot(ds, main = "favorite season",
        col = "green",
        xlab = "계절",
        ylab = "빈도수")

# 수평 막대 그래프
barplot(ds, main = "favorite season",
        col = "green",
        xlab = "계절",
        horiz = TRUE)

# 계절 이름을 변경하여 막대 그래프 생성
barplot(ds, main = "favorite season",
        col = "green",
        xlab = "계절",
        names = c("FA", "SP", "SU", "WI"))

# 축 라벨의 방향을 수직으로 설정
barplot(ds, main = "favortie season",
        col = "green",
        las = 2)


# 히스토그램
# cars 데이터셋의 처음 몇 개의 데이터 확인
head(cars)
dist <- cars[ , 2]
head(dist)

# 제동 거리에 대한 히스토그램 생성
hist(dist,
     main = "Histogram for dist",
     xlab = "제동거리",
     ylab = "빈도수",
     border = "blue",
     col = "green",
     las = 2,
     breaks = 5) # 구간(bin)의 수를 5개로 설정


# 원그래프
# 빈도수 데이터 확인
ds

# 기본 원 그래프
pie(ds, main = "선호하는 계절", radius = 1)

# 색상 지정된 원 그래프
pie(ds, main = "선호하는 계절",
    col = c("brown", "green", "red", "black"),
    radius = 1)


# 선그래프
# 월별 데이터 생성
month = 1 : 12

# 지각생 수 데이터
late = c(5, 8, 7, 9, 4, 6, 12, 13, 8, 6, 6, 4)

# 선 그래프 생성
plot(month,
     late,
     main = "지각생 통계",
     type = "l",  # 선 그래프 지정
     lty = 1,  # 선 타입
     lwd = 1,  # 선 두께
     xlab = "Month",  # x축 라벨
     ylab = "late")  # y축 라벨


# =========================================== ⭐️CH 6-2.⭐️ 산점도, aes(), xlim(), ylim(), geom_bar(), 선그래프, geom_boxplot() 상자 그림 ================================================
# ggplot2 패키지
install.packages("ggplot2")
library(ggplot2)

# mpg data set
# manufacturer: 제조회사
# model : 자동차
# displ : 배기량
# year : 생상연도
# cyl : 실린더 개수
# trans : 변속기 종류
# drv : 구동방식
# cty : 도시 연비
# hwy : 고속도로 연비
# fl : 연료 종류
# class : 자동차 종류


# 산점도
head(mpg)

# 이 코드 자체는 산점도의 점들을 아직 그리지 않고 기본 플롯 설정만을 구성
ggplot(data = mpg, aes(x = displ, y = hwy))

# 배기량(displ)과 고속도로 연비(hwy)의 관계를 산점도로 나타낸다.
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point()

# 배기량이 3에서 6 사이의 자동차만을 대상으로 산점도를 그린다.
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  xlim(3, 6)

# 배기량이 3에서 6 사이이고, 고속도로 연비가 10에서 30 사이인 자동차에 대한 산점도를 그린다.
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  xlim(3, 6) +
  ylim(10, 30)


# 막대 그래프
library(dplyr)

# 구동방식(drv)별 고속도로 연비(hwy)의 평균을 계산
df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

df_mpg

# 구동방식별
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) +
  geom_col()

# 구동방식을 연비 평균에 따라 내림차순으로 재정렬하고 막대 그래프를 그린다.
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) +
  geom_col()

# geom_bar() 기존 데이터로 만듦
# drv 값의 빈도에 따라 기본 막대 그래프를 생성
ggplot(data = mpg, aes(x = drv)) + geom_bar()

# 고속도로 연비(hwy) 값의 빈도에 따라 막대 그래프를 생성
ggplot(data = mpg, aes(x = hwy)) + geom_bar()


# 선그래프
head(economics)

# 날짜(date)에 따른 실업자 수(unemploy)의 변화를 선 그래프로 나타낸다.
ggplot(data = economics, aes(x = date, y = unemploy)) +
  geom_line()


# 상자 그림
# 구동방식(drv)에 따른 고속도로 연비(hwy)의 분포를 상자 그림으로 나타낸다.
ggplot(data = mpg, aes(x = drv, y = hwy)) +
  geom_boxplot()


# ================================================= ⭐️CH 7-1.⭐️ 척도별 기술통계량, 명목척도, 서열척도, 등간척도, 원 그래프, 비율척도, 사분위수 =====================================================
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


# ================ ⭐️CH 7-2.⭐️ 표를 만드는 방법, prop.table(), 교차 테이블, addmargins(), 교차분석, install.packages("gmodels"), CrossTable(), 귀무가설, 대립가설, p-value =====================
data <- read.csv("descriptive.csv", header = T)

# 표를 만드는 방법
head(data)

# 'level' 변수에 대한 빈도수 테이블을 생성
result <- table(data$level)
result

# 생성된 테이블의 비율을 계산하고, 비율을 퍼센트로 변환하여 출력
prop.table(result)
prop.table(result) * 100

# 'level'과 'pass' 변수의 교차 테이블을 생성
table(data$level, data$pass)

# 'level' 변수의 값을 "고졸", "대졸", "대학원졸"로 변경
data$level2 <- factor(data$level, label = c("고졸", "데졸", "대학원졸"))
table(data$level2, data$pass)

# 'pass' 변수의 값을 "실패", "합격"으로 변경
data$pass2 <- ifelse(data$pass == 1, "실패", "합격")
table(data$level2, data$pass2)

# 변경된 변수들의 교차 테이블을 생성
result2 <- table(data$level2, data$pass2)
result2

# 교차 테이블에 합계를 추가
addmargins(result2)

# xtabs를 사용하여 교차 테이블을 생성하고 그래프로 표시
result3 <- xtabs(~level2 + pass2, data = data)
result3
plot(result3)

# 생성된 테이블의 비율을 계산하고 전체 합계를 추가
prop.table(result3)
prop.table(result3) * 100
addmargins(prop.table(result3))


# 교차분석
data <- read.csv("cleanDescriptive.csv", header = T, fileEncoding = "CP949", encoding = "UTF-8")
head(data)

# 'level2'와 'pass2' 변수를 추출하여 새로운 데이터 프레임 'result'를 생성
x <- data$level2
y <- data$pass2

result <- data.frame(Level = x, Pass = y)
dim(result)
table(result)

# gmodels 패키지를 설치하고 로드
install.packages("gmodels")
library(gmodels)

# CrossTable 함수를 사용하여 교차 테이블을 생성하고 카이제곱 통계를 포함하여 출력
CrossTable(x, y)
CrossTable(x, y, chisq = TRUE)


# 귀무가설 : 부모의 학력 수준과 자녀의 대학 진학 여부는 관련이 없다.
# 대립가설 : 부모의 학력 수준과 자녀의 대학 진학 여부는 관련이 있다.
# p-value이 0.05보다 작으면 귀무가설을 기각

# ================================================================================================================================================================================
