# Guide d'installation et d'utilisation

Ce guide vous aidera à configurer et à lancer la plateforme éducative XML à partir d'un fichier ZIP.

## Prérequis
- **Node.js** (Version 16 ou plus récente)
- **NPM** (installé avec Node.js)
- Une connexion Internet pour l'installation des dépendances.

## Étapes d'installation

1.  **Extraire le fichier ZIP**
    Décompressez le contenu du fichier ZIP dans le dossier de votre choix sur votre ordinateur.

2.  **Ouvrir un terminal**
    Ouvrez un terminal (Invite de commandes, PowerShell ou Terminal sur macOS/Linux) et naviguez vers le dossier racine du projet (là où se trouve le fichier `package.json`).

3.  **Installer les dépendances**
    Exécutez la commande suivante pour installer toutes les bibliothèques nécessaires :
    ```bash
    npm install
    ```

4.  **Configuration du fichier d'environnement (.env)**
    Le système utilise l'API **Resend** pour envoyer des notifications par e-mail aux étudiants.
    - Créez un fichier nommé `.env` à la racine du projet.
    - Ajoutez la ligne suivante dans le fichier :
      ```env
      RESEND_API_KEY=votre_cle_api_ici
      ```

5.  **Explication de la clé API Resend**
    La clé `RESEND_API_KEY` est indispensable pour que le service de notification puisse envoyer des e-mails lors de la création d'un examen ou d'un TP.
    - **Où l'obtenir ?** Créez un compte gratuit sur [Resend.com](https://resend.com).
    - **Pourquoi ?** Sans cette clé, le système simulera l'envoi dans la console (pour le développement) mais n'enverra pas de vrais e-mails.
    - **Note :** Avec un compte gratuit Resend, l'expéditeur par défaut est configuré sur `onboarding@resend.dev`.

## Lancer l'application

Une fois la configuration terminée, vous pouvez démarrer le serveur :

```bash
node src/app.js
```

L'application sera accessible à l'adresse suivante : [http://localhost:3000](http://localhost:3000)

## Comptes de test (si inclus dans les données)
- **Admin :** `admin@platform.com` / `password123`
- **Etudiant :** `u2@example.com` / `password123`
- **Professeur :** `u2@example.com` / `password123`

---
*Plateforme éducative basée sur XML/XSLT.*
