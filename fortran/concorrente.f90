program concorrente
    real, parameter :: pi = 3.14159265
    integer, parameter :: n = 10
    real :: result_sin(n)
    real :: total = 0
    integer :: i

    do concurrent (i = 1:n)  ! Careful, the syntax is slightly different
        result_sin(i) = sin(i * pi/4.)
    end do
    print *, 'resultados de cada loop', result_sin
    do i=1,n
        total = total + result_sin(i)
    end do
    print * ,'Soma = ', total
end program concorrente