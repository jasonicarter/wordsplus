// Default empty project template
import bb.cascades 1.0
import bb.system 1.0

// creates one page with a label

Page {
    TextArea {
        id: shortcutText
        text: ""
    }

    actions: [
        ActionItem {
            id: action1
            title: "myActionTitle"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                shortcutText.text += " action1 ActionItem triggered\n"
            }

            shortcuts: [
                SystemShortcut {
                    type: SystemShortcuts.CreateNew
                    onTriggered: {
                        shortcutText.text += " action1 CreateNew 
                        shortcut triggered\n"
                    }
                }
            ]
        }
    ]
}
