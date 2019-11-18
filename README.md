## Setup 

Este projeto usa o homebrew como dependency manager. Caso você não tenha o homebrew, baixe em: https://brew.sh

Após a instalação do Homebrew, execute os seguintes comandos

1 - `brew bundle`

2 - `carthage bootstrap --platform iOS --toolchain com.apple.dt.toolchain.Swift_3_0`

É isto! O projeto agora está pronto para ser executado.

## Testes

Por conta dos testes de snapshot, os testes devem ser executados no simulador do iPhone 11 para evitar divergências na gerações das imagens
