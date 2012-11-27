import bb.cascades 1.0

NavigationPane {
    id: nav
    Page {
        id: mainPage
        Container {
            background: tileBg.imagePaint
            layout: DockLayout {
            }
            Container {
                layout: DockLayout {
                }
                horizontalAlignment: HorizontalAlignment.Fill
                topPadding: 50.0
                Label {
                    id: welcomeUserLabel
                    textStyle.base: SystemDefaults.TextStyles.TitleText
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
            Container {
                layout: StackLayout {
                }
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    text: qsTr("Cascades Scoreloop Sample")
                    textStyle.base: SystemDefaults.TextStyles.TitleText
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                }
                Label {
                    text: "by James Paul Muir"
                    textStyle.base: SystemDefaults.TextStyles.BigText
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                }
                Label {
                    text: "http://redlightoflove.com"
                    textStyle.base: SystemDefaults.TextStyles.SubtitleText
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                }
                Container {
                    id: gameButtons
                    visible: false
                    horizontalAlignment: HorizontalAlignment.Center
                    Button {
                        text: "Play Game"
                        onClicked: {
                            var page = gameDef.createObject();
                            nav.push(page);
                        }
                    }
                    Button {
                        text: "Leaderboard"
                        onClicked: {
                            var page = leaderDef.createObject();
                            page.load = true;
                            nav.push(page);
                        }
                    }
                    Button {
                        text: "Achievements"
                    }
                    Button {
                        text: "Challenges"
                    }
                }
                ActivityIndicator {
                    id: mainLoader
                    running: true
                    preferredHeight: 500
                    preferredWidth: 500
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
        }
        attachedObjects: [
            ComponentDefinition {
                id: gameDef
                source: "Game.qml"
            },
            ComponentDefinition {
                id: achieveDef
                source: "Achievements.qml"
            },
            ComponentDefinition {
                id: leaderDef
                source: "TopLeaderboard.qml"
            },
            ComponentDefinition {
                id: challengeDef
                source: "Challenges.qml"
            }
        ]
        onCreationCompleted: {
            app.scoreLoop().RequestUserCompleted.connect(mainPage.onScoreloopLoaded);
        }
        function onScoreloopLoaded(username) {
            mainLoader.stop();
            mainLoader.visible = false;
            gameButtons.visible = true;
            welcomeUserLabel.text = qsTr("Welcome") + " " + username + "!"
        }
    }
    attachedObjects: [
        ImagePaintDefinition {
            id: tileBg
            repeatPattern: RepeatPattern.XY
            imageSource: "asset:///images/textured_stripes.amd"
        }
    ]
}
