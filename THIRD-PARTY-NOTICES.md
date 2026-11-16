# Third-party components

The MIT license in this repository applies only to the project-authored
materials. It does not grant rights to third-party software, fonts, or images
used to build or run the container.

| Component | How it is used | License and distribution |
| --- | --- | --- |
| SAP Crystal Reports for Visual Studio Runtime | Downloaded by the Dockerfile from SAP and installed in the image | Governed by SAP's terms. Confirm that your intended use, including publication or distribution of an image containing it, is permitted. |
| Microsoft Windows Server Core and Windows fonts | Used as Docker base/build images; fonts are copied into the final image | Governed by Microsoft's applicable terms. |
| Microsoft Visual C++ Redistributable | Downloaded and installed by the Dockerfile | Governed by Microsoft's applicable terms. |
| FontReg | Downloaded from [jason-jxc/FontReg](https://github.com/jason-jxc/FontReg) during the Docker build and used to register fonts | The upstream repository does not expose a recognized license, so its terms are unconfirmed. It is not covered by this project's MIT license. |

This project is not affiliated with or endorsed by SAP or Microsoft.
