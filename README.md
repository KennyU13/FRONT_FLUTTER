# FRONT_FLUTTER

Application Flutter pour le front mobile d'un mini reseau social.

## Description

FRONT_FLUTTER est une application mobile developpee avec Flutter pour permettre aux utilisateurs de creer un compte, se connecter, publier du contenu, interagir avec les publications et discuter avec leurs amis. L'application communique avec une API backend et utilise Socket.IO pour la messagerie en temps reel.

## Theme

Le projet est un mini reseau social mobile avec :

- authentification
- fil d'actualite
- publications avec texte ou image
- likes
- profil utilisateur
- invitations et suggestions d'amis
- messagerie en temps reel avec Socket.IO

## Installation

```bash
flutter pub get
```

## Configuration

L'URL de l'API se trouve dans `lib/service/config.dart`.

## Lancement

```bash
flutter run
```
