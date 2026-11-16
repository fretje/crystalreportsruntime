# crystalreportsruntime docker image

This repository contains files for building a Windows container image based
on the Microsoft ASP.NET 4.8 image, containing the 'Crystal Reports for Visual
Studio Runtime' and its dependencies.

An already built image can be found on [Docker Hub](https://hub.docker.com/r/fretje/crystalreportsruntime).  
Or pull it down with the following command:

    docker pull fretje/crystalreportsruntime:latest

The image is based on Microsoft's ASP.NET 4.8 Windows Server Core image.

### Fonts

As this is used for exporting reports, fonts are needed as well.
We take those from the full windows version.

Note that due to how Server 2019 handles the installation of fonts, it's still 
necessary to call `[gdi32.dll] AddFontResource` for each font otherwise they 
won't be available to the application.  
See [this link](https://stackoverflow.com/questions/54366537/adding-fonts-in-server-core-2019ltsc-container-image) 
for more information.  
See [this link](https://gist.github.com/fretje/9c9a81a0e30554b5797e8f5bb792f866) 
for how this can be done at startup for an ASP.NET MVC 5 Web Application. 

### Versions

* Windows Server Core: **2019ltsc** (1809 Build 17763)
* ASP.NET: **4.8**
* Crystal Reports for Visual Studio Runtime: **13.0.40**

### Building

From the repository root, build the image with:

```shell
docker build --pull --rm -t fretje/crystalreportsruntime:latest .
```

### License and third-party software

The project-authored files are available under the [MIT License](./LICENSE).
That license does not cover the SAP Crystal Reports Runtime, Microsoft
software or fonts, or FontReg. Those components are subject to their own
terms; see [Third-party components](./THIRD-PARTY-NOTICES.md).

Check the relevant terms and confirm you have permission before using this
project or its container image. This project is not affiliated with or endorsed
by SAP or Microsoft.

Contributions are welcome; see [CONTRIBUTING.md](./CONTRIBUTING.md).
