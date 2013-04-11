// Default empty project template
import bb.cascades 1.0

// creates one page with a label
Page {
    Menu.definition: MenuDefinition {
        helpAction: HelpActionItem {
            onTriggered: {
                helpSheet.open();
            }
        }
        settingsAction: SettingsActionItem {
            onTriggered: {
                settingsSheet.open();
            }
        }
        actions: [
            ActionItem {
                title: "About"
                imageSource: "images/about.png"
                onTriggered: {
                    aboutSheet.open();
                }
            },
            ActionItem {
                title: "Category"
                imageSource: "images/category.png"
                onTriggered: {
                    categorySheet.open();
                }
            },
            ActionItem {
                title: "Stats"
                imageSource: "images/trophy.png"
                onTriggered: {
                    statsSheet.open();
                }
            }
        ]
    }
    Container {
        background: Color.create("#272727")
        layout: DockLayout {
        }
        ImageView {
            horizontalAlignment: HorizontalAlignment.Center
            imageSource: "images/background.png"
        }
        Label {
            text: qsTr("Hello World")
            textStyle.base: SystemDefaults.TextStyles.BigText
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
        }
    }
    attachedObjects: [
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
        },
        Sheet {
            id: categorySheet
            CategorySheet {
            }
        },
        Sheet {
            id: statsSheet
            StatsSheet {
            }
        }
    ]
    onCreationCompleted: {
        Application.thumbnail.connect(onThumbnailed);
        Application.fullscreen.connect(onFullscreen);
        Application.asleep.connect(onAsleep);
    }
    function onThumbnailed() {
    }
    function onFullscreen() {
    }
    function onAsleep() {
    }

}

