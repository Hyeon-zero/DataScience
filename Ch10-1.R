# 서울의 음식점 현황 분석
# 분석 파일 불러오기
library(dplyr)
library(ggplot2)

foodshop <- read.csv("6110000_서울특별시_07_24_04_P_일반음식점.csv", na ="", fileEncoding = "euc-kr") 

str(foodshop)

# 분석 변수 추출, 변수 이름 변경
foodshop <- foodshop %>% 
  rename(open_date = 인허가일자,
         status = 상세영업상태명, close_date = 폐업일자,
         name = 사업장명, 
         type = 업태구분명,
         address = 소재지전체주소) %>%
  select("name", "type", "status", "open_date", "close_date", "address")

str(foodshop)

# 변수의 결측치 확인
summary(is.na(foodshop))

# 변수를 분석에 맞게 정리하고 파생변수 만들기
table(foodshop$type)

foodshop$type <- ifelse(foodshop$type %in% c("까페", "다방", "라이브카페", " 커피숍"), "카페", foodshop$type)
foodshop$type <- ifelse(foodshop$type %in% c("통닭(치킨)", "호프/통닭"), "치 킨", foodshop$type)
foodshop$type <- ifelse(foodshop$type %in% c("일식", "회집", "횟집"), "회집 ", foodshop$type)
foodshop$type <- ifelse(foodshop$type %in% c("경양식", "패밀리레스토랑"), " 레스토랑", foodshop$type)
foodshop$type <- ifelse(foodshop$type %in% c("정종/대포집/소주방"), "소주방 ", foodshop$type)
foodshop$type <- ifelse(foodshop$type %in% c("외국음식전문점(인도,태국등"), "외국음식전문점", foodshop$type)
foodshop$type <- ifelse(foodshop$type %in% c("기타", "193959.1505"), NA, foodshop$type)

table(foodshop$status)

range(foodshop$open_date)
foodshop$open_date <- ifelse(foodshop$open_date < 19480815 | foodshop$open_date > 20201231, NA, foodshop$open_date)
table(is.na(foodshop$open_date))
foodshop$open_year <- substr(foodshop$open_date, 1, 4)

range(foodshop$close_date, na.rm = T)
foodshop$close_date <- ifelse(foodshop$close_date < 19480815 | foodshop$close_date > 20201231, NA, foodshop$close_date)
table(is.na(foodshop$close_date))
foodshop$close_year <- substr(foodshop$close_date, 1, 4)

# 분석 데이터 최종 확인
str(foodshop)
foodshop$open_year <- as.integer(foodshop$open_year)
foodshop$close_year <- as.integer(foodshop$close_year)

# 데이터 분석
# 가장 오래 영업 중인 음식점
foodshop %>%
  filter(!is.na(open_date) & status == "영업") %>% 
  filter(open_date == min(open_date)) %>% 
  select(name, type, open_date, address)

# 주요 업종별로 가장 오래 영업 중인 음식점
foodshop %>%
  filter(!is.na(open_date) & status == "영업") %>%
  filter(type %in% c("분식", "레스토랑", "치킨", "회집", "중국식", "카페", "패스트푸드")) %>% 
  group_by(type) %>%
  filter(open_date == min(open_date)) %>%
  arrange(open_date) %>%
  select(type, name, open_date, address)

# 업종별 개업 비율
foodshop %>%
  filter(!is.na(open_date) & !is.na(type)) %>%
  group_by(type) %>%
  summarise(n = n()) %>%
  mutate(total = sum(n),
         pct = round(n / total * 100, 1)) %>% 
  arrange(desc(n)) %>%
  head(10)

# 영업 중인 음식점의 업종별 비율
foodshop %>%
  filter(!is.na(open_date) & !is.na(type)) %>%
  filter(status == "영업") %>%
  group_by(type) %>%
  summarise(n = n()) %>%
  mutate(total = sum(n),
         pct = round(n / total * 100, 1)) %>% 
  arrange(desc(pct)) %>%
  head(5)

# 개업이 많았던 연도
foodshop %>%
  filter(!is.na(open_date)) %>%
  group_by(open_year) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(5)

# 폐업이 많았던 연도
foodshop %>%
  filter(!is.na(close_date)) %>%
  group_by(close_year) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(5)

# 연도별 폐업 음식점 수 그래프
close_trend <- foodshop %>%
  filter(!is.na(close_date)) %>%
  group_by(close_year) %>%
  summarise(close_n = n())

str(close_trend)

ggplot(data = close_trend, aes(x = close_year, y = close_n)) + geom_col() + xlab("연도") + ylab("폐업수")

