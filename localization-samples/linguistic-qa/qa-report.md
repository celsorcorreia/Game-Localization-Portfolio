# Emberwake — Linguistic QA Report

**Language pair:** English → Brazilian Portuguese  
**Build:** 0.9.14  
**Platform:** Windows 11  
**Test resolutions:** 1920 × 1080 and 1280 × 720  
**Input methods:** Keyboard and mouse; controller prompts reviewed where applicable  
**Content status:** Fictional portfolio sample  
**Reviewer:** Celso Ricardo Correia

---

## Executive summary

This report documents an in-context linguistic QA pass for *Emberwake*, a fictional fantasy action RPG created for portfolio evaluation.

The review covered menus, tutorials, combat objectives, inventory, item tooltips, quests, codex entries, settings, character information, and gameplay notifications.

A total of **20 issues** were identified:

- **5 Critical**
- **9 Major**
- **6 Minor**

The most serious findings involved protected variables, markup tags, and translations that changed gameplay mechanics. These errors could prevent runtime values from appearing, expose raw code to players, or communicate an incorrect effect.

---

## QA objectives

1. Confirm that the Brazilian Portuguese text preserves the English meaning.
2. Verify that gameplay mechanics remain unchanged.
3. Check terminology against the approved glossary.
4. Validate variables, tags, and controller or keyboard prompts.
5. Identify text truncation and UI overflow.
6. Review grammar, punctuation, capitalization, and consistency.
7. Produce actionable reports with reproduction steps and suggested corrections.
8. Retest critical fixes before approval.

---

## Test environment

| Field | Value |
|---|---|
| Product | Emberwake |
| Genre | Fantasy action RPG |
| Build | 0.9.14 |
| Platform | Windows 11 |
| Resolutions | 1920 × 1080; 1280 × 720 |
| Source language | English |
| Target language | Brazilian Portuguese |
| Review type | In-context LQA and functional linguistic review |
| Content ownership | Original fictional sample |

---

## Review workflow

### 1. Preparation

- Review the source strings and approved terminology.
- Identify protected variables, tags, and input prompts.
- Confirm the target locale and style rules.
- Record test environment and build information.

### 2. In-context review

- Navigate through menus and playable scenes.
- Compare source and localized strings.
- Test narrow resolutions and fixed-width components.
- Trigger combat, rewards, inventory warnings, tutorials, and quest states.

### 3. Issue classification

Each finding receives:

- unique bug ID;
- category;
- severity;
- screen or location;
- source string;
- current localization;
- issue description;
- suggested correction;
- reproduction steps;
- expected and actual results;
- fix status.

### 4. Fix verification

- Reopen the affected screen.
- Confirm the intended correction.
- Recheck related strings and terminology.
- Retest critical variables, tags, and mechanics.

---

## Severity model

| Severity | Definition | Example |
|---|---|---|
| Critical | Breaks functionality, exposes code, removes essential information, or changes gameplay mechanics. | Broken variable, invalid markup tag, incorrect numerical effect. |
| Major | Creates substantial misunderstanding, contextual failure, inconsistent terminology, or severe UI presentation problems. | Resume → Currículo, clipped warning, inconsistent class name. |
| Minor | Does not block comprehension but reduces linguistic quality or style consistency. | Agreement, punctuation, or capitalization issue. |

---

## Category distribution

| Category | Issues |
|---|---:|
| Capitalization | 2 |
| Consistency | 2 |
| Context | 2 |
| Grammar | 2 |
| Mechanics | 2 |
| Punctuation | 2 |
| Tags | 2 |
| Terminology | 2 |
| UI overflow | 2 |
| Variables | 2 |

---

## Results

| Metric | Result |
|---|---:|
| Total issues | 20 |
| Critical | 5 |
| Major | 9 |
| Minor | 6 |
| Fixed | 15 |
| Pending retest | 5 |

---

## Selected issue reports

### LQA-001 — Terminology

**Severity:** Major  
**Status:** Fixed  
**Screen:** Inventory

**Source**

> Health Potion

**Current PT-BR**

> Poção de Saúde

**Issue**

The item name does not follow the approved glossary term used elsewhere in the build.

**Suggested correction**

> Poção de Cura

**Steps to reproduce**

Open Inventory > Consumables and highlight the first healing item.

**Expected result**

The approved term Poção de Cura is used consistently.

**Actual result**

The item is displayed as Poção de Saúde.

---
### LQA-003 — Grammar

**Severity:** Minor  
**Status:** Fixed  
**Screen:** Loot Notification

**Source**

> You found 1 coin.

**Current PT-BR**

> Você encontrou 1 moedas.

**Issue**

The noun does not agree with the singular numeral.

**Suggested correction**

> Você encontrou 1 moeda.

**Steps to reproduce**

Collect a single coin from the tutorial chest.

**Expected result**

Singular agreement is used with 1.

**Actual result**

The plural form moedas is displayed.

---
### LQA-005 — Context

**Severity:** Major  
**Status:** Fixed  
**Screen:** Pause Menu

**Source**

> Resume

**Current PT-BR**

> Currículo

**Issue**

The translation uses the noun meaning professional résumé instead of the gameplay action.

**Suggested correction**

> Continuar

**Steps to reproduce**

Pause the game during any playable sequence.

**Expected result**

The button resumes gameplay.

**Actual result**

The button is labelled Currículo.

---
### LQA-007 — UI overflow

**Severity:** Major  
**Status:** Fixed  
**Screen:** Settings

**Source**

> Accessibility

