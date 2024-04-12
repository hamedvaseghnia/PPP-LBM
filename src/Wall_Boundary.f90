module wall_boundary
  use variables
  implicit none

contains

  subroutine bounceback
  use variables
  implicit none

!$omp parallel do private(i,x,y)
do y=1,ymax
do x=1,xmax
  do i=0,8
      if (wall(x,y) .eq.1) then
         fout(i,x,y)=fin(opposite(i),x,y)!
     end if
  end do
end do
end do
!$omp end parallel do
  end subroutine bounceback

end module wall_boundary


