# ⚽ FIFA World Cup 2026 Analytics Dashboard

> Projeto de Business Intelligence desenvolvido para análise dos dados da Copa do Mundo FIFA 2026, utilizando um pipeline completo de ETL com Python, SQLite, SQL e Power BI.

---

## 📖 Sobre o Projeto

Este projeto tem como objetivo construir um pipeline completo de dados para análise da Copa do Mundo FIFA 2026.

Os dados são extraídos através da API do Kaggle, armazenados em um banco SQLite, tratados utilizando SQL e posteriormente disponibilizados para o Power BI por meio de tabelas analíticas.

O projeto foi desenvolvido seguindo conceitos de ETL, modelagem dimensional e boas práticas de Business Intelligence.

---

## 🎯 Objetivos

- Automatizar a obtenção dos dados do Kaggle
- Armazenar os dados em um banco SQLite
- Aplicar transformações utilizando SQL
- Construir Views analíticas para consumo do Power BI
- Desenvolver um dashboard interativo para análise da competição

---

## 🛠 Tecnologias Utilizadas

| Tecnologia | Finalidade |
|------------|------------|
| Python | Extração, carga e exportação dos dados |
| Kaggle API | Download automático do dataset |
| SQLite | Banco de dados |
| SQL | Transformação e criação das Views |
| Pandas | Manipulação dos dados |
| Power BI | Construção do Dashboard |
| Git & GitHub | Versionamento |

---

# 📂 Estrutura do Projeto

```text
Projeto_ETL_Kaggle/

│
├── data/
│   ├── raw/
│   ├── database/
│   └── output/
│
├── scripts/
│   ├── 01_download_dataset.py
│   ├── 02_import_sqlite.py
│   ├── 03_create_views.py
│   └── 04_export_csv.py
│
├── sql/
│   └── views.sql
│
├── dashboard/
│   └── Dashboard.pbix
│
├── images/
│
└── README.md
```

---

# 🔄 Pipeline de Dados

O projeto segue o seguinte fluxo:

```text
          Kaggle API
               │
               ▼
      Download via Python
               │
               ▼
          Arquivos CSV
               │
               ▼
      Importação SQLite
               │
               ▼
      Views Analíticas SQL
               │
               ▼
 Exportação das Views (CSV)
               │
               ▼
          Power BI
```

---

# 🗄 Modelagem dos Dados

Foi adotada uma estrutura semelhante a um modelo dimensional, separando tabelas de dimensão das tabelas fato.

### Dimensões

Cartoes
Gols
Jogadores
Resultados
Selecoes

### Fatos

- Dashboard Equipes
- Man of the Match


📊 Indicadores Desenvolvidos

O dashboard apresenta indicadores como:

- ⚽ Total de Gols
- 🟨 Total de Cartões por Seleção
- 🟨 Cartões Amarelos
- 🟥 Cartões Vermelhos
- 🏆 Vitórias
- 🤝 Empates
- ❌ Derrotas
- 📈 Saldo de Gols
- ⚽ 5 Equipes com mais gols marcados
- 🥅 5 Equipes com mais gols sofridos
- ⭐ Ranking de jogadores com mais prêmios "Superior of the Match"

---

# 📈 Dashboard

![Dashboard](Imagem/image.png)

O dashboard foi desenvolvido no Power BI com foco em análise esportiva.

Principais recursos:

- KPIs da competição
- Estatísticas ofensivas
- Estatísticas defensivas
- Análise disciplinar (cartões)
- Ranking de jogadores Premiados (Superior of the Match)
- Filtros interativos

# ⚙ Processo de ETL

O processo de ETL desenvolvido contempla:

1. Download automático dos dados via API do Kaggle
2. Armazenamento dos arquivos CSV
3. Importação para SQLite
4. Criação das Views SQL
5. Exportação dos dados tratados
6. Consumo pelo Power BI

---

# 🚀 Como executar o projeto

## 1 - Clonar o repositório

```bash
git clone https://github.com/SEU_USUARIO/Projeto_ETL_Kaggle.git
```

## 2 - Instalar as dependências

```bash
pip install -r requirements.txt
```

## 3 - Configurar o Token da API do Kaggle

Definir a variável de ambiente:

```
KAGGLE_API_TOKEN
```

## 4 - Executar os scripts

Na ordem:

```
01_download_dataset.py

02_import_sqlite.py

03_create_views.py

04_export_csv.py
```

Após a exportação, basta atualizar o Power BI.

---

# 📌 Próximas Melhorias

- Automatização completa do pipeline
- Atualização automática dos dados
- Agendamento das execuções
- Publicação do Dashboard no Power BI Service
- Inclusão de novos indicadores estatísticos

---

# 👨‍💻 Autor

Malcon Donovan Oliveira 

Projeto desenvolvido para estudos de Engenharia de Dados, SQL, Python e Business Intelligence.

LinkedIn: (https://www.linkedin.com/in/malcon-donovan/)

GitHub: https://github.com/Malcon-d

---

# ⭐ Considerações

Este projeto foi desenvolvido com o objetivo de consolidar conhecimentos em:

- Python
- SQL
- SQLite
- ETL
- Modelagem de Dados
- Power BI

Todo o pipeline foi construído buscando reproduzir um fluxo de trabalho próximo ao utilizado em projetos reais de Business Intelligence.
