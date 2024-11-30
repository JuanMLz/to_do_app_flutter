# **To-Do App**  

Este projeto é um aplicativo de gerenciamento de tarefas desenvolvido em **Flutter**, integrado ao **Firebase** (Firestore e Authentication). O objetivo principal é oferecer uma experiência de usuário agradável e intuitiva, aplicando os conceitos de usabilidade aprendidos na Unidade Curricular (UC) de **Usabilidade, Desenvolvimento Web, Mobile e Jogos**, lecionada pelo Prof. Montanha e Profa. Stella.

---

## **📋 Objetivo do Projeto**  

O objetivo do **To-Do App** é proporcionar uma interface funcional e amigável para o usuário organizar suas tarefas diárias. As principais funcionalidades incluem:  
- Adicionar novas tarefas com título, subtítulo e imagem associada.  
- Marcar tarefas como concluídas.  
- Editar ou excluir tarefas existentes.  
- Utilizar persistência de dados na nuvem com o Firestore.

Este projeto visa aplicar os princípios de usabilidade e boas práticas de desenvolvimento mobile, explorando a integração com backend em tempo real.

---

## **🎮 Funcionalidades do App**  

1. **Cadastro de Usuário**:  
   - Os usuários podem se registrar usando email, com armazenamento dos dados no Firestore.

2. **Criação de Tarefas**:  
   - Adicionar tarefas com informações como título, subtítulo, imagem associada e horário de criação.

3. **Visualização de Tarefas**:  
   - As tarefas são exibidas em uma interface intuitiva, organizadas por status (concluídas ou pendentes).

4. **Atualização de Tarefas**:  
   - Editar título, subtítulo, imagem, e atualizar o status (pendente/concluído) de cada tarefa.

5. **Exclusão de Tarefas**:  
   - Remover tarefas da lista, com atualização imediata no banco de dados.

---

## **📦 Estrutura do Projeto**  

### **Pasta `/lib`**  

| Arquivo                         | Função                                                                                  |
|----------------------------------|-----------------------------------------------------------------------------------------|
| `main.dart`                      | Arquivo principal que inicia o app.                                                     |
| `firestore_datasource.dart`      | Classe responsável por toda a comunicação com o Firebase Firestore.                     |
| `notes_model.dart`               | Model de dados para representar uma tarefa.                                             |
| `ui/`                            | Contém widgets da interface do usuário.                                                 |

---

## **📂 Arquivo `firestore_datasource.dart`**  

A classe `FirestoreDatasource` gerencia as operações de CRUD no Firestore:

### Principais Métodos:

- `createUser(String email)`: Cria um novo usuário no Firestore.
- `addNote(String subtitle, String title, int image)`: Adiciona uma nova tarefa ao Firestore.
- `getNotes(AsyncSnapshot snapshot)`: Converte os dados do Firestore para objetos `Note`.
- `stream(bool isDone)`: Fornece um `Stream` de tarefas em tempo real, filtradas por status.
- `updateNoteStatus(String uuid, bool isDon)`: Atualiza o status de uma tarefa (concluída ou não).
- `updateNote(String uuid, int image, String title, String subtitle)`: Edita as informações da tarefa.
- `deleteNote(String uuid)`: Exclui uma tarefa do Firestore.

---

## **🔥 Tecnologias Utilizadas**  

- **Flutter**: Framework para desenvolvimento mobile.  
- **Dart**: Linguagem de programação utilizada no Flutter.  
- **Firebase Firestore**: Banco de dados em tempo real para armazenamento das tarefas.  
- **Firebase Authentication**: Gerenciamento de autenticação de usuários.

---

## **📱 Experiência de Usuário (UX)**  

O projeto foi desenvolvido com foco na usabilidade, aplicando os seguintes princípios:  

1. **Visibilidade do estado do sistema**:  
   - O usuário é informado sobre ações como criação, atualização e exclusão de tarefas.

2. **Controle e liberdade do usuário**:  
   - O usuário pode editar ou excluir qualquer tarefa adicionada.

3. **Consistência e padrões**:  
   - A interface segue padrões de design consistentes para garantir familiaridade.

4. **Prevenção de erros**:  
   - O sistema evita ações que possam causar erros críticos, como a tentativa de salvar uma tarefa sem título.

5. **Estética e design minimalista**:  
   - O layout foi projetado para ser limpo, funcional e esteticamente agradável.

---

## **🔧 Configuração e Execução do Projeto**  

### Pré-requisitos  

1. Flutter SDK (https://flutter.dev/docs/get-started/install)  
2. Firebase configurado no projeto (Android/iOS)  

### Instalação  

1. Clone o repositório:  

   ```bash
   git clone https://github.com/seu-usuario/to-do-app.git
   cd to-do-app

## Agradecimentos
Este trabalho foi desenvolvido para a disciplina de **Usabilidade, Desenvolvimento Web, Mobile e Jogos**, lecionada pelo professor Montanha. A equipe de desenvolvimento foi composta por:

- Juan Moraes Lopes – RA: 12523219000
- Luiz Henrique Fernandes do Carmo – RA: 323118606
- Gabriel Gaia do Amaral – RA: 822229852
- Bruno Almeida Vilela – RA: 323124929
