<h1 align="center">CyBear Jinni Smart Home</h1>

<div align="center">
  
[![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.png?v=103)](https://en.wikipedia.org/wiki/Open_source)
</div>

[<div align="center"><img alt="CyBear Jinni image" height="400" src="https://user-images.githubusercontent.com/9304740/95004821-f8417600-05f8-11eb-95bb-60a7863364e0.png"></div>](https://github.com/CyBear-Jinni/CBJ_Smart-Home)


# Welcome!

This repository let you **create** your own smart home.

Here at CyBear Jinni we give the community the power of smart home by providing the code and instructions to create a smart devices that will make ordinary devices like lamps and blinds smart and accessible.  

The devices can be controlled using physical buttons and from a smartphone app.

This is **not** project to create "Home automation system" like the project [Home Assistant](https://www.home-assistant.io).

<img src="https://i.imgur.com/jqDYnBm.gif" height="300">

## Project structure

The project is made out of two main parts:

### CyBear Jinni App

[CyBear Jinni App](https://github.com/CyBear-Jinni/CBJ_App.git) is the app to control your CyBear Jinni Smart Devices.
This is an Android and IOS app written in [Flutter](https://flutter.dev) that let you control all the devices using local Wi-Fi and remotely through Google [Cloud Firestore](https://firebase.google.com/docs/firestore).


### CyBear Jinni Smart Device

[CyBear Jinni Smart Device](https://github.com/CyBear-Jinni/CBJ_Smart-Device.git) is the smart device software installed on physical device.
It lets you control (but not limited to) lights and blinds using physical buttons and phone app.

Smart Device part is using the snap store in order to have easy way to install and update all the devices software versions with new features and security updates.

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/cybear-jinni)
 
### Attention

* For now only NanoPi Duo2 is supported as smart device.

* You need to buy and solder the parts into the device yourself.

* The app is not in the play store so you will need to upload it to your phone with a little knowledge about [Flutter](https://flutter.dev).

# Social Media Links

If you have any questions feel free to ask in our Discord server

[<img src="https://cdn.icon-icons.com/icons2/2108/PNG/512/discord_icon_130958.png" height="80">](https://discord.gg/mUXfwUY)

## Disclaimers

**Use at Your Own Risk,**
**we do not take responsibility on any outcome using anything in this repo.**

The project is under heavy work and may contain bugs and incorrect instructions.
