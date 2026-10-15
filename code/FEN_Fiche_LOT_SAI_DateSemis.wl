// =====================================================================
// Projet  : GestionPlants (WinDev 28 Express, HFSQL Classic)
// Fenêtre : Fiche LOT
// Champ   : SAI_DateSemis
// Traitement : Sortie de SAI_DateSemis
// ---------------------------------------------------------------------
// Règle métier :
//   Date prête à livrer = date de semis + durée de culture de la variété
//
// Exemple vérifié :
//   Black Beauty (45 jours), semis le 20/10/2026 -> prête le 04/12/2026
//
// Remarque :
//   Les noms des champs (SAI_DateSemis, SAI_DatePrete, COMBO_VARIETE)
//   dépendent de la fenêtre générée par le RAD : les vérifier dans le
//   Modifieur avant de coller ce code.
// =====================================================================

// Lit la variété choisie dans la combo, par sa clé IDVARIETE
HLitRecherchePremier(VARIETE, IDVARIETE, COMBO_VARIETE)

// Calcule uniquement si la variété existe et si une date de semis est saisie
SI HTrouve(VARIETE) ET SAI_DateSemis <> "" ALORS
	// Date -> nombre de jours, + durée de culture, -> date (format AAAAMMJJ)
	SAI_DatePrete = DateVersChaîne(EntierVersDate(DateVersEntier(SAI_DateSemis) + VARIETE.DureeCultureJours), "AAAAMMJJ")
FIN


// =====================================================================
// Amélioration prévue : procédure locale appelée depuis la date de semis
// ET depuis la combo variété, pour recalculer si la variété change.
// =====================================================================
//
// PROCÉDURE CalculeDatePrete()
//     HLitRecherchePremier(VARIETE, IDVARIETE, COMBO_VARIETE)
//     SI HTrouve(VARIETE) ET SAI_DateSemis <> "" ALORS
//         SAI_DatePrete = DateVersChaîne(EntierVersDate(DateVersEntier(SAI_DateSemis) + VARIETE.DureeCultureJours), "AAAAMMJJ")
//     FIN
//
// Sortie de SAI_DateSemis          : CalculeDatePrete()
// Sélection d'une ligne de COMBO_VARIETE : CalculeDatePrete()
