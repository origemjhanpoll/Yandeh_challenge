# Yandeh Challenge

Este repositório contém o projeto "Yandeh Challenge", desenvolvido com Flutter. Siga as instruções abaixo para clonar, instalar dependências e rodar o projeto na sua máquina.

## Requisitos

Antes de rodar o projeto, certifique-se de que você tem o Flutter instalado. Caso não tenha, siga as instruções para instalação no link abaixo:

- [Instalação do Flutter](https://flutter.dev/docs/get-started/install)

## Passos para Rodar o Projeto

### 1. Clonar o Repositório

Clone este repositório na sua máquina local:

```dart
git clone https://github.com/origemjhanpoll/yandeh_challenge.git
```

### 2. Instalar as Dependências

Navegue até o diretório do projeto e instale as dependências:

```dart
cd yandeh_challenge
flutter pub get
```

### 3. Rodar o Projeto

Agora, basta rodar o projeto no seu dispositivo ou emulador:

```dart
flutter run
```

## Estrutura

### Arquitertura

Foi aplicado o **_Clean Architecture_** é uma arquitetura de software que organiza o código-fonte de maneira modular e desacoplada:

```bash
lib/
├── features/
│   ├── Home/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── bloc/
│   │       ├── pages/
│   │       └── widgets/
.   .
```

### Metodologia

Foi aplicado o **_Design Atômico_** uma metodologia de design de interfaces que organiza componentes visuais de forma modular e reutilizável.

```bash
lib/
├── app/
│   ├── shared/ # [Design Atômico] Biblioteca de componentes compartilhados
│   │   ├── atoms/
│   │   ├── molecules/
│   │   ├── organisms/
│   │   └── styles/ # Estilos globais, como temas, cores e etc.
```
