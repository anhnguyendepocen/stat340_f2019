# R functions used:

# c(): create a vector
# cbind(): bind vectors together as columns of a matrix
# t(): transpose of a matrix
# %*% matrix multiplication
# solve(): find the inverse of a matrix
# matrix(): directly create a matrix from specified values.  By default, will be a matrix with 1 column.

# create X
X <- cbind(
  c(1, 1, 1),
  c(0, 1, 1)
)
X

# X'X
t(X) %*% X

# (X'X)^{-1}
solve(t(X) %*% X)

# suppose y_1 = 1, y_2 = 2, y_3 = 3
y <- matrix(c(1, 2, 3))

# beta hat computed using matrices
beta_hat <- solve(t(X) %*% X) %*% t(X) %*% y
beta_hat

# compare to our answer from last class
y[1, 1]
0.5 * (y[2, 1] + y[3, 1]) - y[1, 1]

# hat matrix computed using matrices
H <- X %*% solve(t(X) %*% X) %*% t(X)
H

# y hat computed two equivalent ways: first as X beta hat, and second as H y
y_hat1 <- X %*% beta_hat
y_hat2 <- H %*% y
y_hat1
y_hat2

# the residuals are the difference between y and y hat
resids <- y - y_hat1
resids

# remember that all of this came from minimizing the sum of squared residuals!
# we can find RSS like this:
sum(resids^2)
