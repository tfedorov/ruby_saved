# BannerTwist - banner engine

1. **Install and launch BannerTwist**
2. **Insert JavaScript code on a site**
3. **Create Site on Admin Console**
4. **Create Banner on Admin Console**
5. **Add Banner to Site on Admin Console**
6. **Use Admin Console for monitoring**
7. **Launch tests**

## Install and launch BannerTwist
Required:
* Ruby > 2.0 http://www.ruby-lang.org/en/downloads/
* Rails > 4.0
* Bundler
* SqlLite > 3 (You could change for another db)

Launching:
* extract
* bundle install
* rake db:create db:migrate db:seed
* rails s
Application should appear on http://localhost:3000/


## Insert JavaScript code on a site

JS code on should use REST api. API calls should contain HTTP Headers for CORS: ["Host":**banner_twist instance host**] and ["Origin": **site host**]. Site **site host** should be created and registered on a Console admin page 'Site' before.

REST API:
* GET *.../banner_site/init_banner_site* - initial call, return JSON with fields: baner_site_id, uri, link,show_time 
* GET *.../banner_site/next_banner?banner_site_id={current_banner_site_id}* - register current banner show and generate next one, return JSON with fields: baner_site_id, uri, link, show_time
* GET *.../banner_site/add_click?banner_site_id={current_banner_site_id}* - register click for banner

Example of usage this API in *public/banner_twist.js*. You could insert this file as an external js file.
```html
<script src="http://localhost:3000/banner_twist.js"></script>
```
NOTE: You should change *HOST* and *BANNER_URI* constants in *public/banner_twist.js* file for your host.
```javascript
    var HOST = 'localhost'
    var BANNER_URI = 'http://' + HOST + ':3000/'
```
This script create IMG#banner_twist_id (if the IMG doesn't exist). Make init call and start show banners and register its.

You can paste the code into a site on the fly. Go to the site in the console and insert the code.
```javascript
function includeJs(jsFilePath) {
    var js = document.createElement("script");

    js.type = "text/javascript";
    js.src = jsFilePath;

    document.body.appendChild(js);
}

includeJs("http://localhost:3000/banner_twist.js");
```

## Create Site on Admin Console
1. Go to [Sites Admin Page](http://localhost:3000/admin/sites/) and press "New Site".
2. Enter *Name* and *Host* fields into web form. *Host* field should be the same as a host of site where banners should appeare.
3. Press "Create Site"

## Create Banner on Admin Console
1. Go to [Banners Admin Page](http://localhost:3000/admin/banners/) and press "New Banner".
2. Enter Name and Link( url for banner click), Uri field or press "Choose file". NOTE: "Choose file" load image on server and set loaded image uri into Uri field. 
3. Press "Create Banner"

## Add Banner to Site on Admin Console
1. Go to [Banners For Site Admin Page](http://localhost:3000/admin/banner_sites/) and press "New Banner Site".
2. Select Banner, Site, Max show, Show number, Click number, Show time(Banner showing time in milisec) params.
3. Press "Create Banner Site"

## Launch tests

Run rspec tests **rspec --format doc spec/models**
