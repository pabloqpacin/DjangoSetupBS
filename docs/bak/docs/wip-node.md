## Part 3 — [React Integration Using Webpack & Babel](https://www.youtube.com/watch?v=6c2NqDyxppU&t=69s&ab_channel=TechWithTim)

> Following TWT TUTORIA
>
> Additional documentation in [/docs/node-docs.md](node-docs.md)


- [Part 3 — React Integration Using Webpack \& Babel](#part-3--react-integration-using-webpack--babel)
  - [1. Create and prepare **Frontend** app](#1-create-and-prepare-frontend-app)
    - [1.1 Verify **NPM** is installed](#11-verify-npm-is-installed)
    - [1.2 Create `Frontend` app dir](#12-create-frontend-app-dir)
    - [1.3 Create few dirs: **static** + **templates**](#13-create-few-dirs-static--templates)
  - [2. Using **NPM**](#2-using-npm)
    - [2.1 Init NPM](#21-init-npm)
    - [2.2 Install NPM modules (ie. React, Babel, Webpack...)](#22-install-npm-modules-ie-react-babel-webpack)
    - [2.3 UPDATE `.GITIGNORE`](#23-update-gitignore)
  - [3. Setup config scripts + `index.js`](#3-setup-config-scripts--indexjs)
    - [3.1 Create `frontend/babel.config.json`](#31-create-frontendbabelconfigjson)
    - [3.2 Create `frontend/webpack.config.js`](#32-create-frontendwebpackconfigjs)
    - [3.3 Modify `frontend/package.json`](#33-modify-frontendpackagejson)
    - [3.4 Entry **JavaScript** file in `frontend/src/`](#34-entry-javascript-file-in-frontendsrc)
  - [4. Integrate **REACT**](#4-integrate-react)
    - [4.1 Create `DJRE/frontend/templates/frontend`](#41-create-djrefrontendtemplatesfrontend)
    - [4.2 Create and edit `templates/frontend/index.html` within](#42-create-and-edit-templatesfrontendindexhtml-within)
  - [5. Manage the Django for FRONTEND](#5-manage-the-django-for-frontend)
    - [5.1 Edit `DJRE/frontend/views.py`](#51-edit-djrefrontendviewspy)
    - [5.2 Modify `TWT/urls.py`](#52-modify-twturlspy)
    - [5.3 Create `frontend/urls.py`](#53-create-frontendurlspy)
  - [6. Add REACT component](#6-add-react-component)
    - [6.1 Create `DJRE/frontend/src/components/App.js`](#61-create-djrefrontendsrccomponentsappjs)
    - [6.2 Edit `DJRE/frontend/src/index.js`](#62-edit-djrefrontendsrcindexjs)
  - [7. TEST!!!!!!!!](#7-test)
    - [7.n fix `TWT/settings.py`](#7n-fix-twtsettingspy)



### 1. Create and prepare **Frontend** app

#### 1.1 Verify **NPM** is installed

> See [npm-nodejs.md](/docs/npm-nodejs.md)
```bash
cd ~/WIP-TWT/DJRE
source .venv/bin/activate
npm
```

#### 1.2 Create `Frontend` app dir

```bash
cd ~/WIP-TWT/DJRE
django-admin startapp frontend
cd frontend
```

#### 1.3 Create few dirs: **static** + **templates**

> This app will store all React-related setup (ie. JavaScript).

<!--SHOULD ME DO A TREE AS IN `MEWEBSEY`??-->

- Create new dir `/DJRE/frontend/templates`
- Create new dir `/.../frontend/static` (for static files, that a browser would cache)
  - Create `.../static/frontend` for our "main JavaScript bundle"
  - Create `.../static/css`
  - Create `.../static/images`
- Create new dir `/.../frontend/src`
  - Create `.../src/components` for **React components**


### 2. Using **NPM**

<!-- MIGHT REDO AND `SCRIPT` THE WHOLE THING -->

#### 2.1 Init NPM
```bash
cd ~/WIP-TWT/DJRE/frontend
npm init -y
```

#### 2.2 Install NPM modules (ie. React, Babel, Webpack...)

Install...
- **webpack**: to bundle up all of our JavaScript code into a single file
- **babel**: to ensure our JS code runs in older browsers
- ...

```bash
npm i webpack webpack-cli --save-dev
npm i @babel/core babel-loader @babel/preset-env @babel/preset-react --save-dev
npm i react react-dom --save-dev

# npm install @material-ui/core
npm install @material-ui/core --force
npm install @babel/plugin-proposal-class-properties
npm install react-router-dom
# npm install @material-ui/icons
npm install @material-ui/icons --force
```

> ERROR with `@material-ui` because version confligc... [documentation](https://stackoverflow.com/questions/70587214/eresolve-unable-to-resolve-dependency-tree-for-mui-material)

![ERROR with @material-ui](/docs/images/Part3.2.2.png)


#### 2.3 UPDATE `.GITIGNORE`
Copypaste [Github's **Node** template](https://github.com/github/gitignore/blob/main/Node.gitignore) into our current `.gitignore`!


### 3. Setup config scripts + `index.js`

#### 3.1 Create `frontend/babel.config.json`

Create the file and write this code:
```json
{
  "presets": [
    [
      "@babel/preset-env",
      {
        "targets": {
          "node": "10"
        }
      }
    ],
    "@babel/preset-react"
  ],
  "plugins": ["@babel/plugin-proposal-class-properties"]
}
```

#### 3.2 Create `frontend/webpack.config.js`

Create file and write this code:

```js
const path = require("path");
const webpack = require("webpack");

module.exports = {
  entry: "./src/index.js",
  output: {
    path: path.resolve(__dirname, "./static/frontend"),
    filename: "[name].js",
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
        },
      },
    ],
  },
  optimization: {
    minimize: true,
  },
  plugins: [
    new webpack.DefinePlugin({
      "process.env": {
        // This has effect on the react lib size
        NODE_ENV: JSON.stringify("production"),
      },
    }),
  ],
};
```

- Determine input and output in order to bundle up all JS code into one file.

> Should listen to Tim's explanation


#### 3.3 Modify `frontend/package.json`

```json
{
 "scripts": {
    // "test": "echo \"Error: no test specified\" && exit 1"
    "dev": "webpack --mode development --watch",
    "build": "webpack --mode production"
  },
}
```

#### 3.4 Entry **JavaScript** file in `frontend/src/`

Create `index.js`!!


### 4. Integrate **REACT**

```markdown
# Tim explains
Now we need to make it so that our DJANGO app will render a page that REACT we'll take control of. 

- We're going to have our DJANGO application render a template, which is just going to be some vanilla, plain HTML.
- And then our REACT code is going to take over that template and actually fill it in. 

So we will technically have the DJANGO backend actually rendering the template, but then REACT will manage it after that.
```


#### 4.1 Create `DJRE/frontend/templates/frontend`

#### 4.2 Create and edit `templates/frontend/index.html` within

```html
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- MIND TITLE... -->
        <title>Music Controller</title>
        {% load static %}
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" />
        <link rel="stylesheet" type="text/css" href="{% static " css/index.css" %}" />
    </head>

    <body>
        <div id="main">
            <div id="app"></div>
        </div>
        <script src="{% static "frontend/main.js" %}"/>
        </script>
    </body>

</html>
```

### 5. Manage the Django for FRONTEND

#### 5.1 Edit `DJRE/frontend/views.py`

```python
from django.shortcuts import render

# Create your views here.
def index(request, *args, **kwargs):
    return render(request, 'frontend/index.html')
```


#### 5.2 Modify `TWT/urls.py`
```python
urlpatterns = [
    path('', include('frontend.urls')) 
]
```

#### 5.3 Create `frontend/urls.py`

```python
from django.urls import path
from .views import index

urlpatterns = [
    path('', index)
]
```

### 6. Add REACT component

#### 6.1 Create `DJRE/frontend/src/components/App.js`

Let's start writing some REACT code.

```js
import React, {component } from "react";
import { render } from "react-dom";

export default class App extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (<h1>Testing React Code</h1>);
    }
}

const appDiv = document.getElementById("app");
render(<App />, appDiv);
```

> This will be called in the second `</div>` in `index.html`


#### 6.2 Edit `DJRE/frontend/src/index.js`

> Created above in (3.4)

```js
import App from "./components/App";
```


### 7. TEST!!!!!!!!

```bash
# Verify (.venv)
source .venv/bin/activate

# First run the server
python3 manage.py runserver

# Run script in `package.json`
npm run dev
```

> ERROR!

![Part3.7](/docs/images/Part3.7.png)

See [documentation](https://www.npmjs.com/package/babel-loader) and run: `npm install -D babel-loader @babel/core @babel/preset-env webpack`


<!-- DONE BUT REVIEW LATER!!
#### 7.n fix `TWT/settings.py`

```python
# ADD TO INSTALLED APPS:
    'frontend.apps.FrontendConfig',
```
-->

**???**
- [Cannot find module 'fs/promises' Error in TypeScript](https://bobbyhadz.com/blog/typescript-cannot-find-module-fs-promises)
- [Why does ENOENT mean "No such file or directory"?](https://stackoverflow.com/questions/19902828/why-does-enoent-mean-no-such-file-or-directory)


# HOTFIX

1. `cat DJRE/typescript`

2. Decide to fix this:

![HOTFIX0001](/docs/images/hotfix0001.png)


3. Let's update node or smth!!

Documentation:
- @phoenixnap: [How to Update Node.js to Latest Version {Linux, Windows, and macOS}](https://phoenixnap.com/kb/update-node-js-version)
- @NodeJS: [https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions](https://nodejs.org/en/download/package-manager/#snap)
- @NodeSource: [NodeSource Node.js Binary Distributions](https://github.com/nodesource/distributions/blob/master/README.md)
- **@CoderCoder(YT): [What is NPM, and why do we need it? // Tutorial for beginners](https://youtu.be/P3aKRdUyr0s)**