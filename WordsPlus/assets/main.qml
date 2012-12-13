// Tabbed Pane project template
import bb.cascades 1.0
import bb.system 1.0

Page {
    id: mainPage
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
                imageSource: "asset:///images/about.png"
                onTriggered: {
                    wordsPlus.stopTimer();
                    aboutSheet.open();
                }
            },
            ActionItem {
                title: "Category"
                imageSource: "asset:///images/category.png"
                onTriggered: {
                    wordsPlus.stopTimer();
                    categorySheet.open();
                }
            },
            ActionItem {
                title: "Stats"
                imageSource: "asset:///images/trophy.png"
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
        },
        SystemToast {
            id: mainSysToast
            body: "" //set in C++
            icon: "asset:///wordsplus.png"
            //position: TopCenter //'TopCenter'not working
            button.label: "Play"
            onFinished: {
                //mainSysToast.result = 1 for button selected
                //mainSysToast.result = 4 for toast timed out
                if (mainSysToast.result == 1) { //using 'ButtonSelection' - not working
                    wordsPlus.intializePlayArea();
                }
            }
        }
    ]
    onCreationCompleted: {
        wordsPlus.mainSysToastSignal.connect(mainPage.handleToastSignal)
    }
    function handleToastSignal(toastMessage) {
        mainSysToast.body = toastMessage;
        wordsPlus.stopTimer();
        mainSysToast.show();
    }
}// Page
