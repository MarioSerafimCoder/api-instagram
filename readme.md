# API do Instagram

## Tecnologias
- NodeJS
- ExpressJS
- MySQL

### Recursos
- Usuários
- Posts
- Comentários
- Curtidas

### Estrutura dos Dados

```mermaid
---
config:
  layout: dagre
  theme: neo-dark
  look: classic
---
classDiagram
  Usuario --> Post: OneToMany
  Usuario --> Comentario: OneToMany
  Post --> Comentario: OneToMany
  Post --> Curtida: OneToMany
  Usuario --> Curtida: OneToMany

  class Usuario{
    + id
    + nome
    + nickname
    + bio
    + foto
    + email
    + senha
    + criado_em
    + atualizado_em
  }

  class Post{
    + id
    + usuario_id
    + foto
    + legenda?
    + localização?
    + criado_em
    + atualizado_em?
  }

  class Comentario{
    + id
    + usuario_id
    + post_id
    + conteudo
    + criado_em
  }

  class Curtida{
    + id
    + usuario_id
    + post_id
    + criado_em

  }
  ```