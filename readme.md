
# Objectifs du projet

Vous devez réaliser un projet qui consiste à créer une plateforme qui permettra aux utilisateurs de créer des parcours touristiques.

# Les entités

Pour gérer ce projet vous aurez besoin de quelques entités ...

## Parcours

Ces parcours sont identifiés par un titre, une description et font référence à plusieurs **Illustrations** et contiennent plusieurs **Poi** (point of interest)

Un parcours pourra être édité par son créateur (**Utilisateur**) ou l'un des modérateurs (**Utilisateur**) qui aura été ajouté à ce parcours

## Poi

Il s'agit d'un lieu, un monument, un point de passage et il est identifié par un titre, une description, une latitude et une longitude afin d'être capable de le placer sur une carte. Il fera lui aussi référence à plusieurs **Illustrations** ayant pour but de qualifier visuellement l'élément.

## Illustration

Il s'agit simplement d'une illustration, une image, identifiée par un simple nom de fichier, ce nom de fichier sera utilisé en conjonction avec des chemins stockés dans les fichiers de configuration pour composer le chemin interne (path) et le chemin externe (url)

## Utilisateur

Un utilisateur identifié sera capable de s'identifier sur la plateforme et pourra créer ses **Parcours** et **Pois**

# Ce qui est attendu

## Backend

Vous devez produire une plateforme permettant de ...
- Créer
- Voir de manière unitaire ou en liste
- Modifier
- Supprimer


... des **Users**, **Parcours** ainsi que des **Pois**

Ces pages devront être ergonomiquement respectables, présenter toutes les informations utiles et donner la possibilité de modifier les **Illustrations** des **Parcours** et **Pois** dans leurs formulaire respectifs

Pour les illustrations, un upload de fichier est attendu

# Livraison

La livraison se fera **impérativement** sur un Github Classroom qui vous sera communiqué, la date de rendu sera précisée dans l'assignment que vous rejoindrez, aucune livraison ne sera acceptée par mail ou autre

La livraison contiendra :
- Le code de votre projet
- Une vidéo de démonstration qui respectera le scénario suivant :
    - Identification sur la plateforme
    - Création d'un nouveau parcours (avec une ou plusieurs illustrations)
    - Ajout d'un autre utilisateur comme modérateur
    - Logout
    - Login avec le modérateur
    - Ajout de 2 Pois (avec une ou plusieurs illustrations)
    - Logout
    - Login avec le propriétaire du parcours
    - Suppression du parcours
- Un readme clair qui expliquera ce que vous avez fait, ce que vous n'avez pas pu faire et qui donnera des précisions sur le projet (versions utilisées) ainsi que les manipulations à effectuer afin que je puisse faire tourner votre projet sans problème

# Notation

Vous partez d'un capital de 20 points et vous pourrez en perdre pour plusieurs raison :
- Le code est de mauvaise qualité (jusqu'à -5 points)
- L'ergonomie est franchement mauvaise (jusqu'à -3 points)
- Le rendu est franchement mauvais (jusqu'à -3 points)
- Vous n'avez pas fourni de readme avec votre projet (-5 points)
- Vous n'avez pas fourni un des éléments demandés dans la section du dessus (-1 à -5 points par élément)
- Plagiat (-10 à -25 points), vous avez le droit de prendre du code en ligne tant que vous le comprenez mais ne prenez pas le code d'un camarade, la sentence vaut pour les deux groupes

Si vous réalisez des fonctionnalités non demandées, je rajoute des bonus, par exemple :
- Une carte qui présente les points d'intérêt
- Un formulaire d'upload drag & drop en ajax avec preview
- ...