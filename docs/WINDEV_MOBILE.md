# Application mobile Android – GestionPlantsMobile

[← Retour au README](../README.md) · [Documentation WinDev](DOCUMENTATION.md) · [Glossaire](GLOSSAIRE.md)

Une application **Android** réalisée avec **WinDev Mobile 28 Express**, qui **réutilise l'analyse HFSQL** du projet Windows GestionPlants : mêmes fichiers (VARIETE, LOT, COMMANDE), mêmes liaisons, même WLangage. Elle affiche la liste des lots de plants, comme pourrait le faire un terminal en serre ou à l'expédition.

![Lots dans le simulateur Android](../screenshots/mobile/m20-simulateur-lots.png)

## Sommaire

1. [Créer le projet Android](#1-créer-le-projet-android) – captures m01 à m05
2. [Réutiliser l'analyse du projet Windows](#2-réutiliser-lanalyse-du-projet-windows) – captures m06 à m09
3. [Créer la fenêtre liste des lots](#3-créer-la-fenêtre-liste-des-lots) – captures m10 à m16
4. [Tester dans le simulateur](#4-tester-dans-le-simulateur) – captures m17 et m18
5. [Créer des données de démonstration en WLangage](#5-créer-des-données-de-démonstration-en-wlangage) – captures m19 et m20
6. [Ce que cela donnerait en production](#6-ce-que-cela-donnerait-en-production)

---

## 1. Créer le projet Android

### Étape 1.1 – Accueil

WinDev Mobile Express installé et activé comme WinDev (identifiant, formulaire PC SOFT, clé reçue par e-mail). Accueil → **Créer un projet**.

![Accueil WinDev Mobile](../screenshots/mobile/m01-accueil-windev-mobile.png)

### Étape 1.2 – Plateforme

**Android uniquement** : c'est le système des terminaux mobiles industriels utilisés en entreprise.

![Plateforme Android](../screenshots/mobile/m02-plateforme-android.png)

### Étape 1.3 – Appareils

**Générer une application pour téléphones** : convient aussi aux terminaux industriels de la taille d'un téléphone.

![Choix des appareils](../screenshots/mobile/m03-choix-appareils.png)

### Étape 1.4 – Nom du projet

**GestionPlantsMobile**, dans C:\Mes Projets\GestionPlantsMobile.

![Nom du projet](../screenshots/mobile/m04-nom-projet.png)

### Étape 1.5 – Documents joints

Aucun document pour ce projet de démonstration.

![Documents joints](../screenshots/mobile/m05-documents-joints.png)

---

## 2. Réutiliser l'analyse du projet Windows

C'est le point clé : **une seule analyse pour l'application Windows et l'application mobile.**

### Étape 2.1 – Base existante

**Oui, utiliser une base de données existante.**

![Base de données](../screenshots/mobile/m06-base-de-donnees.png)

### Étape 2.2 – Utiliser l'analyse

**Utiliser l'analyse ci-dessous**, puis le bouton « … ».

![Utiliser une analyse](../screenshots/mobile/m07-utiliser-analyse.png)

### Étape 2.3 – Sélectionner le fichier .wda

C:\Mes Projets\GestionPlants\GestionPlants.ana\**GestionPlants.wda**. Les dossiers ANA00001 et LASTGEN contiennent les versions générées de l'analyse.

![Sélection du fichier .wda](../screenshots/mobile/m08-selection-analyse-wda.png)

### Étape 2.4 – Projet créé

Le tableau de bord indique **Analyse : 3 fichiers de données – GestionPlants** et la configuration **Application Android**. Remarque : « RAD Application complète » n'est pas disponible ici, les fenêtres sont donc créées une par une.

![Tableau de bord du projet mobile](../screenshots/mobile/m09-tableau-de-bord-mobile.png)

---

## 3. Créer la fenêtre liste des lots

### Étape 3.1 – Nouvelle fenêtre

Nouveau → **Fenêtre** → Fenêtre.

![Nouvelle fenêtre](../screenshots/mobile/m10-nouvelle-fenetre.png)

### Étape 3.2 – Modèle de fenêtre mobile

Galerie de modèles pour téléphone (vierge, menu, connexion, fiche…). Choix de l'assistant.

![Modèles de fenêtre mobile](../screenshots/mobile/m11-modeles-fenetre-mobile.png)

### Étape 3.3 – Fenêtre maximisée

Fenêtre **maximisée**, en plein écran comme une application Android classique.

![Fenêtre maximisée](../screenshots/mobile/m12-fenetre-maximisee.png)

### Étape 3.4 – Zone répétée et sauvegarde

Une **zone répétée** (looper) est ajoutée : c'est la liste défilante typique d'une application mobile. Fenêtre sauvegardée sous **FEN_Liste_Lots**, titre « Lots de plants ».

![Zone répétée](../screenshots/mobile/m13-zone-repetee.png)

### Étape 3.5 – Contenu de la zone répétée

Onglet **Contenu** : remplissage par **Fichier/Requête**, fichier parcouru **LOT**, parcours automatique.

![Contenu de la zone répétée](../screenshots/mobile/m14-zone-repetee-contenu.png)

### Étape 3.6 – Liaison des champs

Onglet **Liaison** : chaque champ de la ligne est relié à une rubrique de l'analyse.

| Champ de la ligne | Rubrique reliée |
| --- | --- |
| LIB_Libellé1 (titre) | LOT.Serre |
| LIB_SousLibellé1 (sous-titre) | LOT.DateSemis |
| IMG_Vignette | non reliée |

![Liaison des champs](../screenshots/mobile/m15-zone-repetee-liaison.png)

### Étape 3.7 – Fenêtre terminée

Dans l'éditeur, les « Libellé » sont des textes d'exemple, remplacés à l'exécution par les valeurs des rubriques.

![Fenêtre FEN_Liste_Lots](../screenshots/mobile/m16-fenetre-liste-lots.png)

---

## 4. Tester dans le simulateur

### Étape 4.1 – Avertissement

WinDev Mobile conseille de valider sur un vrai appareil (« Déboguer sur appareil mobile ») : le simulateur suffit pour développer, mais une application terrain se valide toujours sur le terminal, surtout avec un lecteur de codes-barres.

![Avertissement simulateur](../screenshots/mobile/m17-simulateur-avertissement.png)

### Étape 4.2 – Liste vide

La fenêtre s'ouvre mais la liste est vide : **le téléphone a ses propres fichiers de données**, distincts de ceux du poste Windows.

![Simulateur, liste vide](../screenshots/mobile/m18-simulateur-liste-vide.png)

---

## 5. Créer des données de démonstration en WLangage

### Étape 5.1 – Le code

Traitement **Déclarations globales de FEN_Liste_Lots** : si le fichier LOT est vide, création d'une variété puis de trois lots qui lui sont rattachés (respect de l'intégrité référentielle).

```wlanguage
SI HNbEnr(LOT) = 0 ALORS
	HRAZ(VARIETE)
	VARIETE.NomVariete = "Batavia"
	VARIETE.Espece = "Salade"
	VARIETE.DureeCultureJours = 35
	HAjoute(VARIETE)

	HRAZ(LOT)
	LOT.IDVARIETE = VARIETE.IDVARIETE
	LOT.DateSemis = "20261001"
	LOT.Quantite = 8000
	LOT.Serre = "Serre 1"
	LOT.DatePrete = "20261105"
	HAjoute(LOT)
	// … deux autres lots (Serre 2, Serre 3)
FIN
```

| Fonction | Équivalent anglais | Rôle |
| --- | --- | --- |
| HNbEnr | HNbRec | Nombre d'enregistrements du fichier |
| HRAZ | HReset | Vide le buffer avant un ajout |
| HAjoute | HAdd | Écrit l'enregistrement |

Code complet : [code/FEN_Liste_Lots_DeclarationsGlobales.wl](../code/FEN_Liste_Lots_DeclarationsGlobales.wl)

![Code des données de démonstration](../screenshots/mobile/m19-code-donnees-demo.png)

### Étape 5.2 – Résultat

Le simulateur Android affiche les **3 lots** (Serre 1, 2 et 3) avec leur date de semis au format JJ/MM/AAAA, lus dans le fichier HFSQL du téléphone.

![Lots dans le simulateur](../screenshots/mobile/m20-simulateur-lots.png)

Le libellé de date est réglé en type **Date** avec le masque **JJ/MM/AAAA** (onglet Général du champ), pour afficher 01/10/2026 au lieu de la valeur brute 20261001.

---

## 6. Ce que cela donnerait en production

| Besoin terrain | Solution WinDev Mobile |
| --- | --- |
| Partager les données avec l'ERP | Terminal connecté en Wi-Fi à une base **HFSQL Client/Serveur** |
| Serres mal couvertes par le Wi-Fi | Fichiers locaux sur le terminal et **synchronisation** au retour du réseau |
| Identifier un lot rapidement | **Lecteur de codes-barres** du terminal pour ouvrir la fiche du lot |
| Préparer les commandes | Liste des lignes à charger, validation ligne par ligne |
| Installer l'application | Génération d'un **APK** déployé sur les terminaux Android (installation directe ou outil de gestion de flotte) |
