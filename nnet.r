library( nnet )

## nnet for regression
nn <- nnet( x=xs, y=ys, size=num.hid, linout=TRUE, rang=4/sqrt( 6/(dim.in + dim.out) ), trace=FALSE, MaxNWts=2000, maxit=1000 )
predict( nn, newdata=x.test, type="raw" )

## extract weights as matrices
.nnet2w <- function( nn ){
    dim.in  <- nn$n[1]
    num.hid <- nn$n[2]
    dim.out <- nn$n[3]
    vector  <- nn$wts ## [i0->h1, i1->h1, ..., i.dim.in->h.num.hid;
                      ##  h0->o1, h1->o1, ..., h.num.hid->o.dim.out]
    idx.mid <- (dim.in + 1) * num.hid

    ## [ num.hid (dim.in+1) ]
    ## the bias (+b) is assigned for the first column
    in2hid  <- matrix( vector[1:idx.mid], ncol=dim.in+1, byrow=TRUE )
    ## [ dim.out (num.hid+1) ]
    ## the bias (+b) is assigned for the first column
    hid2out <- matrix( vector[-(1:idx.mid)], ncol=num.hid+1, byrow=TRUE )

    return( list( in2hid=in2hid, hid2out=hid2out ) )
}

# inverse of .nnet2w
# > m <- .nnet2w( nn )
# > w <- .w2nnet( m$in2hid, m$hid2out )
# then, nn$wts == w.
.w2nnet <- function( mat1, mat2 ){
    dim.in  <- ncol(mat1) - 1
    num.hid <- ncol(mat2) - 1
    dim.out <- nrow(mat2)

    return( c(as.numeric(t(mat1)),as.numeric(t(mat2))) )
}
