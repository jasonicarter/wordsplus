// Tabbed Pane project template
import bb.cascades 1.0
import bb.system 1.0
import bb.multimedia 1.0

Page {
    id: mainPage
    property int connectionError: 0
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
            onFinished: {
                wordsPlus.intializePlayArea();
            }
        },
        SystemToast {
            id: connectionToast
            body: "" //set in C++
            button.label: "OK"
            onFinished: {
                connectionError = 1;
            }
        },
        MediaPlayer {
            id: bgMusic
            sourceUrl: "asset:///sounds/background.wav"
        }
    ]
    onCreationCompleted: {
        if (wordsPlus.musicOn) {
            bgMusic.setRepeatMode(1);
            bgMusic.play();
        } else {
            //doing this to initialize player - hack i'm sure
            bgMusic.play();
            bgMusic.stop();
        }
        Application.thumbnail.connect(onThumbnailed);
        Application.fullscreen.connect(onFullscreen);
        Application.asleep.connect(onAsleep);
        wordsPlus.mainSysToastSignal.connect(mainPage.handleToastSignal)
        wordsPlus.scoreLoop().ConnectionError.connect(mainPage.handleConnectionToastSignal)
    }
    function onThumbnailed() {
        bgMusic.stop();
    }
    function onFullscreen() {
        if (wordsPlus.musicOn) {
            bgMusic.setRepeatMode(1);
            bgMusic.play();
        } else bgMusic.stop();
    }
    function onAsleep() {
        bgMusic.stop();
        wordsPlus.stopTimer();
    }
    function handleToastSignal(toastMessage) {
        mainSysToast.body = toastMessage;
        wordsPlus.stopTimer();
        mainSysToast.show();
    }
    function handleConnectionToastSignal(toastMessage) {
        connectionToast.body = toastMessage;
        connectionToast.show();
    }
}// Page
