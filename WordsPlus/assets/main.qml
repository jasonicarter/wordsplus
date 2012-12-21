// Tabbed Pane project template
import bb.cascades 1.0
import bb.system 1.0

Page {
    id: mainPage
    Menu.definition: MenuDefinition {
        helpAction: HelpActionItem {
            onTriggered: {
                wordsPlus.stopTimer();
                var mySheet = helpSheetDefinition.createObject();
                mySheet.open();
                //helpSheet.open();
            }
        }
        settingsAction: SettingsActionItem {
            onTriggered: {
                wordsPlus.stopTimer();
                var mySheet = settingsSheetDefinition.createObject();
                mySheet.open();
                //settingsSheet.open();
            }
        }
        actions: [
            ActionItem {
                title: "About"
                imageSource: "asset:///images/about.png"
                onTriggered: {
                    wordsPlus.stopTimer();
                    var mySheet = aboutSheetDefinition.createObject();
                    mySheet.open();
                    //aboutSheet.open();
                }
            },
            ActionItem {
                title: "Category"
                imageSource: "asset:///images/category.png"
                onTriggered: {
                    wordsPlus.stopTimer();
                    var mySheet = categorySheetDefinition.createObject();
                    mySheet.open();
                    //categorySheet.open();
                }
            },
            ActionItem {
                title: "Stats"
                imageSource: "asset:///images/trophy.png"
                onTriggered: {
                    wordsPlus.stopTimer();
                    var mySheet = statsSheetDefinition.createObject();
                    mySheet.open();
                    //statsSheet.open();
                }
            }
        ]
    }
    attachedObjects: [
        ComponentDefinition {
            id: aboutSheetDefinition
            Sheet {
                id: aboutSheet
                AboutSheet {
                }
            }
        },
        ComponentDefinition {
            id: helpSheetDefinition
            Sheet {
                id: helpSheet
                HelpSheet {
                }
            }
        },
        ComponentDefinition {
            id: settingsSheetDefinition
            Sheet {
                id: settingsSheet
                SettingsSheet {
                }
            }
        },
        ComponentDefinition {
            id: categorySheetDefinition
            Sheet {
                id: categorySheet
                CategorySheet {
                }
            }
        },
        ComponentDefinition {
            id: statsSheetDefinition
            Sheet {
                id: statsSheet
                StatsSheet {
                }
            }
        },
        SystemToast {
            id: mainSysToast
            body: "" //set in C++
            icon: "asset:///wordsplus.png"
            //position: TopCenter //'TopCenter'not working
            //button.label: "Play"
            onFinished: {
                wordsPlus.intializePlayArea();
                //mainSysToast.result = 1 for button selected
                //mainSysToast.result = 4 for toast timed out
//                if (mainSysToast.result == 1) { //using 'ButtonSelection' - not working
//                    wordsPlus.intializePlayArea();
//                }
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
