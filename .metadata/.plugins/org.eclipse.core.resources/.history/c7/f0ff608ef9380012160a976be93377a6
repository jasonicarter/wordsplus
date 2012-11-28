import bb.cascades 1.0

Page {
    property bool load
    id: topLeaderboardPage
    titleBar: TitleBar {
        title: "Leaderboard"
    }
    content: Leaderboard {
        id: leaderboard
    }
    onLoadChanged: {
        if (load) {
            leaderboard.list.visible = false;
            leaderboard.loader.start();
            app.scoreLoop().LoadLeaderboardCompleted.connect(topLeaderboardPage.handleLeaderboard)
            app.loadLeaderboard();
        }
    }
    function handleLeaderboard(leaderboardData) {
        leaderboard.loader.stop();
        leaderboard.loader.visible = false;
        leaderboard.list.visible = true;
        leaderboard.model.clear();
        leaderboard.model.insertList(leaderboardData);
    }
}
