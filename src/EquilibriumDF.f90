module equilibriumdf
    use variables
    implicit none

contains

    subroutine equilibrium
    use variables
    implicit none

!$omp parallel do private(i,x,y)
do y=1,ymax
    do x=1,xmax
        usqr(x,y) = up(x,y) * up(x,y) + vp(x,y) * vp(x,y)
        p(x,y)=cs*cs*dxy(x,y)+(cs*cs*g/2)*s(x,y)*s(x,y)           ! here pressure calculations starts
        !$omp simd
        do i=0,8
        uxy(x,y)=up(x,y)*e(i,0)+vp(x,y)*e(i,1)
        feq(i,x,y)= w(i)*dxy(x,y)*(1.0d0+3.0d0*uxy(x,y)+4.5d0*uxy(x,y)*uxy(x,y)-1.5d0*usqr(x,y))
        
        end do
    end do
end do
!$omp end parallel do
    end subroutine equilibrium

end module equilibriumdf


