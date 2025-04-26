# Configuração de Conexão SSH com GitHub

### 1. Gere uma chave SSH (se não tiver)
Para criar uma chave SSH na máquina e estabelecer uma conexão confiável com o Git, execute o seguinte comando:

```bash
ssh-keygen -t ed25519 -C "seu_email@exemplo.com"
```

### 2. Adicione sua chave SSH ao agente SSH
Agora, você precisa garantir que o agente SSH esteja rodando e que a chave seja carregada. Execute os seguintes comandos no terminal:

```bash
eval "$(ssh-agent -s)"
```

Em seguida, adicione sua chave SSH:

```bash
ssh-add ~/.ssh/id_ed25519
```

### 3. Adicionar a chave pública ao GitHub
Agora, você precisa pegar a chave pública (não a privada!) e adicioná-la no GitHub.

- **Copiar a chave pública:**

```bash
cat ~/.ssh/id_ed25519.pub
```

Isso vai exibir a chave. Copie tudo, incluindo `ssh-ed25519` no início.

- **Adicionar no GitHub:**
    - Vá para **GitHub SSH keys**.
    - Clique em **New SSH key**.
    - Dê um título (ex: "Chave para servidor").
    - Cole a chave pública copiada no campo "Key".
    - Clique em **Add SSH key**.

### 4. Testar a conexão SSH com o GitHub
Agora, teste se a chave SSH está funcionando corretamente:

```bash
ssh -T git@github.com
```

Se tudo estiver certo, você verá a seguinte mensagem:

```
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

### 5. Alterar o repositório para usar SSH
Agora que a chave SSH está configurada, você precisa mudar a URL do seu repositório para SSH, caso ainda esteja configurado para usar HTTPS. No terminal, dentro do repositório, execute:

```bash
git remote set-url origin git@github.com:usuario/repositorio.git
```

---

## Usando `git ls-tree`
Para listar arquivos específicos em um repositório remoto, você pode usar o comando `git ls-tree`, que mostra o conteúdo de uma árvore de commit (por exemplo, o último commit na branch principal).

Exemplo para listar os arquivos na branch principal (geralmente `main` ou `master`):

```bash
git ls-tree -r origin/main
```

Aqui:
- `-r` significa listar recursivamente.
- `origin/main` refere-se à branch remota principal. Se a sua branch principal tiver outro nome (como `master`), substitua `main` por `master`.
```
