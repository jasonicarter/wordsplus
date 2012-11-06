import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        background: Color.Black
        horizontalAlignment: HorizontalAlignment.Center
        Container {
            background: Color.create("#00629C")
            preferredWidth: 768
            Label {
                text: "To Clarify."
                textStyle {
                    base: bigTextNormalWhite.style
                }
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
            }
        }
        Container { //middle
            preferredWidth: 720
            preferredHeight: 900
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                topMargin: 50
                Container {
                    background: Color.create("#272727")
                    TextArea {
                        text: "Word Search:"
                        editable: false
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle {
                            base: bigBodyNormalWhite.style
                            color: Color.create("#0098f0")
                        }
                    }
                }
                TextArea {
                    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                    Cras leo purus, sagittis vitae iaculis ullamcorper, gravida egestas justo. 
                    Pellentesque vel sapien justo, vitae convallis nisl. 
                    Maecenas blandit, diam nec commodo vestibulum, purus enim bibendum nulla."
                    editable: false
                    touchPropagationMode: TouchPropagationMode.None
                    textStyle {
                        base: subTitleNormalBlue.style
                        color: Color.create("#0098f0")
                    }
                }
            }
            Container {
                topMargin: 50
                Container {
                    background: Color.create("#272727")
                    TextArea {
                        text: "By Location:"
                        editable: false
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle {
                            base: bigBodyNormalWhite.style
                            color: Color.create("#0098f0")
                        }
                    }
                }
                TextArea {
                    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras leo purus, sagittis vitae iaculis ullamcorper, gravida egestas justo. Pellentesque vel sapien justo, vitae convallis nisl. Maecenas blandit, diam nec commodo vestibulum, purus enim bibendum nulla."
                    editable: false
                    touchPropagationMode: TouchPropagationMode.None
                    textStyle {
                        base: subTitleNormalBlue.style
                        color: Color.create("#0098f0")
                    }
                }
            }
            Container {
                topMargin: 50
                Container {
                    background: Color.create("#272727")
                    TextArea {
                        text: "Challenges:"
                        editable: false
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle {
                            base: bigBodyNormalWhite.style
                            color: Color.create("#0098f0")
                        }
                    }
                }
                TextArea {
                    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                    Cras leo purus, sagittis vitae iaculis ullamcorper, gravida egestas justo. 
                    Pellentesque vel sapien justo, vitae convallis nisl. 
                    Maecenas blandit, diam nec commodo vestibulum, purus enim bibendum nulla."
                    editable: false
                    touchPropagationMode: TouchPropagationMode.None
                    textStyle {
                        base: subTitleNormalBlue.style
                        color: Color.create("#0098f0")
                    }
                }
            }
        }
        Container { //divider
            preferredWidth: 768
            preferredHeight: 50
            background: Color.create("#00629C")
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Center
        }
    }
    actions: [
        ActionItem {
            title: "Close"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                helpSheet.close();
            }
        }
    ]
}
