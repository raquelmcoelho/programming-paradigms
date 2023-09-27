
function media_aritmetica(n,vec) result(media)
    implicit none
    integer, intent(in) :: n
    real, intent(in) :: vec(N)
    real :: media
    media = sum(vec)/n 
end function media_aritmetica

function media_recursiva(mediaAnterior,medidaAtual,n) result(media)
    implicit none
    integer::n
    real::mediaAnterior,medidaAtual,media
    media = (n-1.0)/n * mediaAnterior + 1.0/n * medidaAtual
end function media_recursiva

function filtro_media(mediaAnterior,medidaAtual,alpha) result(media)
    implicit none
    real::mediaAnterior,medidaAtual,alpha,media
    media = alpha * mediaAnterior + (1.0 - alpha) * medidaAtual
end function filtro_media

function grava_dados(n,vec,medias_moveis,medias_filtro,arq) result(resultado)
    implicit none
    integer, intent(in) :: N
    real, intent(in) :: vec(20)
    real, intent(in) :: medias_moveis(20),medias_filtro(20)
    character(len=*)::arq
    integer::resultado, i, fu
    resultado = 0 
    open (action='write', file=arq, newunit=fu, status='replace')
    do i = 1, N
        write (fu, *) i,vec(i),medias_moveis(i),medias_filtro(i)
    end do
    close(fu)
    resultado = 1
end function grava_dados

subroutine plota_resultados(arq)
    character(len=*)::arq
    call execute_command_line('gnuplot -p ' // arq)
end subroutine plota_resultados

program kalman
    ! Neste programa vamos estudar filtros
    implicit none
    character(len=*), parameter :: OUT_FILE = 'data_k.txt' ! Output file.
    character(len=*), parameter :: PLT_FILE = 'plot_k.plt' ! Gnuplot file.
    integer,          parameter :: N        = 20         ! Number of values.
    real:: dados(N), estimadores(N),medias_filtro(N)
    real :: rand_num,media_anterior,novo_dado,media_anterior_filtro
    integer:: i
    real::media_aritmetica, media_recursiva, filtro_media
    integer::grava_dados
    real::alpha=1
    media_anterior = 0
    media_anterior_filtro = 0
    do i=1,n 
        call random_number(rand_num)
        novo_dado = 10 * rand_num
        dados(i) = novo_dado
        estimadores(i) = media_recursiva(media_anterior,novo_dado,i)
        medias_filtro(i) = filtro_media(media_anterior_filtro,novo_dado,alpha) 
        media_anterior = estimadores(i)
        media_anterior_filtro = medias_filtro(i)
    end do    
    if (grava_dados(N,dados,estimadores,medias_filtro,OUT_FILE) .ne. 0) then
        print *,'Arquivo gravado com sucesso'
    end if
    call plota_resultados(PLT_FILE)
    print *, "Concluído com sucesso"
end program kalman
