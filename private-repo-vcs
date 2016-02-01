Want to change something in a composer package?

Assuming that your Github username is `zOxta` and the pakcage name is `cloudflare`.

1. Fork the Github repository of the original packages
2. Create a new branch `feature`
3. Make the changes you want then commit and push to your `feature` branch
4. In `composer.json` add the following to the end:
```javascript
    "repositories": [
      {
        "type": "vcs",
        "url": "https://github.com/zOxta/cloudflare"
      }
    ]
```

Note: The `URL` should of course be that of your own fork of the package.
