import bb.cascades 1.0

Container {
    layout: DockLayout {

    }
    preferredHeight: 150
    preferredWidth: 720
    //background: Color.LightGray
    Container {
        layout: DockLayout {
        }
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Top
        ImageView {
            imageSource: "images/buttons/help_tools_about.png"
        }
        ImageView {
            id: help_selected
            visible: false
            imageSource: "images/buttons/help_selected.png"
        }
        ImageView {
            id: tools_selected
            visible: false
            imageSource: "images/buttons/tools_selected.png"
        }
        ImageView {
            id: about_selected
            visible: false
            imageSource: "images/buttons/about_selected.png"
        }
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            preferredHeight: 100
            preferredWidth: 720
            //background: Color.Red
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                preferredHeight: 100
                preferredWidth: 250
                //background: Color.Gray
                onTouch: {
                    if (event.isDown()) {
                        about_selected.visible = true
                    }
                    if (event.isUp()) {
                        about_selected.visible = false
                        aboutSheet.open();
                    }
                }
                onTouchExit: {
                    about_selected.visible = false
                }
            }
            Container {
                preferredHeight: 100
                preferredWidth: 250
                //background: Color.Green
                onTouch: {
                    if (event.isDown()) {
                        help_selected.visible = true
                    }
                    if (event.isUp()) {
                        help_selected.visible = false
                        helpSheet.open();
                    }
                }
                onTouchExit: {
                    help_selected.visible = false
                }
            }
            Container {
                preferredHeight: 100
                preferredWidth: 250
                //background: Color.Black
                onTouch: {
                    if (event.isDown()) {
                        tools_selected.visible = true
                    }
                    if (event.isUp()) {
                        tools_selected.visible = false
                        settingsSheet.open();
                    }
                }
                onTouchExit: {
                    tools_selected.visible = false
                }
            }

        }
    }
}