subroutine grava_dados(n,x,y,arq)
    implicit none
    integer, intent(in) :: N
    integer, intent(in) :: x(N),y(N)
    character(len=*)::arq
    integer:: i, fu
    open (action='write', file=arq, newunit=fu, status='replace')
    do i = 1, N
        write (fu, *) x(i),y(i)
    end do
    close(fu)
end subroutine grava_dados
subroutine plota_resultados(arq)
    character(len=*)::arq
    call execute_command_line('gnuplot -p ' // arq)
end subroutine plota_resultados
program analise_media
    implicit none
    integer::i
    character(len=*), parameter :: OUT_FILE = 'data_medias.txt' ! Output file.
    character(len=*), parameter :: PLT_FILE = 'plot_medias.plt' ! Gnuplot file.
    real::operacoes=0
    integer,parameter::N=1000
    integer::x(N)
    integer::y(N)
    do i=1,N
        operacoes = operacoes + (i-1)
        x(i) = i
        y(i) = operacoes
    end do
    call grava_dados(N,x,y,OUT_FILE)
    call plota_resultados(PLT_FILE)
    print *, 'operacoes totais',operacoes
end program analise_media
