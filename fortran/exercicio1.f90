program exercicio
    implicit none
    integer, dimension(2,3) :: vetor1
    integer, dimension(3,2) :: vetor2
    ! read(*,*) vetor1
    vetor1(1) = [1,2,3]
    vetor1(2) = [4,5,6]
    print *, 'vetor: ', vetor1
end program exercicio