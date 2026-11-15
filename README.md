# riddere

A brigada padrão de agentes do Leonardo para o Claude Code. Cada agente faz um tipo de trabalho e usa
o modelo certo para ele: o Opus planeja e os modelos mais baratos fazem o trabalho repetitivo. Um chef
não descasca cenouras.

## Como funciona

- Só o **arquiteto** é instalado globalmente (`~/.claude/agents/`).
- Em cada projeto, o arquiteto baixa a versão mais nova deste repositório, lê o projeto e **propõe**
  quais agentes e skills usar, já adaptados (comandos, caminhos e regras reais do projeto). Ele só
  cria os arquivos em `.claude/agents/` e `.claude/skills/` depois do seu ok.
- Depois disso ele planeja as features e distribui as tarefas entre os agentes do projeto.
- Se um agente melhorar num projeto de um jeito útil para todos, o arquiteto sugere trazer a
  melhoria de volta para cá, por PR.

## Estrutura

```
global/
    arquiteto.md                agente global (Opus)
    skills/plan-feature/        skill do arquiteto
templates/
    agents/                     modelos dos agentes de projeto, com placeholders {{...}}
    skills/                     skills de cada agente (cada uma pertence a um agente)
docs/brigade-rules.md           regras que toda brigada segue
install.sh                      instala o arquiteto em ~/.claude
```

## Agentes

| Agente | Modelo | Faz | Skill |
|---|---|---|---|
| arquiteto (global) | opus | monta a brigada, planeja features | plan-feature |
| dev | sonnet | implementa tarefas | implementation-discipline |
| ui-ux | sonnet | telas, componentes, design system | design-system-compliance |
| banco | sonnet | schema, migrações | migration-safety |
| algoritmo | sonnet | recomendação, ranking, pipelines | algorithm-validation |
| devops | sonnet | GitHub Actions, deploy | ci-workflows |
| revisor | sonnet | revisa diff (bugs + segurança), só lê | security-review |
| testes | haiku → sonnet | escreve e roda testes | test-writing |
| requisitos | haiku | confere critérios de aceitação | acceptance-check |
| docs | haiku | README, docs, changelog | docs-writing |
| git | haiku | branches, commits, PRs | commit-and-pr |

Para projetos web, o arquiteto também pode propor o plugin recomendado `modern-web-guidance`
(guias de web moderna do Google Chrome; usado por dev, ui-ux e revisor). Detalhes em
[docs/brigade-rules.md](docs/brigade-rules.md), seção 9.

O `testes` roda no Haiku. Se ele responder `ESCALATE`, a conversa principal o chama de novo com o
modelo `sonnet`.

## Instalação

```bash
gh repo clone leonardocnl/riddere ~/riddere
~/riddere/install.sh
```

Depois, dentro de um projeto, no Claude Code:

```
Use o arquiteto para montar a brigada deste projeto a partir do riddere.
```

## Regras

Veja [docs/brigade-rules.md](docs/brigade-rules.md). Em resumo: os agentes não tomam decisões de
gosto, produto ou prioridade sozinhos, não inventam nada que não exista no código, não pedem capturas
de tela, e commits e PRs saem só em nome do Leonardo.
