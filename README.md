# Task App

Este é um aplicativo Flutter simples que exibe uma lista de tarefas com a funcionalidade de busca. O aplicativo consome dados do endpoint [JSONPlaceholder](https://jsonplaceholder.typicode.com/todos) e os exibe em uma interface limpa e responsiva.

## Funcionalidades
- Carregamento de uma lista de tarefas a partir de uma API.
- Campo de busca para filtrar tarefas em tempo real.
- Indicador visual de conclusão de tarefas.

## Pré-requisitos
- [Flutter](https://flutter.dev/docs/get-started/install) (versão 3.x ou superior)
- [Dart SDK](https://dart.dev/get-dart)
- Conexão com a internet

## Instalação

1. **Clone este repositório**
   git clone https://github.com/Lincoln-Araujo/tarefas_flutter
   cd task-app

2. **Instale as dependências**
    flutter pub get

3. **Execute o app**
    flutter run

## Configuração de API
- O app faz uma solicitação GET ao endpoint https://jsonplaceholder.typicode.com/todos para carregar as tarefas ao iniciar.

## Funcionalidades
- Busca em tempo real: O campo de texto permite a filtragem da lista conforme o texto inserido.
- Visualização de tarefas: Exibe o título da tarefa e um ícone indicando se foi concluída ou não.

## Tecnologias usadas

- Flutter: Framework principal para desenvolvimento do app
- HTTP package: Para fazer a solicitação à API
- FutureBuilder: Para exibir dados assíncronos na interface