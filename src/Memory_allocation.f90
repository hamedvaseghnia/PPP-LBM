module memory_allocation
    use variables
    implicit none

contains

    subroutine allocate_arrays
    use variables
        allocate(u(xmax,ymax))
        allocate(v(xmax,ymax))
        allocate(up(xmax,ymax))
        allocate(vp(xmax,ymax))
        allocate(dxy(xmax,ymax))
        allocate(uxy(xmax,ymax))
        allocate(usqr(xmax,ymax))
        allocate(vu(xmax,ymax))
        allocate(vv(xmax,ymax))
        allocate(vor(xmax,ymax))
        allocate(s(xmax,ymax))
        allocate(f_scx(xmax,ymax))
        allocate(f_scy(xmax,ymax))
        allocate(p(xmax,ymax))
        allocate(wall(xmax,ymax))
        

        allocate(fin(0:8,xmax,ymax))
        allocate(feq(0:8,xmax,ymax))
        allocate(fout(0:8,xmax,ymax))

    end subroutine allocate_arrays

    subroutine deallocate_arrays

        if (allocated(u)) deallocate(u)
        if (allocated(v)) deallocate(v)
        if (allocated(dxy)) deallocate(dxy)
        if (allocated(uxy)) deallocate(uxy)
        if (allocated(usqr)) deallocate(usqr)
        if (allocated(vu)) deallocate(vu)
        if (allocated(vv)) deallocate(vv)
        if (allocated(vor)) deallocate(vor)
        if (allocated(s)) deallocate(s)
        if (allocated(f_scx)) deallocate(f_scx)
        if (allocated(f_scy)) deallocate(f_scy)
        if (allocated(p)) deallocate(p)
    

        if (allocated(fin)) deallocate(fin)
        if (allocated(feq)) deallocate(feq)
        if (allocated(fout)) deallocate(fout)
    end subroutine deallocate_arrays

end module memory_allocation


