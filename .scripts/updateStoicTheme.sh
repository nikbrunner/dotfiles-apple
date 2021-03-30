#!/bin/bash

STOIC_REPO="git@github.com:nikbrunner/obsidian-stoic-theme"
STOIC_BUILD_BRANCH="#main"
STOIC_REPO_BUILD_PATH="$STOIC_REPO/build"

# OBSIDIAN_PATH="$HOME/Documents/Obsidian"
OBSIDIAN_PATH="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents"
PRIVATE_NOTES_PATH="$OBSIDIAN_PATH/notes" 
DEV_NOTES_PATH="$OBSIDIAN_PATH/dev-notes" 

THEMES_SUBSTRING=".obsidian/themes"
STOIC_FILE="Stoic.css"
STOIC_PUBLISH_FILE="publish.css"

PRIVATE_NOTES_STOIC_FILE="$PRIVATE_NOTES_PATH/$THEMES_SUBSTRING/$STOIC_FILE"
PRIVATE_NOTES_STOIC_PUBLISH_FILE="$PRIVATE_NOTES_PATH/$STOIC_PUBLISH_FILE"
DEV_NOTES_STOIC_FILE="$DEV_NOTES_PATH/$THEMES_SUBSTRING/$STOIC_FILE"
DEV_NOTES_STOIC_PUBLISH_FILE="$DEV_NOTES_PATH/$STOIC_PUBLISH_FILE"

echo ":: Removing old version of the Obsidian Stoic Theme"
if [ ! -f "$PRIVATE_NOTES_STOIC_FILE" ]; then
    echo "$PRIVATE_NOTES_STOIC_FILE not found!"
else 
    echo "Removing old file.. $PRIVATE_NOTES_STOIC_FILE"
    rm "$PRIVATE_NOTES_STOIC_FILE"
fi

if [ ! -f "$PRIVATE_NOTES_STOIC_PUBLISH_FILE" ]; then
    echo "$PRIVATE_NOTES_STOIC_PUBLISH_FILE not found!"
else 
    echo "Removing old file.. $PRIVATE_NOTES_STOIC_PUBLISH_FILE"
    rm "$PRIVATE_NOTES_STOIC_PUBLISH_FILE"
fi

if [ ! -f "$DEV_NOTES_STOIC_FILE" ]; then
    echo "$DEV_NOTES_STOIC_FILE not found!"
else 
    echo "Removing old file.. $DEV_NOTES_STOIC_FILE"
    rm "$DEV_NOTES_STOIC_FILE"
fi

if [ ! -f "$DEV_NOTES_STOIC_PUBLISH_FILE" ]; then
    echo "$DEV_NOTES_STOIC_PUBLISH_FILE not found!"
else 
    echo "Removing old file.. $DEV_NOTES_STOIC_PUBLISH_FILE"
    rm "$DEV_NOTES_STOIC_PUBLISH_FILE"
fi

echo ":: Get current updates version of the Obsidian Stoic Theme"
degit "$STOIC_REPO_BUILD_PATH/$STOIC_FILE$STOIC_BUILD_BRANCH" "$PRIVATE_NOTES_STOIC_FILE"
degit "$STOIC_REPO_BUILD_PATH/$STOIC_PUBLISH_FILE$STOIC_BUILD_BRANCH" "$PRIVATE_NOTES_STOIC_PUBLISH_FILE"

degit "$STOIC_REPO_BUILD_PATH/$STOIC_FILE$STOIC_BUILD_BRANCH" "$DEV_NOTES_STOIC_FILE"
degit "$STOIC_REPO_BUILD_PATH/$STOIC_PUBLISH_FILE$STOIC_BUILD_BRANCH" "$DEV_NOTES_STOIC_PUBLISH_FILE"