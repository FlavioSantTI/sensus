# Sensus - Diagnóstico de Sensações e Perspectivas

**Sistema de mapeamento emocional e triagem de perspectivas para Bertuol Odontologia**

Sensus é uma ferramenta de coleta e análise de percepções emocionais dos pacientes, desenvolvida para tablets de recepção e dashboard administrativo.

## 📋 Sobre o Sensus

Este sistema é composto por **duas funcionalidades principais**:

### 1. **Formulário de Diagnóstico** (`index.html`)
Interface para tablets da recepção onde os pacientes respondem 15 perguntas focadas em mapear sensações, medos, expectativas e perspectivas sobre seu tratamento.

### 2. **Dashboard Administrativo** (`admin.html`)  
Painel exclusivo para dentistas e administradores visualizarem perfis emocionais, filtrarem e gerenciarem as sensações coletadas.

---

## 🚀 Como Executar

```bash
# Instalar dependências (se necessário)
npm install

# Iniciar servidor de desenvolvimento
npm run dev
```

O sistema estará disponível em:
- **Formulário do Paciente**: http://localhost:5173/
- **Dashboard Admin**: http://localhost:5173/admin.html

---

## 👥 Formulário de Diagnóstico (Pacientes)

### Acesso
`http://localhost:5173/`

### Funcionalidades
- ✅ 15 perguntas focadas em mapear sensações e perspectivas emocionais
- ✅ Tipos de pergunta: texto, textarea, múltipla escolha
- ✅ Barra de progresso visual
- ✅ Validação de respostas
- ✅ Design responsivo para tablets 10"
- ✅ Cores da marca Bertuol (#2BBEC3 e #ECC236)
- ✅ Salvamento automático no Supabase

### Fluxo
1. Tela de boas-vindas
2. 15 perguntas sequenciais
3. Envio para Supabase com:
   - `paciente_nome`
   - `unidade`
   - `respostas` (objeto JSON)
   - `fluxo_origem`: "Tablet Recepção"
   - `lido_pelo_dentista`: false
4. Tela de agradecimento

---

## 🔐 Dashboard Admin

### Acesso
`http://localhost:5173/admin.html`

### Funcionalidades
- ✅ **Listagem completa** de todos os perfis emocionais
- ✅ **Estatísticas** em tempo real (Total, Não Lidos, Lidos)
- ✅ **Filtro por unidade** odontológica
- ✅ **Destaque visual** para registros não lidos (borda amarela)
- ✅ **Modal de visualização** com todas as 15 perguntas e respostas
- ✅ **Marcar como lido** - atualiza `lido_pelo_dentista = true`
- ✅ **Botão refresh** para atualizar dados
- ✅ **Design responsivo** (mobile, tablet, desktop)

### Fluxo de Uso
1. Abrir `admin.html` no navegador
2. Ver lista de registros ordenados por data (mais recentes primeiro)
3. Filtrar por unidade específica (opcional)
4. Clicar em um card para ver respostas completas
5. Marcar como "Lido" após revisar

### Interface Visual
- **Header turquesa** com logo e estatísticas
- **Cards brancos** com sombra suave
- **Borda amarela** (#ECC236) nos registros novos
- **Badge "Novo"** para não lidos
- **Botões turquesa** (#2BBEC3) para ações

---

## 🗄️ Estrutura de Dados (Supabase)

### Tabela: `public.anamnese_humanizada`

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | serial | ID único (auto-incremento) |
| `created_at` | timestamptz | Data/hora do registro |
| `paciente_nome` | text | Nome do paciente |
| `unidade` | text | Unidade odontológica |
| `respostas` | jsonb | Objeto com respostas {1: "resposta 1", 2: "resposta 2", ...} |
| `fluxo_origem` | text | Origem ("Tablet Recepção") |
| `lido_pelo_dentista` | boolean | Status de leitura (default: false) |

---

## ⚙️ Configuração do Supabase

O arquivo `index.html` e `admin.html` já estão configurados com:

```javascript
const SUPABASE_URL = 'https://xdxdafpzfojvbugalqns.supabase.co'
const SUPABASE_ANON_KEY = 'eyJhbG...' // Chave já configurada
```

### Políticas RLS (Row Level Security)
Certifique-se de que a tabela `anamnese_humanizada` permite:
- **INSERT** público (para tablets)
- **SELECT/UPDATE** público ou com autenticação (para admin)

---

## 🎨 Identidade Visual

### Cores Bertuol
- **Turquesa**: `#2BBEC3` - Botões, header, ações primárias
- **Amarelo**: `#ECC236` - Destaques, opções selecionadas, alertas

### Tipografia
- **Títulos**: Poppins (via Google Fonts)
- **Corpo**: Inter (via Google Fonts)

### Efeitos
- Hover com elevação (`translateY(-2px)`)
- Sombras suaves
- Transições de 0.3s

---

## 📁 Estrutura do Projeto

```
anamnesehumanizada/
├── index.html          # Formulário do paciente (tablet)
├── admin.html          # Dashboard administrativo
├── public/             # Assets (logos, ícones)
│   ├── logo-bertuol.png
│   └── logo-icon.png
├── package.json        # Configuração Vite
└── README.md           # Este arquivo
```

---

## 🔄 Workflow Completo

1. **Paciente chega na recepção**
2. **Recepcionista entrega tablet** com `index.html` aberto
3. **Paciente compartilha** sensações através de 15 perguntas
4. **Dados salvos** no Supabase automaticamente
5. **Dentista acessa** `admin.html`
6. **Visualiza** respostas completas
7. **Marca como lido** após revisar
8. **Atendimento personalizado** baseado no perfil emocional

---

## 🚀 Deploy (Produção)

### URL de Homologação/Produção
```
Formulário: https://sensus.flaviosantiago.com.br/
Dashboard:  https://sensus.flaviosantiago.com.br/admin.html
```

### Opção 1: Servidor Estático
```bash
npm run build
# Upload da pasta dist/ para servidor web (Apache, Nginx, etc.)
```

### Opção 2: Vercel/Netlify
```bash
# Fazer deploy do projeto completo
# Admin estará em: https://sensus.flaviosantiago.com.br/admin.html
```

---

## 📞 Suporte

- Sistema desenvolvido para Bertuol Odontologia
- Framework: Vite + Vanilla JS
- Database: Supabase (PostgreSQL)
- UI: Tailwind CSS via CDN

---

## 📝 Notas Importantes

- ⚠️ **Segurança**: Em produção, implemente autenticação para `admin.html`
- 📱 **Tablets**: Configurar para abrir `index.html` em modo kiosk
- 🔄 **Atualização**: Botão manual no admin, ou implementar Supabase Realtime
- 💾 **Backup**: Dados salvos no Supabase (backup automático)
