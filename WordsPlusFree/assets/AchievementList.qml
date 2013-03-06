import bb.cascades 1.0

Container {
    property alias model: achievementModel
    property alias list: achievementList
    property alias loader: loader
    layout: DockLayout {
    }
    ActivityIndicator {
        id: loader
        preferredHeight: 500
        preferredWidth: 720
        verticalAlignment: VerticalAlignment.Center
        horizontalAlignment: HorizontalAlignment.Center
    }
    ListView {
        id: achievementList
        dataModel: GroupDataModel {
            id: achievementModel
            grouping: ItemGrouping.None
            sortingKeys: [
                "order"
            ]
        }
        visible: false
        listItemComponents: [
            ListItemComponent {
                type: "item"
                content: Container {
                    Container {
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        ImageView {
                            preferredHeight: 100
                            preferredWidth: 100
                            imageSource: "asset:///scoreloop/SLAwards.bundle/" + ListItemData.image
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                        }
                        Container {
                            preferredWidth: 550
                            horizontalAlignment: HorizontalAlignment.Left
                            verticalAlignment: VerticalAlignment.Center
                            Label {
                                text: ListItemData.title
                                textStyle.base: SystemDefaults.TextStyles.TitleText
                            }
                            Label {
                                text: ListItemData.description
                                textStyle {
                                    base: SystemDefaults.TextStyles.SubtitleText
                                    //textStyle.color: Color.create("#555555")
                                    color: Color.create("#CC3F10")
                                }
                                multiline: true
                            }
                        }
                    }
                    Divider {
                    }
                }
            }
        ]
    }
}
