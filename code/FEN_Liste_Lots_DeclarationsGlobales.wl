// =====================================================================
// Projet  : GestionPlantsMobile (WinDev Mobile 28 Express, Android)
// Fenêtre : FEN_Liste_Lots
// Traitement : Déclarations globales de FEN_Liste_Lots
// ---------------------------------------------------------------------
// Crée des données de démonstration sur le téléphone, uniquement si le
// fichier LOT est vide. Le projet mobile partage l'analyse HFSQL du
// projet Windows GestionPlants : mêmes fichiers, mêmes liaisons.
// La variété est créée d'abord, puis chaque lot reçoit son IDVARIETE,
// ce qui respecte la règle d'intégrité VARIETE 0,n -> 1,1 LOT.
// =====================================================================
PROCÉDURE MaFenêtre()

SI HNbEnr(LOT) = 0 ALORS
	// Une variété
	HRAZ(VARIETE)
	VARIETE.NomVariete = "Batavia"
	VARIETE.Espece = "Salade"
	VARIETE.DureeCultureJours = 35
	HAjoute(VARIETE)

	// Trois lots rattachés à cette variété
	HRAZ(LOT)
	LOT.IDVARIETE = VARIETE.IDVARIETE
	LOT.DateSemis = "20261001"
	LOT.Quantite = 8000
	LOT.Serre = "Serre 1"
	LOT.DatePrete = "20261105"
	HAjoute(LOT)

	HRAZ(LOT)
	LOT.IDVARIETE = VARIETE.IDVARIETE
	LOT.DateSemis = "20261008"
	LOT.Quantite = 5000
	LOT.Serre = "Serre 2"
	LOT.DatePrete = "20261112"
	HAjoute(LOT)

	HRAZ(LOT)
	LOT.IDVARIETE = VARIETE.IDVARIETE
	LOT.DateSemis = "20261015"
	LOT.Quantite = 3000
	LOT.Serre = "Serre 3"
	LOT.DatePrete = "20261119"
	HAjoute(LOT)
FIN
