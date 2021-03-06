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
                wordsPlus.cntlyMenuOptions("help");
                helpSheet.open();
            }
        }
        settingsAction: SettingsActionItem {
            onTriggered: {
                wordsPlus.stopTimer();
                wordsPlus.cntlyMenuOptions("settings");
                settingsSheet.open();
            }
        }
        actions: [
            ActionItem {
                title: "About"
                imageSource: "asset:///images/about.png"
                onTriggered: {
                    wordsPlus.stopTimer();
                    wordsPlus.cntlyMenuOptions("about");
                    aboutSheet.open();
                }
            },
            ActionItem {
                title: "Category"
                imageSource: "asset:///images/category.png"
                onTriggered: {
                    wordsPlus.stopTimer();
                    wordsPlus.cntlyMenuOptions("category");
                    categorySheet.open();
                }
            },
            ActionItem {
                title: "Stats"
                imageSource: "asset:///images/trophy.png"
                onTriggered: {
                    wordsPlus.stopTimer();
                    wordsPlus.cntlyMenuOptions("stats");
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
            onFinished: {
                wordsPlus.intializePlayArea();
            }
        },
        SystemToast {
            id: connectionToast
            body: "" //set in C++
            //button.label: "OK"
            onFinished: {
                connectionError = 1;
            }
        },
        MediaPlayer {
            id: bgMusic
            sourceUrl: "sounds/background.wav"
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
        mainSysToast.button.label = "OK";
        wordsPlus.stopTimer();
        mainSysToast.show();
    }
    function handleConnectionToastSignal(toastMessage) {
        connectionToast.body = toastMessage;
        connectionToast.show();
    }
}// Page
