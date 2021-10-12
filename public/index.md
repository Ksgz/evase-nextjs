---
title: Home
sections:
  - section_id: hero
    type: section_hero
    title: Evase
    image: images/bham4.png
    content: >-
      Learn | Build | Share skills.
    actions:
      - label: Get Started
        url: /docs
        style: primary
  - section_id: features
    type: section_grid
    col_number: three
    grid_items:
      - title: Documentation
        content: >-
          Containing guides, tutorials and infomation.
        actions:
          - label: Get Started
            url: /docs
            style: link
      - title: Blog
        content: >-
          Keep updated with the latest news
        actions:
          - label: View Posts
            url: /blog
            style: link
      - title: Forums
        content: >-
          Join the community discussions website
        actions:
          - label: Learn More
            url: "https://forum.evase.net/"
            style: link
  - section_id: text-img
    type: section_content
    image: images/jamstack.svg
    image_position: left
    title: Creating websites
    content: >-
      Learn more about open-source frameworks like React, Gatsby, NextJS, VueJS and how to build your own website using Netlify, Jamsack, Vercel & Bootstrap!
    actions:
      - label: Deploy site
        url: /docs/getting-started/deploy
        style: primary
      - label: Get Started
        url: /docs/getting-started
        style: secondary
  - section_id: text-no-img
    type: section_content
    title: Why Evase?
    content: >-
      Evase is an educational website aiming to bring the best out of an individual's full potential.
      We teach our bright users the true meaning of the subject and how it is applied in real-life scenarios. 
      Evase allocates each subject to having the best teacher, with degrees and worldly experiences, vast portfolios, and more!
  - section_id: text-img
    type: section_content
    image: images/values.png
    image_position: left
    title: Our Values
    content: >-
      Evase encourages our users to have aspirations for their life goals, commitment in their studies, and above all fun in all subjects.
  - section_id: text-img
    type: section_content
    title: API Intergrated
    image: images/feature3.png
    image_position: right
    actions:
          - label: View
            url: /media
            style: secondary
            has_icon: true
            icon: arrow-right
            icon_position: right
    content: >-
          Evase has intergrated it's website with Instagram's API to display it's
          state of the art Social Media Post page! 
  - section_id: text-no-img
    type: section_content
    title: What we offer
    content: >-
      Did we mention it's all completely free? We offer a variety of Courses in our catalog such as Computer Languages/Computer Sciences, Economics and Market Trading, Hosting online, Online Safety, and Cyber security. We additionally provide online classes, exercises, and homework, free sources and articles, and well as a state of the art forums for support and sharing ideas. Pushing our hungry learners to become either a developer for a big company or a small project, an economist to analyze the world's economic welfare and conditions, be an online trader, sell, buy and exchange shares and stocks, becoming online safety supervisor and teach others in schools the risks online, Learn cyber security and defend against the dark arts, See what it means to become a professional computer linguist/analyst with wealth of data or hosting and telecommunicating for the world wide web!
    actions:
      - label: Get Started
        url: /docs/getting-started/installation
        style: primary
  - section_id: features-two-col
    type: section_grid
    title: News & Media
    subtitle: Stay in touch with our Social Platforms & Blogs / Articles
    col_number: two
    grid_items:
      - title: Overview
        content: >-
         This directs you to our Frequently Asked Questions Page
        actions:
          - label: Learn More
            url: /overview
            style: link
      - title: Media
        content: >-
          This directs you to our Social Media Posts
        actions:
          - label: View
            url: /media
            style: link
  - section_id: cta
    type: section_cta
    title: Evase is a non-profit organization
    subtitle: This website does not generate any revenue. All resources are free and useable without permission.
    actions:
      - label: Get Started
        url: /docs/getting-started/installation
        style: primary
seo:
  title: Evase
  description: Evase website
  extra:
    - name: 'og:type'
      value: website
      keyName: property
    - name: 'og:title'
      value: 
      keyName: property
    - name: 'og:description'
      value:
      keyName: property
    - name: 'og:image'
      value: images/4.jpg
      keyName: property
      relativeUrl: true
    - name: 'twitter:card'
      value: summary_large_image
    - name: 'twitter:title'
      value: Educational website
    - name: 'twitter:description'
      value: 
    - name: 'twitter:image'
      value: images/4.jpg
      relativeUrl: true
