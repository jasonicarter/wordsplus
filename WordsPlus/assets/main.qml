// Tabbed Pane project template
import bb.cascades 1.0

Page {
    id: mainTab
    Menu.definition: MenuDefinition {
        helpAction: HelpActionItem {
            onTriggered: {
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
                    aboutSheet.open();
                }
            },
            ActionItem {
                title: "Category"
                onTriggered: {
                    aboutSheet.open();
                }
            },
            ActionItem {
                title: "Stats"
                onTriggered: {
                    aboutSheet.open();
                }
            }
        ]
    }
//    //matching #define values in WordsPlus.cpp
//        property int bbm_personalmessage: 6
//        property int bbm_statusmessage: 7
//        property int bbm_invitetodownload: 8
//        actions: [
//            ActionItem {
//                title: "Invite My Friends"
//                ActionBar.placement: ActionBarPlacement.OnBar
//                onTriggered: {
//                    wordsPlus.ControlsForBBM(bbm_invitetodownload);
//                }
//            },
//            ActionItem {
//                title: "I Love WordsPlus!"
//                ActionBar.placement: ActionBarPlacement.OnBar
//                onTriggered: {
//                    wordsPlus.ControlsForBBM(bbm_personalmessage);
//                }
//            },
//            ActionItem {
//                title: "I'm Busy Playing"
//                ActionBar.placement: ActionBarPlacement.OnBar
//                onTriggered: {
//                    wordsPlus.ControlsForBBM(bbm_statusmessage);
//                }
//            }
//        ]
}// Page
