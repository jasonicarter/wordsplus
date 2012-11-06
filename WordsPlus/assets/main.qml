// Tabbed Pane project template
import bb.cascades 1.0

TabbedPane {
    id: mainTab
    showTabsOnActionBar: true
    Menu.definition: MenuDefinition {
        helpAction: HelpActionItem {
            onTriggered: {
                wordsPlus.stopTimer();
                helpSheet.open();
            }
        }
        settingsAction: SettingsActionItem {
            onTriggered: {
                wordsPlus.stopTimer();
                settingsSheet.open();
            }
        }
        actions: [
            ActionItem {
                title: "About"
                onTriggered: {
                    wordsPlus.stopTimer();
                    aboutSheet.open();
                }
            }
        ]
    }
    Tab {
        title: "Start"
        imageSource: "asset:///images/menuicons/icon_home.png"
        HomeTab {
            id: homeTab
        }
        onTriggered: {
            wordsPlus.stopTimer();
        }
    } // tab

    // Puzzle tab
    Tab {
        title: "Play"
        imageSource: "asset:///images/menuicons/icon_browse.png"
        PlayPuzzlePage {
            id: puzzle
        }
        onTriggered: {
            wordsPlus.startTimer();
        }
    }

    // Stats from local storage and Score Loop
    Tab {
        title: "Review"
        imageSource: "asset:///images/menuicons/icon_favorites.png"
        ReviewTab {
        }
        onTriggered: {
            wordsPlus.stopTimer();
        }
    }

    // Score Loop challenges
    Tab {
        title: "Challenge"
        imageSource: "asset:///images/menuicons/icon_browse.png"
        Page {
            Container {
                layout: DockLayout {
                }
                background: Color.Black
                horizontalAlignment: HorizontalAlignment.Center
                Container {
                    background: Color.create("#00629C")
                    preferredWidth: 768
                    Label {
                        text: "And Brag."
                        textStyle {
                            base: bigTextNormalWhite.style
                        }
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                    }
                }
                Container { //divider
                    preferredWidth: 768
                    preferredHeight: 50
                    background: Color.create("#00629C")
                    verticalAlignment: VerticalAlignment.Bottom
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
        }
        onTriggered: {
            wordsPlus.stopTimer();
        }
    }
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: bigTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: bigBodyNormalWhite
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: subTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: subTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        Sheet {
            id: aboutSheet
            AboutSheet {
            }
        },
        Sheet {
            id: helpSheet
            HelpSheet {
            }
        },
        Sheet {
            id: settingsSheet
            SettingsSheet {
            }
        }
    ]
}// TabbedPane
