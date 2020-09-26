# CyBear Jinni Smart Home

Welcome

This repository let you **create** your own smart home.

Here at CyBear Jinni we give the community the power of smart home by providing the code and instructions to create a smart devices that will make ordinary devices like lamps and blinds smart and accessible.  

The devices can be controlled using physical buttons and from a smartphone app.

This is **not** project to create "Home automation system" like the project [Home Assistant](https://www.home-assistant.io).

## Project structure

The project is made out of two main parts:

### CyBear Jinni App

[CyBear Jinni App](https://github.com/CyBear-Jinni/CBJ_App.git) is the app to control your CyBear Jinni Smart Devices.
This is an Android and IOS app written in [Flutter](https://flutter.dev) that let you control all the devices using local Wi-Fi and remotely through Google [Cloud Firestore](https://firebase.google.com/docs/firestore).


### CyBear Jinni Smart Device

[CyBear Jinni Smart Device](https://github.com/CyBear-Jinni/CBJ_Smart-Device.git) is the smart device software installed on physical device (now only NanoPi Duo2).
It lets you control (but not limited to) lights and blinds using physical buttons and phone app.
This part is using the snap store in order to have easy way to update all the devices software versions with new features and security updates.

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/cybear-jinni)
 


### Attention

* For now only NanoPi Duo2 is supported as smart device.

* You need to buy and solder the parts into the device yourself.

* The app is not in the play store so you will need to upload it to your phone with a little knowledge about [Flutter](https://flutter.dev).


## Disclaimers

**Use at Your Own Risk,**
**we do not take responsibility on any outcome using anything in this repo.**

The project is under heavy work and may contain bugs and incorrect instructions.