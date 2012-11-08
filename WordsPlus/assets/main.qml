// Tabbed Pane project template
import bb.cascades 1.0

Page {
    id: mainTab
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
            },
            ActionItem {
                title: "Category"
                onTriggered: {
                    wordsPlus.stopTimer();
                    categorySheet.open();
                }
            },
            ActionItem {
                title: "Review"
                onTriggered: {
                    wordsPlus.stopTimer();
                    statsSheet.open();
                }
            }
        ]
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
}// Page
