import bb.cascades 1.0

Container {
    preferredHeight: 980
    preferredWidth: 720
    //background: Color.Gray
    layout: DockLayout {
        
    }
    Container {
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Top
        preferredHeight: 100
        preferredWidth: 700
        //background: Color.Black
    }

    Container {
        objectName: "puzzlePlayContainer"
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
        preferredHeight: 700
        preferredWidth: 700
        //background: Color.Black
    }
}
