module macroscopic
    use variables
    implicit none

contains

    subroutine macros
    use variables
    implicit none
!$omp parallel do private(i,x,y)
do y = 1,ymax 
 do x = 1,xmax 
dxy(x,y) =fin(0,x,y) + fin(1,x,y) + fin(2,x,y) + fin(3,x,y) + fin(4,x,y) + fin(5,x,y) + fin(6,x,y) + fin(7,x,y) + fin(8,x,y) 
u(x,y) = (fin(1,x,y) - fin(3,x,y) + fin(5,x,y) - fin(6,x,y) - fin(7,x,y) + fin(8,x,y)) / dxy(x,y) 
v(x,y) = (fin(2,x,y) - fin(4,x,y) + fin(5,x,y) + fin(6,x,y) - fin(7,x,y) - fin(8,x,y)) / dxy(x,y)
s(x,y)=1.d0-dexp(-dxy(x,y))
 end do
end do
!$omp end parallel do
    end subroutine macros

end module macroscopic