**Current PT-BR**

> Configurações de Acessibilidade

**Issue**

The localized label exceeds the fixed-width tab and overlaps the adjacent icon.

**Suggested correction**

> Acessibilidade

**Steps to reproduce**

Open Settings at 1280 × 720 and select the final tab.

**Expected result**

The label fits without clipping or overlap.

**Actual result**

The string overlaps the tab icon.

---
### LQA-009 — Variables

**Severity:** Critical  
**Status:** Retest  
**Screen:** Quest Reward

**Source**

> You received {amount} coins.

**Current PT-BR**

> Você recebeu {quantidade} moedas.

**Issue**

The protected variable name was translated, so the runtime value is not injected.

**Suggested correction**

> Você recebeu {amount} moedas.

**Steps to reproduce**

Complete the quest A Debt Repaid and view the reward notification.

**Expected result**

The numerical reward replaces {amount}.

**Actual result**

The literal text {quantidade} appears on screen.

---
### LQA-011 — Tags

**Severity:** Critical  
**Status:** Retest  
**Screen:** Tutorial

**Source**

> <color=#FFCC00>Hold [E]</color> to interact.

**Current PT-BR**

> <cor=#FFCC00>Segure [E]</cor> para interagir.

**Issue**

The markup tags were translated and are no longer recognised by the UI parser.

**Suggested correction**

> <color=#FFCC00>Segure [E]</color> para interagir.

**Steps to reproduce**

Approach the first tutorial lever.

**Expected result**

The interaction command is highlighted in yellow.

**Actual result**

Raw markup is displayed in the tutorial text.

---
### LQA-013 — Capitalization

**Severity:** Minor  
**Status:** Fixed  
**Screen:** Quest Notification

**Source**

> New Quest

**Current PT-BR**

> nova missão

**Issue**

The notification heading does not follow the approved sentence-case pattern.

**Suggested correction**

> Nova missão

**Steps to reproduce**

Accept the quest The Silent Bell.

**Expected result**

The first word of the heading is capitalised.

**Actual result**

The heading begins with a lowercase letter.

---
### LQA-015 — Mechanics

**Severity:** Critical  
**Status:** Retest  
**Screen:** Skill Description

**Source**

> Deal 25% more damage while below 30% health.

**Current PT-BR**

> Cause 25% do dano enquanto estiver com menos de 30% de vida.

**Issue**

The localization changes a +25% damage bonus into dealing only 25% of normal damage.

**Suggested correction**

> Cause 25% a mais de dano enquanto estiver com menos de 30% dos Pontos de Vida.

**Steps to reproduce**

Open Skills > Berserker > Final Stand.

**Expected result**

The description communicates a 25% increase.

**Actual result**

The description implies damage is reduced to 25%.

---
### LQA-017 — Punctuation

**Severity:** Minor  
**Status:** Fixed  
**Screen:** Quest Summary

**Source**

> Reward: 500 XP

**Current PT-BR**

> Recompensa 500 XP

**Issue**

The colon separating the label and value is missing.

**Suggested correction**

> Recompensa: 500 XP

**Steps to reproduce**

Open the completed quest summary for The Silent Bell.

**Expected result**

The label and value are separated by a colon.

**Actual result**

The punctuation is missing.

---
### LQA-019 — Consistency

**Severity:** Major  
**Status:** Fixed  
**Screen:** World / Tutorial

**Source**

> Save Point

**Current PT-BR**

> Ponto de Salvamento / Ponto de Save

**Issue**

Two different translations are used for the same gameplay object.

**Suggested correction**

> Ponto de Salvamento

**Steps to reproduce**

Compare the first tutorial prompt with the World Map legend.

**Expected result**

The same approved term is used in both locations.

**Actual result**

Two variants are displayed.

---


## Complete issue database

The complete structured issue log is available in:

- [`issue-log.csv`](issue-log.csv)

The CSV includes all 20 findings with severity, status, source text, current localization, correction, reproduction steps, expected result, and actual result.

---

## QA checklist

### Linguistic review

- [x] Meaning preserved
- [x] Grammar and agreement reviewed
- [x] Punctuation reviewed
- [x] Capitalization reviewed
- [x] Context checked in the running build
- [x] Terminology compared with the glossary
- [x] Repeated strings checked for consistency

### Functional linguistic review

- [x] Variables preserved
- [x] Tags and markup preserved
- [x] Input prompts retained
- [x] Numbers and percentages reviewed
- [x] Mechanical effects compared with the source
- [x] UI overflow tested at two resolutions
- [x] Critical fixes marked for retest

### Reporting quality

- [x] Unique IDs used
- [x] Severity assigned
- [x] Steps to reproduce included
- [x] Expected and actual results separated
- [x] Suggested corrections supplied
- [x] Status recorded

---

## Outcome

This QA pass demonstrates that linguistic testing is not limited to spelling and grammar. High-impact localization issues may affect runtime functionality, player decisions, combat rules, interface readability, and the credibility of the final product.

The final deliverables provide:

- a traceable issue database;
- actionable correction proposals;
- a severity model;
- fix and retest status;
- evidence of in-context review;
- coverage across ten LQA categories.

---

## Next steps

1. Retest all Critical fixes in the next build.
2. Run glossary consistency checks across the complete string database.
3. Test additional resolutions and accessibility scaling.
4. Review controller-specific prompts.
5. Verify pluralisation with zero, one, and multiple values.
6. Add screenshots or neutral interface mock-ups to selected reports.
7. Perform a final regression pass before release approval.
