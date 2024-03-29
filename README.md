# [DEPRECATED] Community Engagement Score

:warning: This repository was moved to https://github.com/Photrek/Community-Governance/tree/main/CES_MVP :warning:

# Todo
- [ ] Try https://duckdb.org/2022/10/12/modern-data-stack-in-a-box.html


# Setup
* Install DuckDB `brew install duckdb`
* To dynamically explore the data run `make db` and write queries
* To generate a report for the data in the `data` folder run `make report`

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

# Square Root Voting Formula:

$\text{Average Grade} = \frac{\sum (\sqrt{\text{tokens}_i} \times \text{grade}_i)}{\sum \sqrt{\text{tokens}_i}}$

Where:
* $tokens_i$: Number of tokens held by user $i$.
* $grade_i$: Grade assigned by user $i$
