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

