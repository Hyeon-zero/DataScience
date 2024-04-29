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

