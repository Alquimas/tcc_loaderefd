# loaderEFD: Sistema de Ingestão de Escrituração Fiscal Digital baseado em regras declarativas

Este repositório contém os arquivos fontes em LaTeX e os artefatos da minha monografia de Trabalho de Conclusão de Curso (TCC) em Ciência da Computação pela Universidade Federal da Paraíba (UFPB), defendida com sucesso em agosto de 2026.

## Resumo

O processamento e a auditoria de documentos da Escrituração Fiscal
Digital de ICMS e IPI (EFD ICMS IPI) enfrentam gargalos operacionais no setor
público e privado. A estrutura em texto plano hierárquico desses arquivos, a
alta volatilidade dos leiautes
legais do SPED e a ausência de uma especificação oficial legível por máquina
tornam os sistemas tradicionais baseados em código fixo inflexíveis e
propensos a falhas. Para solucionar esse problema, o presente
trabalho desenvolve um *pipeline* de ingestão dinâmico e orientado 
metadados.
A arquitetura elaborada extrai as regras de negócio da documentação fiscal e
as
estrutura em arquivos de configuração JSON, desacoplando o processamento
do código-fonte. A solução é composta por um Orquestrador que distribui
a carga de trabalho em lotes e gerencia a execução paralela de trabalhadores
dinâmicos em memória, responsáveis por interpretar a hierarquia do texto e
realizar a persistência estruturada em um banco de dados relacional
*PostgreSQL*. A validação empírica atestou zero perda informacional
e a manutenção da integridade referencial por meio do teste de reconstrução
reversa dos dados originais. A solução também demonstrou alta resiliência
no tratamento de arquivos corrompidos e garantiu a atomicidade das operações
no banco. Conclui-se que a abordagem por metadados confere alta flexibilidade
às mudanças da legislação tributária, e as limitações encontradas oferecem
largo espaço para desenvolvimento e expansões futuras da ferramenta.

## Estrutura do Repositório

- `/src` Arquivos fonte em LaTeX
- `/slides` Apresentação utilizada na defesa
- `pdfs/main.pdf` Versão final dos slides compilada para visualização.
- `pdfs/tcc.pdf` Versão final da monografia compilada para leitura direta.

## Dependências

O script `compile.sh` executa o `latexmk` dentro da imagem Docker
`texlive/texlive:latest`. Portanto, não é necessário instalar uma distribuição
LaTeX localmente.

Instale o Docker:

- [Docker Engine](https://docs.docker.com/engine/install/) em Linux;
- [Docker Desktop](https://docs.docker.com/desktop/) em Windows ou macOS.

Em seguida, obtenha a imagem Docker do TeX Live:

```bash
docker pull texlive/texlive:latest
```

No Linux, o usuário precisa ter permissão para executar comandos Docker. Caso
necessário, adicione-o ao grupo `docker` e reinicie a sessão:

```bash
sudo usermod -aG docker "$USER"
```

## Compilação

A partir da raiz do repositório, execute:

```bash
chmod +x compile.sh
./compile.sh
```

O comando padrão compila a monografia e os slides. Também é possível compilar
apenas um dos projetos:

```bash
./compile.sh tcc
./compile.sh slides
```

Os PDFs finais são gerados em `pdfs/`, enquanto os arquivos auxiliares de
compilação ficam em `output/`.
