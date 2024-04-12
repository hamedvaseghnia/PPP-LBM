module variables

    double precision,parameter::w(0:8)=[4.d0/9.d0,1.d0/9.d0,1.d0/9.d0, &
    1.d0/9.d0,1.d0/9.d0,1.d0/36.d0,1.d0/36.d0,1.d0/36.d0,1.d0/36.d0] !weight coefficent

    integer :: e_flat(18) = [0,1,0,-1,0,1,-1,-1,1,0,0,1,0,-1,1,1,-1,-1]
    integer, dimension(0:8,0:1) :: e
    integer,parameter::opposite(0:8)=[0,3,4,1,2,7,8,5,6] 

    integer,parameter::xmax=1000
    integer,parameter::ymax=1000
    double precision,parameter::g=-5.d0
    integer::x,y,i,step,xr,xl,yt,yb
    double precision,dimension(:,:),allocatable::u,v,dxy,usqr,uxy,vu,vv,vor,s,f_scx,f_scy,p,wall,up,vp
    double precision,dimension(:,:,:),allocatable::fin,feq,fout
    double precision,parameter::u0=1.d-1
    double precision,parameter::pi=3.1415926535897932
    double precision::tau,nu,omega,dxyw,s_w
    double precision,parameter::cs=1.d0/dsqrt(3.d0)
    double precision::pmin,pmax,dp,dpold
    double precision:: start_time, end_time, total_time
    character*20::myfile
    
    

end module

