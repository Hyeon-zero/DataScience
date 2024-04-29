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

