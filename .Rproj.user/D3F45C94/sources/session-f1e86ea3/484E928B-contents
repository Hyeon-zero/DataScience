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

