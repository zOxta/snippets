### Want to change something in a composer package?

**Assuming that:**

- Your Github username is `zOxta` 
- The original package is `"mcstutterfish/cloudflare": "dev-master"`
- The pakcage name is `cloudflare`

**Steps:**

- Fork the Github repository of the original packages
- Create a new branch `feature`
- Make the changes you want then commit and push to your `feature` branch
- In `composer.json` add the following to the end (The `"url"` should of course be that of your own fork of the package):
```javascript
    "repositories": [
      {
        "type": "vcs",
        "url": "https://github.com/zOxta/cloudflare"
      }
    ]
```
- Replace `"mcstutterfish/cloudflare": "dev-master"` by `"mcstutterfish/cloudflare": "dev-feature"` in your `composer.json` file.
- Run `composer update` to install your version of the package (anytime you make changes your forked `feature` branch and update composer, your changes will be reflected).
