!!
program allocatable
	implicit none
	
	integer, allocatable :: array1(:)
	integer, allocatable :: array2(:,:)
	
	allocate(array1(10))
	allocate(array2(10,10))
	
	! ...
	
	deallocate(array1)
	deallocate(array2)
end program allocatable
!!
program string
	implicit none
	
	character(len=4) :: first_name
	character(len=5) :: last_name
	character(10) :: full_name
	
	first_name = 'John'
	last_name = 'Smith'
	
	! String concatenation
	full_name = first_name//' '//last_name
	
	print *, full_name

end program string
!!
program allocatable_string
    implicit none
    
    character(:), allocatable :: first_name
    character(:), allocatable :: last_name
    
    ! Explicit allocation statement
    allocate(character(4) :: first_name)
    first_name = 'John'
    
    ! Allocation on assignment
    last_name = 'Smith'
    
    print *, first_name//' '//last_name
    
end program allocatable_string
!!
program string_array
	implicit none
	character(len=10), dimension(2) :: keys, vals
	keys = [character(len=10) :: "user", "dbname"]
	vals = [character(len=10) :: "ben", "motivation"]
	call show(keys, vals)
	contains ! região de subrotinas
	subroutine show(akeys, avals)
		character(len=*), intent(in) :: akeys(:), avals(:)
		integer                      :: i
		do i = 1, size(akeys)
		print *, trim(akeys(i)), ": ", trim(avals(i))
		end do
	end subroutine show
end program string_array
!!
program goto_
    ! observe que o compilador vai reclamar 
    integer::fui
    assign 10 to fui
    print *,'Vamos saltar um print' ! desvio incondicional
    goto fui(10) ! aqui podemos ter uma lista de númeroa a serem usados em outros saltos
    print *,'Este print não será executado'
 10 continue
    print *, 'Cheguei ao meu Destino'
    print *, 'fui'
end program goto_

!!
program impares
    integer:: i
    do i = 1, 10, 2
        print *, i  ! Print odd numbers
    end do
end program impares
!!

program while
    integer :: i
    i = 1
    do while (i < 11)
        print *, i
        i = i + 1
    end do
end program while

!!

program exit_
    integer :: i
    do i = 1, 100
        if (i > 10) then
            exit  ! Stop printing numbers
        end if
        print *, i
    end do
end program exit_

!!
program cycle_
    integer :: i
    do i = 1, 10
        if (mod(i, 2) == 0) then
            cycle  ! Don't print even numbers
        end if
        print *, i
    end do
end program cycle_

!!

program aninhado
    integer :: i, j
    outer_loop: do i = 1, 10
        inner_loop: do j = 1, 10
            if ((j + i) > 10) then  ! Print only pairs of i and j that add up to 10
                cycle outer_loop  ! Go to the next iteration of the outer loop
            end if
            print *, 'I=', i, ' J=', j, ' Sum=', j + i
        end do inner_loop
    end do outer_loop
end program aninhado

!!
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

!!
! Print matrix A to screen
subroutine print_matrix(n,m,A)
    implicit none
    integer, intent(in) :: n
    integer, intent(in) :: m
    real, intent(in) :: A(n, m)
  
    integer :: i
  
    do i = 1, n
      print *, A(i, 1:m)
    end do
  
end subroutine print_matrix

program call_sub
    implicit none  
    real :: mat(10, 20)
    mat(:,:) = 0.0
    call print_matrix(10, 20, mat)
end program call_sub
!!
!!
! L2 Norm of a vector
function vector_norm(n,vec) result(norm)
    implicit none
    integer, intent(in) :: n
    real, intent(in) :: vec(n)
    real :: norm
    norm = sqrt(sum(vec**2)) 
end function vector_norm

program run_fcn
    implicit none
    real :: v(9)
    real :: vector_norm
    v(:) = 9
    print *, 'Vector norm = ', vector_norm(9,v)
end program run_fcn
!!

















