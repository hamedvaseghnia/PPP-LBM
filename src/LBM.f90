program lbm
    use omp_lib
    use variables
    use memory_allocation
    use initialization
    use bgk_collision
    use streaming
    use macroscopic
    use external_force
    use equilibriumdf
    use geometry
    use wall_boundary
    use outputfile
    implicit none
    
    e = reshape(e_flat, shape(e))

    call allocate_arrays

    start_time = omp_get_wtime()
    print*,"d2q9 multiphase lbm"
    print*,''
    print*,'domain size=','xmax x ymax= ', xmax,'x',ymax
    dpold=0.d0
    !call wall_coodrinates
    print*," "
    print*,"initializing...."
    call initiate
    print*,'initializtion done !'
    


do step=1,14000

    call macros
    call forceterm
    call equilibrium
    call bgk
    call stream
    

    pmin=minval(p(:,:))
    pmax=maxval(p(:,:))
    dp=pmax-pmin

    if (mod(step,100)==0) then
        print*, step,dabs(dp-dpold)
        call write_output

            if (dabs(dp-dpold) .lt. 1.d-80) then 
            exit
            else 
            dpold=dp
            end if      !end if for error

    end if     !end if for steps mod

end do      !iteration end here

    end_time = omp_get_wtime()
    total_time = (end_time - start_time) / 60.0
    print *, "total runtime: ", total_time,'minutes'

end program lbm


 

