# Projeto SPIRA-BM - USP

O aplicativo de coleta de dados faz parte do projeto Spira-BM (Projeto Temático FAPESP) que tem como objetivo dar suporte à identificação de problemas respiratórios por meio de análise de áudio (voz do paciente) usando técnicas de Inteligência Artificial.​

## 🚀 Começando

Essas instruções permitirão que você obtenha uma cópia do projeto em operação na sua máquina local para fins de desenvolvimento e teste.

### 📋 Pré-requisitos

Android Studio 2023.2.1 (Iguana) ou mais recente. O download pode ser feito [neste link](https://developer.android.com/studio/install)
Flutter na versão 3.19.6. O download pode ser feito [neste link](https://docs.flutter.dev/get-started/install)

### 🔧 Instalação

 - Clonar o projeto localmente

### 🏗️ Build

```shell
  
  # Entre na pasta criada
  - cd frontend
  
  # Instale as dependências
  - flutter pub get

  # Ative a ferramenta Flutter Gen, caso não esteja ativada
  - dart pub global activate flutter_gen
  
  # Se necessário, gerar os arquivos referentes ao banco de dados e assets
  - dart run build_runner build
  - fluttergen -c pubspec.yaml

  # Se necessário trocar o ícone do app, substitua a imagem assets/app_icon/icon.jpg e execute
  - flutter pub get
  - dart run flutter_launcher_icons
  
  # Inicie a aplicação
  - flutter run
```

### 🚀 Deploy

```shell
  
  # Entre na pasta criada
  - cd frontend
  
  # Instale as dependências
  - flutter pub get
  
  # Se necessário, gerar os arquivos referentes ao banco de dados e assets
  - dart run build_runner build

  # Gere o build da aplicação
  - flutter build apk
```
Isso gerará um arquivo ".apk". 
Fazer o upload do arquivo ".apk" no App Distribution no projeto SPIRA no Firebase

## ⚙️ Executando os testes

```shell
  
  # Execute o comando para execução dos testes
  - flutter test
```

## 📦 Desenvolvimento

## 🛠️ Construído com

* [Flutter](https://flutter.dev/) - O framework mobile usado

## 🖇️ Colaborando

* **Allan Furukita** - *Frontend* - [Dev](https://git.monitoralabs.com/allan.furukita)

* **Lucas Trigueiro** - *Backend* - [Dev](https://git.monitoralabs.com/lucas.trigueiro)

* **Duilio Santiago** - *Backend* - [Dev](https://git.monitoralabs.com/duilio.santiago)

## 📌 Versão

Nós usamos [GitLab](https://git.monitoralabs.com//) 

[Repositório FrontEnd](https://git.monitoralabs.com/usp-fapesp/frontend) 

[Repositório Backend](https://git.monitoralabs.com/usp-fapesp/backend)

## ✒️ Autores

* **Allan Furukita** - *Frontend* - [Dev](https://git.monitoralabs.com/allan.furukita)

* **Lucas Trigueiro** - *Backend* - [Dev](https://git.monitoralabs.com/lucas.trigueiro)

* **Duilio Santiago** - *Backend* - [Dev](https://git.monitoralabs.com/duilio.santiago)

## 📄 Licença

Este projeto está sob a licença (sua licença) - veja o arquivo [LICENSE.md](https://git.monitoralabs.com/usp-fapesp) para detalhes.

### 🆕 Ultima revisão em 12/09/2024

