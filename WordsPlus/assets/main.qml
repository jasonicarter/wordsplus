// Tabbed Pane project template
import bb.cascades 1.0

TabbedPane {
    id: mainTab
    showTabsOnActionBar: true
    Menu.definition: MenuDefinition {
        // Add a Help action
        helpAction: HelpActionItem {
        }

        // Add a Settings action
        settingsAction: SettingsActionItem {
        }

        // Add any remaining actions
        actions: [
            ActionItem {
                title: "About"
                onTriggered: {
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
                        text: "Your Stats."
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                        textStyle {
                            base: bigTextNormalWhite.style
                        }
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
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle {
                            base: bigTextNormalWhite.style
                        }
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
            Page {
                Container {
                    background: Color.Black
                    layout: StackLayout {
                    }
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "Categories"
                        textStyle {
                            color: Color.create("#fafafa")
                            base: SystemDefaults.TextStyles.TitleText
                        }
                    }
                    Container {
                        verticalAlignment: VerticalAlignment.Top
                        preferredWidth: 720
                        layout: AbsoluteLayout {
                        }
                        RadioGroup {
                            id: radioGroup
                            layoutProperties: AbsoluteLayoutProperties {
                                positionX: 20
                                positionY: 55
                            }
                            Option {
                                id: radioOptionCategory
                                selected: true
                            }
                            Option {
                                id: radioOptionLocation
                            }
                            onSelectedIndexChanged: {
                                if (radioOptionCategory.selected == true) {
                                    byCategory.opacity = 1;
                                    byLocation.opacity = 0;
                                } else {
                                    byLocation.opacity = 1;
                                    byCategory.opacity = 0;
                                }
                            }
                        }
                        Label {
                            layoutProperties: AbsoluteLayoutProperties {
                                positionX: 120
                                positionY: 80
                            }
                            text: "By Category"
                            textStyle {
                                color: Color.create("#fafafa")
                                base: SystemDefaults.TextStyles.BodyText
                            }
                        }
                        Label {
                            layoutProperties: AbsoluteLayoutProperties {
                                positionX: 120
                                positionY: 220
                            }
                            text: "By Location"
                            textStyle {
                                color: Color.create("#fafafa")
                                base: SystemDefaults.TextStyles.BodyText
                            }
                        }
                    }
                }
                actions: [
                    ActionItem {
                        title: "Close"
                        ActionBar.placement: ActionBarPlacement.OnBar
                        onTriggered: {
                            aboutSheet.close();
                        }
                    }
                ]
            }
        } // Sheet
    ]
}// TabbedPane
