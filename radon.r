library(PET)   # function 'radon', 'iradon'
library(EMD)   # matrix 'lena'
data(lena)

image2 <- function(m, ...) image(t(m[nrow(m):1,]), col=gray(0:100/100), ...)

radon.do <- function( img=lena, png=FALSE ){
    r  <- radon( img )
    ir <- iradon( r$rData, 500, 500 )

    if( png ) png( file="radon.png", width=640*3, height=640 )
    par( mfrow=c(1,3) )
    image(img, col=gray(0:100/100))
    image2(r$rData, xlab="p", ylab="theta")
    image(ir$irData, col=gray(0:100/100))
    if( png ) dev.off()
}
