module geometry
    use variables
    implicit none

contains

    subroutine wall_coodrinates
    use variables
    implicit none

do y=1,ymax
 do x=1,xmax
  wall(x,y)=0
  end do
end do




    end subroutine wall_coodrinates

end module geometry


