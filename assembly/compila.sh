
nome_saida=${1%.*}
nome_comp=${1%.*}_.o
nasm -f elf $1 -o $nome_comp
ld -m elf_i386 -s -o $nome_saida $nome_comp
./$nome_saida
echo "Retorno = " $?
rm $nome_comp
# rm $nome_saida
echo "Programa executado com sucesso"
