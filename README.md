# GestionPlants – Application WinDev / HFSQL

Application Windows de gestion de production de **plants maraîchers** : variétés, lots semés et commandes clients.
Réalisée avec **WinDev 28 Express** (PC SOFT) et une base **HFSQL Classic**, pour prendre en main l'environnement PC SOFT.

![Fiche lot avec date calculée](screenshots/16-fiche-lot-date-calculee.png)

## En bref

| Élément | Détail |
| --- | --- |
| Outil | WinDev 28 Express (PC SOFT) |
| Langage | WLangage |
| Base de données | HFSQL Classic |
| Fichiers de données | 3 : VARIETE, LOT, COMMANDE |
| Liaisons | 2, avec intégrité référentielle |
| Généré par le RAD | 11 fenêtres, 1 fenêtre interne, 6 états, 1 menu |
| Code métier | Calcul automatique de la date prête à livrer |
| Durée | 1 journée |

## Fonctionnalités

- **Variétés** de plants avec leur durée de culture (Batavia : 35 jours, Black Beauty : 45 jours…).
- **Lots** semés : date de semis, quantité, serre, et **date prête calculée automatiquement**.
- **Commandes clients** rattachées à un lot.
- **Intégrité référentielle** : impossible de supprimer une variété qui a encore des lots.
- **États imprimables** : liste des lots, des commandes, des variétés.
- **FAA** (Fonctionnalités Automatiques de l'Application) : export Excel/Word, tri et filtres sans code.

## Modèle de données

```mermaid
erDiagram
    VARIETE ||--o{ LOT : "est semée en"
    LOT ||--o{ COMMANDE : "fait l'objet de"
    VARIETE {
        id IDVARIETE PK "clé unique"
        texte NomVariete
        texte Espece
        entier DureeCultureJours
    }
    LOT {
        id IDLOT PK "clé unique"
        date DateSemis
        entier Quantite
        texte Serre
        date DatePrete "calculée"
        id IDVARIETE FK "clé reliée"
    }
    COMMANDE {
        id IDCOMMANDE PK "clé unique"
        texte NomClient
        entier QuantiteCommandee
        date DateLivraison
        id IDLOT FK "clé reliée"
    }
```

![Analyse complète](screenshots/07-analyse-complete.png)

## Code WLangage

Fiche LOT, traitement « Sortie de SAI_DateSemis » :

```wlanguage
// Calcule la date prête = date de semis + durée de culture de la variété
HLitRecherchePremier(VARIETE, IDVARIETE, COMBO_VARIETE)
SI HTrouve(VARIETE) ET SAI_DateSemis <> "" ALORS
	SAI_DatePrete = DateVersChaîne(EntierVersDate(DateVersEntier(SAI_DateSemis) + VARIETE.DureeCultureJours), "AAAAMMJJ")
FIN
```

Détail dans [code/FEN_Fiche_LOT_SAI_DateSemis.wl](code/FEN_Fiche_LOT_SAI_DateSemis.wl).

## Tests

| Test | Résultat |
| --- | --- |
| Compilation du projet | « Compilation terminée », aucune erreur bloquante |
| Lot Black Beauty, semis 20/10/2026 | Date prête calculée : 04/12/2026 (+45 jours) |
| Suppression d'une variété qui a un lot | Refusée : « Intégrité non respectée » |

![Intégrité refusée](screenshots/15-integrite-refusee.png)

## Documentation

- [Documentation pas à pas](docs/DOCUMENTATION.md) : installation, construction, tests, problèmes rencontrés.
- [Glossaire et formes complètes](docs/GLOSSAIRE.md) : HFSQL, RAD, FAA, GDS, MLD…
- [Captures d'écran](screenshots/) : 16 étapes du projet.

## Améliorations prévues

- Recalcul de la date prête quand la variété change (procédure locale).
- Message d'intégrité métier avec `HSurErreur`.
- Contrôle de la quantité restante d'un lot avant commande.
- Passage en HFSQL Client/Serveur pour un usage multi-postes.
- Écran WinDev Mobile de consultation d'un lot sur terminal Android.
- Tableau de bord Power BI branché sur HFSQL via ODBC.

## Auteur

**Ankit Rastogi** – Flowbotics · Maillane (13)
Analyste programmeur, développement d'applications de gestion, bases de données et BI.

> Projet d'apprentissage réalisé avec la version Express gratuite de WinDev (filigrane « Version Express » sur les captures).
