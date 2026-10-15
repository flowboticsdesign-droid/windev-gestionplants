# Glossaire et formes complètes

[← Retour au README](../README.md)

## Sigles

| Sigle | Forme complète | Rôle dans le projet |
| --- | --- | --- |
| PC SOFT | Nom de l'éditeur (Montpellier) | Éditeur français de WinDev, WebDev et WinDev Mobile |
| WinDev | Nom commercial | Atelier pour créer des applications Windows |
| WinDev Mobile | Nom commercial | Applications Android et iOS (terminaux de saisie) |
| WebDev | Nom commercial | Sites et applications web |
| WLangage | Langage de programmation de PC SOFT (WLanguage en anglais) | Langage commun aux trois produits, en français ou en anglais |
| HFSQL | HyperFile SQL | Base de données de PC SOFT (anciennement HyperFile) |
| HFSQL Classic | — | Mode fichiers locaux ou partage réseau, utilisé ici |
| HFSQL C/S | HFSQL Client/Serveur | Mode serveur multi-postes, port 4900 par défaut |
| RAD | Rapid Application Development | Génération automatique des fenêtres, états et menus à partir de l'analyse |
| FAA | Fonctionnalités Automatiques de l'Application | Fonctions offertes sans code : export Excel/Word, tri, filtres |
| GDS | Gestionnaire De Sources | Gestion des versions du code de PC SOFT (équivalent de Git) |
| MLD | Modèle Logique de Données | Schéma des fichiers et liaisons dans l'éditeur d'analyse |
| MCD | Modèle Conceptuel de Données | Modèle d'analyse en amont (méthode Merise), non utilisé ici |
| ERP | Enterprise Resource Planning (PGI : progiciel de gestion intégré) | Type de logiciel maintenu en entreprise |
| UI | User Interface (interface utilisateur) | Utilisé dans les « erreurs d'UI » du compilateur |
| RGPD | Règlement Général sur la Protection des Données | Colonne d'audit RGPD dans les rubriques |
| ODBC | Open Database Connectivity | Accès à HFSQL depuis Power BI ou Excel |
| OLE DB | Object Linking and Embedding, Database | Autre pilote d'accès aux données Windows |
| SQL | Structured Query Language | Langage de requêtes, utilisable sur HFSQL |
| IDE | Integrated Development Environment | Environnement de développement (WinDev en est un) |

## Termes WinDev

| Terme | Équivalent courant | Définition |
| --- | --- | --- |
| Analyse | Modèle de données | Description des fichiers, rubriques, clés et liaisons (fichier .wda) |
| Fichier de données | Table | Ensemble d'enregistrements (VARIETE, LOT, COMMANDE) |
| Rubrique | Colonne | Une information d'un fichier (NomVariete, DateSemis) |
| Enregistrement | Ligne | Une variété, un lot ou une commande |
| Clé unique | Clé primaire / index unique | Aucune valeur en double (IDLOT) |
| Clé avec doublons | Index non unique | Recherche rapide, doublons autorisés (Serre, DateSemis) |
| Identifiant automatique | Auto-incrément | Numéro attribué par la base, sur 8 octets |
| Liaison | Relation | Lien entre deux fichiers, avec cardinalités |
| Clé reliée (migrée) | Clé étrangère | IDVARIETE copiée dans LOT par la liaison |
| Cardinalité | Multiplicité | 0,n ou 1,1 : combien d'enregistrements de chaque côté |
| Intégrité référentielle | Contrainte de clé étrangère | Interdit les lots sans variété ou la suppression d'une variété utilisée |
| Génération de l'analyse | Migration de schéma | Applique le modèle et crée une version (v 1) |
| Fenêtre | Écran / formulaire | Élément d'interface (table ou fiche) |
| Fiche | Formulaire de saisie | Fenêtre de création et modification d'un enregistrement |
| Champ | Contrôle | Élément d'une fenêtre : SAI_ (saisie), COMBO_, LIB_ (libellé) |
| Combo | Liste déroulante | Choix d'une variété ou d'un lot |
| État | Rapport imprimable | Liste, bon de livraison, étiquette |
| Gabarit | Thème graphique | Style visuel des fenêtres (Phoenix ici) |
| Charte de programmation | Convention de nommage | Préfixes automatiques : SAI_, COMBO_, FEN_, ETAT_ |
| Modifieur | Panneau de propriétés | Réglage rapide d'un champ (taille, état, style) |
| Mode test (GO) | Exécution en débogage | Lance l'application depuis l'éditeur |
| WDModFic | Outil de modification de fichiers | Applique les changements de structure chez les utilisateurs |
| Centre de Contrôle HFSQL | Console d'administration | Gestion des bases, utilisateurs, sauvegardes |

## Fonctions WLangage utilisées

| Fonction (français) | Équivalent anglais | Rôle |
| --- | --- | --- |
| HLitRecherchePremier | HReadSeekFirst | Chercher un enregistrement par clé |
| HTrouve | HFound | Tester si l'enregistrement a été trouvé |
| DateVersEntier | DateToInteger | Date vers nombre de jours |
| EntierVersDate | IntegerToDate | Nombre de jours vers date |
| DateVersChaîne | DateToString | Date vers texte formaté |
| HSurErreur | HOnError | Personnaliser la gestion des erreurs HFSQL (amélioration prévue) |
