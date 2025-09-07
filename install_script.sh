#!/bin/bash
ERROR="***** Opção inválida! Use S para sim e N para não. *****"
ARRAY=()
echo "***** Script de instalação de pacotes (feito por: Murilo Lima) *****"
echo


function_ask() {
	local NAME=$1
	while true; do
		echo "***** Instalar o pacote $NAME (S/N)? *****"
		read INPUT

		if [ "$INPUT" = "S" ]; then
			echo "OK"
			ARRAY+=("$NAME")
			break
		elif [ "$INPUT" = "N" ]; then
			echo "OK"
			break
		else
			echo "$ERROR"
		fi
	done
}

while true; do
	echo "***** Deseja atualizar os programas instalados (S/N)? *****"
	read INPUT
	if [ "$INPUT" = "S" ]; then
		echo "OK"
		sudo apt update && sudo apt upgrade -y
		break
	elif [ "$INPUT" = "N" ]; then
		echo "OK"
		break
	else
		echo "$ERROR"
	fi
done

function_ask discord
function_ask kdenlive
function_ask virtualbox
function_ask vim
function_ask neofetch
function_ask cmatrix
function_ask sl
function_ask ninvaders
function_ask htop
function_ask btop
function_ask git
function_ask dosbox
function_ask obs-studio
function_ask tmux
function_ask geany


for PACOTE in "${ARRAY[@]}"; do
	sudo apt install "$PACOTE" -y
done

echo
echo "***** Tudo pronto! Script feito por: Murilo Lima *****"
