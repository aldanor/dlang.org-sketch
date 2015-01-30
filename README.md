## dlang.org design ideas

Building all assets:

```sh
$ npm install -g grunt-cli bower
$ npm install
$ bower install
$ grunt
```

All website assets including the `html` files will be rendered to the `dist` folder.

Development mode (auto-rebuild for less/coffee, auto-copy for html):

```sh
$ grunt dev
```
