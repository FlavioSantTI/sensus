# Plano de Implementação: Transformação em Sensus

## 📋 Visão Geral

**Objetivo**: Atualizar a identidade do sistema de "Anamnese Humanizada" para "Sensus - Diagnóstico de Sensações e Perspectivas", focando no mapeamento de estados emocionais, medos e expectativas dos pacientes.

**Escopo**: Atualização de nomenclaturas, documentação e interface (UI/UX) sem alterações estruturais no código ou banco de dados.

---

## 🎯 Mudanças de Identidade

### Naming
- **Nome Anterior**: Anamnese Humanizada  
- **Novo Nome**: **Sensus**
- **Subtítulo**: Diagnóstico de Sensações e Perspectivas

### Conceito
- **Anterior**: Coleta de anamnese humanizada
- **Novo**: Mapeamento do estado emocional, medos e expectativas do paciente

### Foco
- Percepção do paciente sobre sua experiência
- Sensações e perspectivas pessoais
- Triagem de percepções emocionais

---

## 📝 Fase 1: Documentação

### 1.1 README.md
**Alterações**:
- [ ] Título principal: "Sensus - Diagnóstico de Sensações e Perspectivas"
- [ ] Subtítulo: "Sistema de mapeamento emocional e triagem de perspectivas"
- [ ] Descrição do formulário: "15 perguntas para mapear sensações e expectativas"
- [ ] Descrição do admin: "Dashboard para visualização de perfis emocionais"
- [ ] Substituir todas as menções a "anamnese" por "diagnóstico de sensações"
- [ ] Adicionar URL de produção: `https://sensus.flaviosantiago.com.br`
- [ ] Manter referência técnica: `public.anamnese_humanizada` (tabela Supabase)

### 1.2 package.json
**Alterações**:
- [ ] `"name": "sensus"`
- [ ] `"description": "Diagnóstico de Sensações e Perspectivas - Bertuol Odontologia"`

---

## 🎨 Fase 2: Interface do Formulário (index.html)

### 2.1 Metadados
- [ ] `<title>` → "Sensus | Diagnóstico de Perspectivas"
- [ ] Meta description → "Sistema de mapeamento emocional - Bertuol Odontologia"

### 2.2 Telas

**Boas-Vindas**:
- [ ] Título: "Bem-vindo(a) ao Sensus"
- [ ] Texto: Atualizar para mencionar "mapeamento de percepções"

**Sucesso**:
- [ ] Atualizar texto: "Suas perspectivas vão nos ajudar..."

---

## 🔐 Fase 3: Dashboard Admin (admin.html)

### 3.1 Header
- [ ] `<title>` → "Dashboard Sensus | Admin"
- [ ] H1: "Dashboard Sensus"
- [ ] Subtítulo: "Diagnóstico de Sensações e Perspectivas"

### 3.2 Botões e Labels
- [ ] "Ver Respostas" → "Ver Perfil Emocional"
- [ ] "Total de Registros" → "Total de Perfis"
- [ ] Botão: "Voltar ao Sensus"

---

## 🗄️ Fase 4: Banco de Dados (SEM ALTERAÇÕES)

**Tabela**: `public.anamnese_humanizada`

- ✅ **NÃO alterar** nome da tabela
- ✅ **NÃO alterar** colunas
- ✅ Manter lógica de parsing do JSONB

---

## 🌐 Fase 5: Deploy

**Domínio**: `sensus.flaviosantiago.com.br`

**Endpoints**:
- Formulário: `https://sensus.flaviosantiago.com.br/`
- Admin: `https://sensus.flaviosantiago.com.br/admin.html`

---

## 🎨 Fase 6: Identidade Visual (MANTER)

- ✅ **Turquesa**: `#2BBEC3` - Ações principais
- ✅ **Amarelo**: `#ECC236` - Destaques
- ✅ Botões arredondados com hover elevation
- ✅ Tipografia: Poppins + Inter

**Nenhuma alteração visual necessária**, apenas textos.

---

## 📦 Checklist de Implementação

### Documentação
- [ ] Atualizar README.md
- [ ] Atualizar package.json

### Interface
- [ ] index.html: metadados e textos
- [ ] admin.html: header e labels

### Testes
- [ ] Testar formulário completo
- [ ] Testar dashboard admin
- [ ] Verificar Supabase

### Deploy
- [ ] Build: `npm run build`
- [ ] Upload para `sensus.flaviosantiago.com.br`

---

## 🚀 Ordem de Execução

1. Documentação (README, package.json)
2. Interface do Formulário (index.html)
3. Dashboard Admin (admin.html)
4. Testes Locais
5. Build e Deploy

---

## ✨ Resultado Esperado

- ✅ Sistema renomeado para "Sensus"
- ✅ Foco em mapeamento emocional
- ✅ Endpoint: sensus.flaviosantiago.com.br
- ✅ Banco de dados intacto
- ✅ Zero breaking changes
