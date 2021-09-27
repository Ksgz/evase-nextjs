# ✨ www.evase.net ✨

To contact me use email support@evase.net

## Quick Start 🏎

[Create a site]

execute following steps for you

- Create a new GitHub repository with the contents of this repository.
- Create [Netlify](https://www.netlify.com) site connected to the GitHub repo
- Deploy the Netlify site.
- Create a "commit" webhook in GitHub that will trigger Netlify deployment as
  soon as new commit is pushed to GitHub.
  
## Develop Locally

1. To further develop your site, clone the generated repository.

1. Install dependencies

       npm install
       
1. Start the Next.js local development server:

        npm run develop

1. Open [http://localhost:3000/](http://localhost:3000/) in the browser to see
   your site. You can now edit the site contents, and the browser will
   live-update your changes. 🎉


## Building for production 🏗

To build a static site for production, or test locally how it works, run the
following command:

    npm run build

The exported site will be written to `out` folder. The contents of this folder 
can be deployed by serverless deployment platform such as [Netlify](https://www.netlify.com).
You can start a local server serving the static files from the `out` folder, for
example by installing and running `http-server`:

    npm install http-server -g
    http-server out