layout: advanced
---

<html><head><meta name="facebook-domain-verification" content="m5ziozdi1up8tkaqveb5v5ihj5x2s0" /></head></html>

    <!-- update the version number as needed -->
    <script defer src="/__/firebase/9.1.0/firebase-app-compat.js"></script>
    <!-- include only the Firebase features as you need -->
    <script defer src="/__/firebase/9.1.0/firebase-auth-compat.js"></script>
    <script defer src="/__/firebase/9.1.0/firebase-database-compat.js"></script>
    <script defer src="/__/firebase/9.1.0/firebase-firestore-compat.js"></script>
    <script defer src="/__/firebase/9.1.0/firebase-functions-compat.js"></script>
    <script defer src="/__/firebase/9.1.0/firebase-messaging-compat.js"></script>
    <script defer src="/__/firebase/9.1.0/firebase-storage-compat.js"></script>
    <script defer src="/__/firebase/9.1.0/firebase-analytics-compat.js"></script>
    <script defer src="/__/firebase/9.1.0/firebase-remote-config-compat.js"></script>
    <script defer src="/__/firebase/9.1.0/firebase-performance-compat.js"></script>
    <!-- 
      initialize the SDK after all desired features are loaded, set useEmulator to false
      to avoid connecting the SDK to running emulators.
    -->
    <script defer src="/__/firebase/init.js?useEmulator=true"></script>

    <style media="screen">
      body { background: #ECEFF1; color: rgba(0,0,0,0.87); font-family: Roboto, Helvetica, Arial, sans-serif; margin: 0; padding: 0; }
      #message { background: white; max-width: 360px; margin: 100px auto 16px; padding: 32px 24px; border-radius: 3px; }
      #message h2 { color: #ffa100; font-weight: bold; font-size: 16px; margin: 0 0 8px; }
      #message h1 { font-size: 22px; font-weight: 300; color: rgba(0,0,0,0.6); margin: 0 0 16px;}
      #message p { line-height: 140%; margin: 16px 0 24px; font-size: 14px; }
      #message a { display: block; text-align: center; background: #039be5; text-transform: uppercase; text-decoration: none; color: white; padding: 16px; border-radius: 4px; }
      #message, #message a { box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24); }
      #load { color: rgba(0,0,0,0.4); text-align: center; font-size: 13px; }
      @media (max-width: 600px) {
        body, #message { margin-top: 0; background: white; box-shadow: none; }
        body { border-top: 16px solid #ffa100; }
      }
    </style>
  </head>
  <body>
    <div id="message">
      <h2>Welcome</h2>
      <h1>Firebase Hosting Setup Complete</h1>
      <p>You're seeing this because you've successfully setup Firebase Hosting. Now it's time to go build something extraordinary!</p>
      <a target="_blank" href="https://firebase.google.com/docs/hosting/">Open Hosting Documentation</a>
    </div>
    <p id="load">Firebase SDK Loading&hellip;</p>

    <script>
      document.addEventListener('DOMContentLoaded', function() {
        const loadEl = document.querySelector('#load');
        // // 🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
        // // The Firebase SDK is initialized and available here!
        //
        // firebase.auth().onAuthStateChanged(user => { });
        // firebase.database().ref('/path/to/ref').on('value', snapshot => { });
        // firebase.firestore().doc('/foo/bar').get().then(() => { });
        // firebase.functions().httpsCallable('yourFunction')().then(() => { });
        // firebase.messaging().requestPermission().then(() => { });
        // firebase.storage().ref('/path/to/ref').getDownloadURL().then(() => { });
        // firebase.analytics(); // call to activate
        // firebase.analytics().logEvent('tutorial_completed');
        // firebase.performance(); // call to activate
        //
        // // 🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥

        try {
          let app = firebase.app();
          let features = [
            'auth', 
            'database', 
            'firestore',
            'functions',
            'messaging', 
            'storage', 
            'analytics', 
            'remoteConfig',
            'performance',
          ].filter(feature => typeof app[feature] === 'function');
          loadEl.textContent = `Firebase SDK loaded with ${features.join(', ')}`;
        } catch (e) {
          console.error(e);
          loadEl.textContent = 'Error loading the Firebase SDK, check the console.';
        }
      });
    </script>
  </body>
</html>
