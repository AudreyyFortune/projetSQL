# projetSQL

Nous avons créé une base de données pour gérer tous nos clients. Cette dernière est composée de mannequins, d’acteurs, de chanteurs, ainsi que de footballeurs. Ces artistes ne sont pas salariés, mais rémunérés à chacune de leurs prestations. À chaque prestation, nous prélevons une commission.

### Modèle entités / relations :
- Le nom des tables est en **gras**.
- Les attributs <ins>soulignés</ins> sont les clefs primaires. 
- Les attributs en _italiques_ sont les clefs étrangères.

**Type_artiste** (<ins>id_type_artiste</ins> , type_artiste); <br/>
**Nationalite** (<ins>id_nationalite</ins>, pays); <br/>
**Adresse** (<ins>id_adresse</ins>, numero_rue, rue, ville, pays); <br/>
**Artiste** (<ins>id_artiste</ins>, _id_type_artiste_, nom, prenom, sexe, _id_nationalite_, date_de_naissance, _id_adresse_, email, taille); <br/>
**Type_contrat** (<ins>id_type_contrat</ins>, nom_type_contrat); <br/>
**Contrat** (<ins>id_contrat</ins>, montant, _id_type_contrat_, _id_artiste_); <br/>
**Ville** (id_ville, ville); <br/>
**Localisation** (<ins>id_localisation</ins>, _id_ville_, nom_lieu, nombre_max); <br/>
**Type_evenement** (<ins>id_type_evenement</ins>, type_evenement, nombre_max, nombre_min); <br/>
**Time_stamp** (<ins>id_plage</ins>, plage_date_debut, plage_date_fin) ; <br/>
**Evenement** (<ins>id_evenement</ins>, nom_evenement, _id_localisation_, _id_type_evenement_, _id_plage_, chiffre_affaire); <br/>
**Participe** (_id_contrat_, _id_evenement_); <br/>
