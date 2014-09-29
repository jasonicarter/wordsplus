import bb.cascades 1.0

Container {
    preferredHeight: 980
    preferredWidth: 720
    //background: Color.Gray
    layout: DockLayout {
    }
    Container {
        layout: AbsoluteLayout {
        }
        preferredHeight: 980
        preferredWidth: 720
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
        //background: Color.Gray
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 42
                positionY: 162
            }
            Container {
                preferredHeight: 300
                preferredWidth: 300
                background: Color.create("#0098f0")         
            }
            onTouch: {
                if (event.isDown()) {
                }
                if (event.isUp()) {
                }
            }
            onTouchExit: {
                //do nothing
            }
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 379
                positionY: 162
            }
            Container {
                preferredHeight: 300
                preferredWidth: 300
                background: Color.create("#0098f0")
            }
            onTouch: {
                if (event.isDown()) {
                }
                if (event.isUp()) {
                }
            }
            onTouchExit: {
                //do nothing
            }
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 379
                positionY: 502
            }
            Container {
                id: resetHome
                preferredHeight: 300
                preferredWidth: 300
                background: Color.create("#0098f0")
                //background: Color.Red
            }
            onTouch: {
                if (event.isDown()) {
                }
                if (event.isUp()) {
                }
            }
            onTouchExit: {
                //do nothing
            }
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 42
                positionY: 502
            }
            Container {
                preferredHeight: 300
                preferredWidth: 300
                background: Color.create("#0098f0")             
            }
            onTouch: {
                if (event.isDown()) {
                }
                if (event.isUp()) {
                }
            }
            onTouchExit: {
                //do nothing
            }
        }
    }

}
