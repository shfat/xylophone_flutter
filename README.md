# Xylophone App 🎹

A simple and interactive Xylophone application built with **Flutter**.  
Users can play musical notes by tapping colorful keys on the screen.

This project demonstrates core Flutter concepts such as reusable widgets, layout structuring, and audio playback integration.

---

## Features

- 🎵 Play musical notes by tapping the keys
- 🎨 Gradient-colored interactive buttons
- ⚡ Smooth and responsive touch interaction
- ♻️ Reusable widget for generating keys
- 🔊 Audio playback using the `audioplayers` package

---

## Built With

- **Flutter**
- **Dart**
- **audioplayers**

---

## How It Works

Each key on the screen represents a musical note.  
When a user taps a key, the corresponding `.wav` file is played using the `audioplayers` package.

The keys are generated using a reusable widget that accepts:

- Two gradient colors
- Note number
- Note label

This approach keeps the UI scalable, clean, and easy to maintain.

---

## Learning Purpose

This project was created as part of my Flutter learning journey and was customized during implementation.

Concepts practiced in this project include:

- Flutter layout system (Column, Expanded, InkWell)
- Building reusable UI components
- Handling user interaction
- Playing local audio assets
