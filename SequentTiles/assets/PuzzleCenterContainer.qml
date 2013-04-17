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
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
        bottomPadding: 10
        Container {
            objectName: "puzzlePlayContainer"
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            preferredHeight: 638
            preferredWidth: 638     
            //background: Color.Black
        }
    }
}
