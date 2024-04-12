module external_force
    use variables
    implicit none

contains

    subroutine forceterm
    use variables
    implicit none

!$omp parallel do private(x,y,yt,xr,yb,xl)
do y=1,ymax
    do x=1,xmax
       
        
yt = mod(y,ymax) + 1 
xr = mod(x,xmax) + 1 
yb = ymax - mod(ymax + 1 - y, ymax) 
xl = xmax - mod(xmax + 1 - x, xmax) 

f_scx(x,y)=-g*s(x,y)*(w(1)*s(xl,y)-w(3)*s(xr,y)+w(5)*s(xl,yb)-w(6)*s(xr,yb)-w(7)*s(xr,yt)+w(8)*s(xl,yt)) 
f_scy(x,y)=-g*s(x,y)*(w(2)*s(x,yb)-w(4)*s(x,yt)+w(5)*s(xl,yb)+w(6)*s(xr,yb)-w(7)*s(xr,yt)-w(8)*s(xl,yt))

up(x,y)=u(x,y)+f_scx(x,y)*tau/dxy(x,y)
vp(x,y)=v(x,y)+f_scy(x,y)*tau/dxy(x,y)

    end do
end do
!$omp end parallel do
    end subroutine forceterm

end module external_force


