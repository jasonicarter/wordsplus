import bb.cascades 1.0

Container {
    layout: DockLayout {
    }
    background: Color.create("#272727")
    ImageView {
        horizontalAlignment: HorizontalAlignment.Center
        imageSource: "images/background_home.png"
    }
    Container {
        preferredHeight: 1280
        preferredWidth: 768
        HomeTopNavContainer {
            horizontalAlignment: HorizontalAlignment.Center
        }
        Container {
            preferredHeight: 980
        }
        HomeBtmNavContainer {
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
        }
    ]
}

