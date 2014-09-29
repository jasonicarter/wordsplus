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
            layout: DockLayout {
            }
            preferredHeight: 980
            preferredWidth: 720            
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                preferredWidth: 720
                bottomPadding: 15
                //background: Color.create("#0098f0")
                verticalAlignment: VerticalAlignment.Bottom
                Container {
                    layout: DockLayout {
                    }
                    preferredHeight: 60
                    preferredWidth: 370
                    rightPadding: 25                 
                    horizontalAlignment: HorizontalAlignment.Right
                    CheckBox {
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Right
                        checked: sequentTiles.isGuest
                        onCheckedChanged: {
                            sequentTiles.isGuest = checked
                        }
                    }
                    Label {
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "Guest Player"
                        textStyle {
                            textAlign: TextAlign.Center
                            base: SystemDefaults.TextStyles.BodyText
                            color: Color.create("#0098f0")
                        }
                    }
                }
            }
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
