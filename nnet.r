library( nnet )

## nnet for regression
nn <- nnet( x=xs, y=ys, size=num.hid, linout=TRUE, rang=4/sqrt( 6/(dim.in + dim.out) ), trace=FALSE, MaxNWts=2000, maxit=1000 )
predict( nn, newdata=x.test, type="raw" )
