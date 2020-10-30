from tkinter import *
import random


liste_apprenants = [i for i in range(20)]

#Fonction crea_groupes
def crea_groupe(liste, nombre_personne_par_grp):
    
    groupes = []
    random.shuffle(liste)

    while liste != []:
        restant = len(liste)%nombre_personne_par_grp
        if restant == 0:
            groupes.append(liste[0:nombre_personne_par_grp])
            del liste[0:nombre_personne_par_grp]
        else:
            groupes.append(liste[0:restant])
            del liste[0:restant]
    print(groupes)


#creer la fenetre
window = Tk()

#personnalier la fenetre
window.title("Binomotron")
window.geometry('1080x720')
#window.minsize("480x360")
window.config(background="#86c7ff")

#frame
frame = Frame(window, bg='#86c7ff')

#le titre
label_title = Label(frame, text="Créateur de groupes aléatoire", font=("Courrier", 45), bg='#86c7ff', fg='white')
label_title.pack()

#Question
label_question = Label(frame, text="Combien de personnes par groupes voulez-vous ?", font=("Courrier", 18), bg='#86c7ff', fg='white')
label_question.pack(pady=50)

#Champ
nombre_groupe_entry = Entry(frame, font=("Courrier", 18), bg='white', fg='#86c7ff')
nombre_groupe_entry.pack()

#Réponse
label_reponse = Label(frame, text="", font=("Courrier", 18), bg='white', fg='#86c7ff')
label_reponse.pack(pady=50)

#Bouton
bouton_generer = Button(frame, text="Generer",font=("Courrier", 18), bg='white', fg='#86c7ff', command=lambda: crea_groupe(liste_apprenants, int(nombre_groupe_entry.get())))
bouton_generer.pack(pady = 25)

#afficher frame
frame.pack(expand=YES)
#afficher la fenetre
window.mainloop()
