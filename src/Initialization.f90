module initialization
    use variables
    implicit none

contains

    subroutine initiate
    use variables
    implicit none

      do y=1,ymax
      do x=1,xmax
      dxy(x,y)=0.15d0
      end do
      end do

 !$omp parallel do private(i,x,y)
do y=1,ymax
    do x=1,xmax/2
        dxy(x,y)=5.d-1*(1.9d0+0.15d0)-5.d-1*(1.9d0-0.15d0) &
        *dtanh( 2.d0*(dsqrt( (x-xmax*2.d-1)*(x-xmax*2.d-1) &
        +(y-ymax*5.d-1)*(y-ymax*5.d-1))-100)/5.d0 )
        u(x,y)=0.d0
        v(x,y)=0.d0
    end do
end do
!$omp end parallel do

 !$omp parallel do private(i,x,y)
do y=1,ymax
    do x=1,xmax/2
if (dxy(x,y).gt.0.2d0) then
        u(x,y)=-0.1d0
        v(x,y)=0.d0
        end if
    end do
end do
!$omp end parallel do

 !$omp parallel do private(i,x,y)
do y=1,ymax
    do x=xmax/2,xmax
        dxy(x,y)=5.d-1*(1.9d0+0.15d0)-5.d-1*(1.9d0-0.15d0) &
        *dtanh( 2.d0*(dsqrt( (x-xmax*8.d-1)*(x-xmax*8.d-1) &
        +(y-ymax*6.d-1)*(y-ymax*6.d-1))-100)/5.d0 )
        u(x,y)=0.d0
        v(x,y)=0.d0
    end do
end do
!$omp end parallel do

 !$omp parallel do private(i,x,y)
do y=1,ymax
    do x=xmax/2,xmax
if (dxy(x,y).gt.0.2d0) then
        u(x,y)=0.1d0
        v(x,y)=0.d0
        end if
    end do
end do
!$omp end parallel do

!!$omp parallel do private(i,x,y)
!do y=80,120
!    do x=80,120
!      dxy(x,y)=19.d-1
!      u(x,y)=0.1d0
!    end do
!end do
!!$omp end parallel do


!$omp parallel do private(i,x,y)
do y=1,ymax
    do x=1,xmax
        s(x,y)=1.d0-dexp(-dxy(x,y))
    end do
end do
!$omp end parallel do

open(20,file="intital.plt")
write(20,*)"variables= x,y,dxy"
write(20,*)"zone i=" ,xmax , "j=",ymax

!$omp parallel do private(i,x,y)
do y=1,ymax
    do x=1,xmax
       write(20,*)x,y,dxy(x,y)
        end do
end do  
!$omp end parallel do

!================
!relaxation time
!================

nu=1.d-3
tau=1.d0

omega=1.d0/tau

!===============
!init density
!===============
!$omp parallel do private(i,x,y)
do y=1,ymax
    do x=1,xmax
        
        usqr = u(x,y) * u(x,y) + v(x,y) * v(x,y)
        !$omp simd
        do i=0,8
        uxy(x,y)=u(x,y)*e(i,0)+v(x,y)*e(i,1)
        fin(i,x,y)= w(i)*dxy(x,y)*(1.0d0+3.0d0*uxy(x,y)+4.5d0*uxy(x,y)*uxy(x,y)-1.5d0*usqr(x,y))
        feq(i,x,y)=fin(i,x,y)
        end do
    end do
    
end do
!$omp end parallel do

    end subroutine initiate

end module initialization


