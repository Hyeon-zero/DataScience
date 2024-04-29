# 서울 미세먼지 분석 
# 데이터 전처리
library(readxl)
library(dplyr)
library(ggplot2)

seoulair <- read_excel("서울미세먼지분석_2020.xlsx")

# 변수 이름 변경, 분석 변수 추출
seoulair <- seoulair %>% 
  rename(date = "날짜",
         district = "측정소명",
         pm10 = "미세먼지 PM10(㎍/m3)",
         pm2.5 = "초미세먼지 PM2.5") %>% 
  select(date, district, pm10, pm2.5)

# 변수의 결측지, 이상치 확인하고 처리
table(seoulair$date)
table(seoulair$district)

seoulair <- seoulair %>% 
  filter(date != "전체" & district != "평균")

# 미세먼지(PM10) 및 초미세먼지(PM2.5) 데이터의 요약 통계를 출력
summary(seoulair$pm10)
summary(seoulair$pm2.5)

# 파생변수 만들기
seoulair$month <- substr(seoulair$date, 6, 7)
seoulair$day <- substr(seoulair$date, 9, 10)

# 추출한 월과 일 변수의 데이터 타입 확인 및 숫자형으로 변환
class(seoulair$month)
class(seoulair$day)

seoulair$month <- as.numeric(seoulair$month)
seoulair$day <- as.numeric(seoulair$day)

# 계절 변수 추가: 월 정보를 사용하여 계절을 구분
seoulair$season <- 
  ifelse(seoulair$month %in% c(3, 4, 5), "spring",
         ifelse(seoulair$month %in% c(6, 7, 8), "summer", 
                ifelse(seoulair$month %in% c(9, 10, 11), "autumn", "winter")))

# 분석 데이터 확인
str(seoulair)

# 데이터 분석
# 연간 미세먼지 평균 알아보기
mean(seoulair$pm10, na.rm = T)

# 미세먼지가 가장 심했던 날짜 알아보기
seoulair %>% 
  filter(!is.na(pm10)) %>% 
  filter(pm10 == max(pm10)) %>% 
  select(date, district, pm10)

# 구별 미세먼지 평균 비교
seoulair %>% 
  filter(!is.na(pm10)) %>% 
  group_by(district) %>% 
  summarise(m = mean(pm10)) %>% 
  arrange(m) %>% 
  head(5)

# 계절별 분석
seoulair %>% 
  filter(!is.na(pm10) & !is.na(pm2.5)) %>% 
  group_by(season) %>% 
  summarise(m1 = mean(pm10), 
            m2 = mean(pm2.5)) %>% 
  arrange(m1)

# 미세먼지 추세 그래프로 그리기
ggplot(data = seoulair, aes(x = date, y = pm10)) + geom_line()

# 미세먼지 등급 분석
seoulair %>% 
  filter(!is.na(pm10)) %>% 
  mutate(pm10_grade = ifelse(pm10 <= 30, "good",
                             ifelse(pm10 <= 80, "normal",
                                    ifelse(pm10 <= 150, "bad", "worst")))) %>% 
  group_by(pm10_grade) %>% 
  summarise(n = n()) %>% 
  mutate(total = sum(n),
         pct = round(n / total * 100, 1)) %>% 
  select(pm10_grade, n, pct) %>% 
  arrange(desc(n))

