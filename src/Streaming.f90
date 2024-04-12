module streaming
    use variables
    implicit none

contains

    subroutine stream
    use variables
    implicit none
!$omp parallel do private(x,y,yt,xr,yb,xl)
do y=1,ymax
    do x=1,xmax
        yt = mod(y,ymax) + 1 
        xr = mod(x,xmax) + 1 
        yb = ymax - mod(ymax + 1 - y, ymax) 
        xl = xmax - mod(xmax + 1 - x, xmax) 
        fin(0,x,y) = fout(0,x,y) 
        fin(1,xl,y) = fout(1,x,y) 
        fin(2,x,yb) = fout(2,x,y) 
        fin(3,xr,y) = fout(3,x,y) 
        fin(4,x,yt) = fout(4,x,y) 
        fin(5,xl,yb) = fout(5,x,y) 
        fin(6,xr,yb) = fout(6,x,y) 
        fin(7,xr,yt) = fout(7,x,y) 
        fin(8,xl,yt) = fout(8,x,y) 
    end do
end do
!$omp end parallel do
    end subroutine stream

end module streaming


