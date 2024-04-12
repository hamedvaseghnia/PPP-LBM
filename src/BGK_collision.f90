module bgk_collision
    use variables
    implicit none

contains

    subroutine bgk
    use variables
    implicit none
  !$omp parallel do private(i,x,y)
do y=1,ymax
    do x=1,xmax
    !$omp simd  
        do i=0,8
            fout(i,x,y)=fin(i,x,y)-omega*(fin(i,x,y)-feq(i,x,y)) 
        end do
    end do
end do
!$omp end parallel do
    end subroutine bgk

end module bgk_collision


