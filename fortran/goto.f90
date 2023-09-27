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