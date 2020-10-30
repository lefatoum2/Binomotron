import mysql.connector as mysqlpyth
import random
from datetime import datetime

db = mysqlpyth.connect(
    host = "localhost",
    user = "root",
    passwd = "root",
    port = 8081,
    db = "binomotron"
    )

print("Connexion réussi !")

cursor = db.cursor()

#Récuperer la table apprenants dans la base de donnée et les afficher :
query = "SELECT id_apprenant, prenom_apprenant, nom_apprenant FROM apprenants"

cursor.execute(query)
liste_apprenants = []

for identifiant, prenom, nom in cursor :
    personne = [identifiant, prenom, nom]
    liste_apprenants.append(personne)


print("Voici la liste des apprenants :\n", liste_apprenants)

#Exécuter la fonction binomotron et afficher les groupes:
nombre_personne_par_groupe = int(input("Combien de personnes par groupe ?"))
groupes = []

def crea_groupe(liste):
    global nombre_personne_par_groupe
    global groupes
    random.shuffle(liste)

    while liste != []:
        restant = len(liste)%nombre_personne_par_groupe
        if restant == 0:
            groupes.append(liste[0:nombre_personne_par_groupe])
            del liste[0:nombre_personne_par_groupe]
        else:
            groupes.append(liste[0:restant])
            del liste[0:restant]
    return groupes

crea_groupe(liste_apprenants)

#Affichage "propre" des groupes:

print("Voici les groupes :")
numero_de_groupe = 0
for groupe in groupes:
    numero_de_groupe += 1
    affichage_groupes = ''.join(' - '.join([str(elem) for elem in groupe]))
    affichage_groupes = affichage_groupes.replace('[','').replace(']','').replace("'",'')
    print( f"Groupe {numero_de_groupe} = {affichage_groupes}")


#Création de projet et importation dans la BDD :
nom_projet = input("Entrez nom du projet : ")
date = datetime.now().strftime("%Y/%m/%d")

query = "INSERT INTO projets(id_projet, libelle_projet, date_projet) VALUE(%s, %s, %s)"

value = (None, nom_projet, date)
cursor.execute(query, value)
db.commit()

#Attribution groupes à un id_groupe et id_projet et importer le tout dans la BDD:
query = "INSERT INTO apprenants_groupes_projets(id_apprenant, id_groupe, id_projet) VALUE(%s, %s, %s)"

numero_de_groupe = 0 
id_projet = cursor.lastrowid

for groupe in groupes:
    numero_de_groupe += 1
    for i in groupe:
        value = (i[0], numero_de_groupe, id_projet)
        cursor.execute(query, value)
        db.commit()
     
db.close()
print("Connexion terminé !")