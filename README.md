# Community Engagement Score

# Setup
* Install DuckDB `brew install duckdb`
* Start DuckDB with tables loaded `make db`
* Query data

# System Overview

<div align="center" style="background-color:white">
    <img src="docs/images/system_overview.png" alt="System context overview">
    <p>
        System context overview - <a target="__blank" href="docs/images/system_overview.drawio">source</a>
    </p>
</div>

# Data Model
Data model using [Crow's_foot_notation](https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model#Crow's_foot_notation)
```mermaid
---
title: Community Engagement Highlevel Model
---
erDiagram
    USER ||--|| WALLET : owns
    USER ||--|| PROPOSAL : rates
```

* **users.csv** (collections) - user in the voting portal
* **wallet-links.csv** - [join table] between user and wallet
* **answers.csv** (voting-portal) - [join table] contains answers (ratings) of questions
* **questions.csv** - proposal names


```mermaid
---
title: Community Engagement Model
---
erDiagram

    USER {
        int collection_id PK
        bigint balance
        decimal AGIX
    }

    ANSWER {
        int collection_id FK
        int question_id FK
        varchar answer
        bigint total_balance
        decimal AGIX
    }

    QUESTION {
        int question_id PK
        varchar proposal
    }

    WALLET_LINK {
        varchar address PK
        int collection_id FK
        bigint balance
        decimal AGIX
    }

    WALLET ||--|{ WALLET_LINK : belongs_to
    USER ||--|{ WALLET_LINK : owns
    USER ||--|{ ANSWER : gives
    QUESTION  ||--|{ ANSWER : belongs_to
```
