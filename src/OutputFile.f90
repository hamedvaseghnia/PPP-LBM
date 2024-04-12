module outputfile
    use variables
    implicit none

contains

    subroutine write_output
    use variables
    implicit none


  
 ! !====== individual vtk file each step 
  write(myfile, "(a,i4.4,a)") "vtk/output.", step/100, ".vtk"
  open(1,file=myfile)

    
    write(1,"(2a)")"# vtk datafile version 3.0"
    write(1,"(2a)")"fluid_state"
    write(1,"(2a)")"ascii"
    write(1,"(2a)")"dataset rectilinear_grid"
    write(1,"(a,3x,i4,1x,i4,1x,i3)") "dimensions", xmax, ymax, 1
    write(1,"(a,a,i4,a,a)")"x_coordinates"," ",xmax," ","float"
    do x=0,xmax-1
    write(1,"(i5)",advance='no') x+1   
    end do
    write(1,"(a,/)") 
    write(1,"(a,a,i4,a,a)")"y_coordinates"," ",ymax," ","float"
    do y=0,ymax-1
    write(1,"(i5)",advance='no')y+1    
    end do
    write(1,"(a,/)") 
    write(1,"(a,a,i4,a,a)")"z_coordinates"," ",1," ","float"
    write(1,"(i3)")0
    write(1,"(a,a,i9)")"point_data"," ",xmax*ymax
    write(1,"(2a)")"scalars density float 1"
    write(1,"(2a)")"lookup_table default"
    do y=1,ymax
        do x=1,xmax
            write(1,*)dxy(x,y)
        end do
    end do
    
write(1,*)"vectors velocity float"
    do y=1,ymax
        do x=1,xmax
            write(1,*)u(x,y),v(x,y),0
        end do
    end do

            

    end subroutine write_output

end module outputfile


